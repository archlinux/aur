CC = gcc
CFLAGS = -DZLIB -lz
EXE = bdiff behead dasm6502 dasmz80 fam2fds fdslist gbalist gbdasm gblist neslist undouble
DESTDIR = /usr/local/bin

all: $(EXE) 

bdiff:
	$(CC) $(CFLAGS) -o bdiff bdiff.c

behead:
	$(CC) $(CFLAGS) -o behead behead.c

dasm6502:
	$(CC) $(CFLAGS) -o dasm6502 dasm6502.c

dasmz80:
	$(CC) $(CFLAGS) -o dasmz80 dasmz80.c

fam2fds:
	$(CC) $(CFLAGS) -o fam2fds fam2fds.c

fdslist:
	$(CC) $(CFLAGS) -o fdslist fdslist.c

gbalist: GBACarts.c GBACarts.h
	$(CC) $(CFLAGS) -o gbalist gbalist.c GBACarts.c

gbdasm: GBCarts.c GBCarts.h
	$(CC) $(CFLAGS) -o gbdasm gbdasm.c GBCarts.c

gblist: GBCarts.c GBCarts.h
	$(CC) $(CFLAGS) -o gblist gblist.c GBCarts.c

neslist: NESCarts.c NESCarts.h
	$(CC) $(CFLAGS) -o neslist neslist.c NESCarts.c

undouble:
	$(CC) $(CFLAGS) -o undouble undouble.c

clean:
	rm $(EXE) 

install:
	cp $(EXE) $(DESTDIR)

