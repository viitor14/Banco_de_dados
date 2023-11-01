create database reserva_de_hospedagem;

use reserva_de_hospedagem;

create table Nacionalidade(
Sigla varchar(2),
Nome varchar (50),
primary key (Sigla));

create table Cliente(
Cod_cli int not null auto_increment,
Nome_cli varchar(50) not null,
Telefone varchar(11) not null,
Cpf varchar(11) not null,
Passaporte varchar(20) not null,
Documento varchar(20) not null,
primary key (Cod_cli));

create table tem(
Sigla varchar (2),
Cod_cli int not null auto_increment,
foreign key (Sigla) references Nacionalidade(Sigla),
foreign key (Cod_cli) references Cliente(Cod_cli));

create table Tipo_quarto(
Cod_tipo_qua varchar(5) not null,
Desc_tipo varchar(50) not null,
Val_Tipo_qua varchar (50) not null,
primary key(Cod_tipo_qua));

create table Quarto(
Num_qua int not null,
Andar int not null,
Cod_tipo_qua varchar(5),
primary key(Num_qua),
foreign key(Cod_tipo_qua) references Tipo_quarto(Cod_tipo_qua));

create table Operadora(
Cod_ope varchar(10) not null,
Nom_ope varchar(60) not null,
primary key(Cod_ope));

create table Reserva(
Num_Res varchar(3) not null,
Num_cartao varchar(20) not null,
Qtd_dia varchar(4) not null,
Dat_Res date not null,
Dat_inic date not null,
_Status varchar(20) not null,
Cod_cli int,
Cod_tipo_qua varchar(10),
Cod_ope varchar(10),
foreign key(Cod_cli) references cliente (Cod_cli),
foreign key (Cod_tipo_qua) references Tipo_quarto(Cod_tipo_qua),
foreign key (Cod_ope) references Operadora (Cod_ope));

Insert into Nacionalidade(Sigla,Nome)values
('BR','Brasil'),
('UK','Reino Unido');

insert into cliente(Nome_cli,Telefone,Cpf,Passaporte,Documento)values
('Juliana Gomes','985422265','65987544782','6325','685598'),
('Vitor','985642549','36595844497','2654','985647');

insert into tem(Sigla,Cod_cli)values
('BR','2'),
('UK','1');

insert into tipo_quarto(Cod_tipo_qua,Desc_tipo,Val_Tipo_qua)values
('1','Quarto Famalia','R$135,00'),
('2','Quarto Casal','R$64,00');
									
insert into Quarto(Num_qua,Andar,Cod_tipo_qua) values						
(4,1,'2'),
(6,1,'1');

insert into operadora(Cod_ope,Nom_ope)values
('985','MasterCard'),
('354','MasterCard');

insert into Reserva(Num_Res,Num_cartao,Qtd_dia,Dat_res,Dat_inic,_Status,Cod_cli,Cod_tipo_qua,Cod_ope)values
('1','6632895637914527','14','2023-06-02','2023-07-01','Aguardando Pagamento',1,'1','985'),
('2','5638788854321547','5','2023-05-14','2023-06-05','Pago',2,'2','354');
-- values('Num_Res','Num_cartao','Qtd_dia','Dat_res','Dat_inic','_Status','Cod_cli','Cod_tipo_qua','Cod_ope')

select * from nacionalidade;
select * from tem;
select * from cliente;
select * from tipo_quarto;
select * from Quarto;
select * from operadora;
select * from reserva;

SELECT cliente.Cpf AS CPF, 								-- tabela1.coluna AS é o nome da coluna que vai ser 'substituido' quando der select
cliente.Nome_cli AS Nome,
cliente.Telefone,
cliente.Passaporte,
cliente.Documento,
reserva.Num_Res AS Numero_da_Reserva, 					
reserva.Num_cartao AS Numero_do_Cartao,
reserva.Qtd_dia AS Quantidades_Dias,
reserva.Dat_Res AS Data_Reservada,
reserva.Dat_inic AS Data_Iniciada,
reserva._Status AS Situação,
reserva.Cod_cli AS Codigo_Cliente,
reserva.Cod_tipo_qua AS Codigo_Tipo_Quarto,
reserva.Cod_ope AS Codigo_Operadora						-- antes do from nao coloca virgula
FROM cliente 											-- tabela 1
INNER JOIN reserva 										-- tabela 2
ON cliente.Cod_cli = reserva.Cod_cli;

