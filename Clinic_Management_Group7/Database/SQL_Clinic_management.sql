Create database WebES
go
use WebES
go
create table Equipment
(
    ID varchar(50) primary key not null,
	Name nvarchar(200) not null,
	Eq_Date date default(getDate()),
	Unit nvarchar(100) not null,
	Price float not null,
	Quantity int not null,
	Picture nvarchar(200) null,
	Producer nvarchar(200) not null,
	Origin_Production nvarchar(200) not null,
	Status int null,
)
go
create table Type_Medicine
(
    ID int primary key identity,
	Name nvarchar(200) not null,
	Status int null, 
)
go
create table Medicine
(
    ID varchar(50) primary key not null,
	Name nvarchar(200) not null,
	Quantity int not null,
	Price float not null,
	Producer nvarchar(200) not null,
	Origin_Production nvarchar(200) not null,
	Manufacturing_Date date default(getDate()),
	ExpiryDate date default(getDate()),
	Picture nvarchar(200) null,
	Description text null,
	Status int null, 
	ID_Type int foreign key references Type_Medicine(ID),
)
go
create table Employee
(
    ID varchar(50) primary key not null,
	Name nvarchar(200) not null,
	Email varchar(100) not null,
	Phone varchar(100) not null,
	Address nvarchar(100) not null,
	Brithday date default(getDate()),
	Certificate nvarchar(100) null,
	Position nvarchar(100) null,
	Gender bit not null,
	Majors nvarchar(100) null,
	Picture nvarchar(200) null,
	Status int null,
)
go
create table Subject
(
    ID int primary key identity,
	Name nvarchar(200) not null,
	Status int null, 
)
go
create table Lecture
(
    ID varchar(50) primary key,
	Title nvarchar(200) not null,
	Content text not null,
	Link nvarchar(100) null,
	Picture nvarchar(200) null,
	Price float null,
	Date_occurrence datetime default(getDate()),
	Status int null,
	ID_Subject int foreign key references Subject(ID),
	ID_Employee varchar(50) null,
	foreign key (ID_Employee) references Employee(ID),
)
go
create table Customer
(
    ID int primary key identity,
	Name nvarchar(200) not null,
	Email varchar(100) not null,
	Phone varchar(100) not null,
	Address varchar(100) not null,
	Password varchar(50) null,
	Brithday date default(getDate()),
	Gender bit not null,
	Picture nvarchar(200) null,
	Status int null,
)
go
create table Feedback
(
    ID int primary key identity,
	ID_Customer int foreign key references Customer(ID),
	Content text not null,
)
go
create table Orders
(
    ID int primary key identity,
	Total_price float not null,
	Order_date datetime default(getDate()),
	Status int null,
	ID_Customer int foreign key references Customer(ID),
)
go
create table Order_Detail
(
    ID int primary key identity,
	ID_Order int null,
	ID_Product varchar(50) not null,
	Price float null,
	Quantity int null,
	Unit nvarchar(100) null,
	Detail_Date datetime default(getDate()),
	foreign key (ID_Order) references Orders(ID),
	foreign key (ID_Product) references Medicine(ID),
	foreign key (ID_Product) references Lecture(ID),
	foreign key (ID_Product) references Equipment(ID),
)
go
create table Banner
(
    ID int primary key identity,
	Title nvarchar(200) not null,
	Content text not null,
	Picture nvarchar(200) null,
	Link nvarchar(100) null,
	Status int null,
)

