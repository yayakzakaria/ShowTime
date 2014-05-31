unit UTIme;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    GetDate: TDateTime;
    procedure ShowTime;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DateUtils;

{$R *.dfm}

procedure TForm1.ShowTime;
const
  Hari: array[1..7] of String = ('Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum''at', 'Sabtu');
  Pasaran: array[0..4] of String = ('Kliwon', 'Legi', 'Pahing', 'Pon', 'Wage');
var
  Th, Bln, Hr: Word;
begin
  DecodeDate(GetDate, Th, Bln, Hr);
  Label1.Caption := IntToStr(Hr);
  Label2.Caption := IntToStr(Bln);
  Label3.Caption := IntToStr(Th);
  Form1.Caption := 'Waktu Sekarang : ' + UpperCase(Hari[DayOfWeek(GetDate)]) + ' ' + UpperCase(Pasaran[Trunc(GetDate - EncodeDate(2014, 1, 1)) mod 5]);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ShowTime;
  Label4.Caption := FormatDateTime('hh:mm:ss', Now);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  GetDate := Date;
  ShowTime;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  GetDate:= IncDay(GetDate, 1);
  ShowTime;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  GetDate:= IncDay(GetDate, -1);
  ShowTime;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  GetDate := Date;
  ShowTime;
  Label4.Caption := FormatDateTime('hh:mm:ss', Now);
end;

end.


