# Makefile for gladtex

BINPATH = /usr/local/bin
MANPATH = /usr/local/share/man/man1

CC = gcc -O2 -DGIF
LIB = -lm -lz -lgif -lpng
OBJ = eqn2img.o
POD2MAN = pod2man

all:		${OBJ} gladtex.1
		${CC} -o eqn2img ${LIB} ${OBJ}

eqn2img.o:	eqn2img.c
		${CC} -c eqn2img.c

gladtex.1:	gladtex.pod
		${POD2MAN} -c "User Commands" -r gladtex gladtex.pod > gladtex.1

install:	all
		install -d ${BINPATH}
		install -d ${MANPATH}
		install -m 755 eqn2img ${BINPATH}/eqn2img
		install -m 755 gladtex ${BINPATH}/gladtex
		install -m 644 gladtex.1 ${MANPATH}/gladtex.1

clean:		
		rm -f *.o core
