# $Id: Makefile.in 110 2012-02-13 03:07:47Z gyunaev $
CC = i686-w64-mingw32-gcc
CFLAGS = -Wall -DIN_BUILDING_LIBIRC -g -O3 -DENABLE_THREADS -D_REENTRANT -DWIN32_DLL
AR=i686-w64-mingw32-ar cr
RANLIB=i686-w64-mingw32-ranlib
INCLUDES=-I../../include
DESTDIR=
APIVERSION = 1

OBJS = ../../src/libircclient.o

all: static shared_mingw

static: libircclient.a
shared_mingw: libircclient.dll

libircclient.dll: $(OBJS)
	$(CC) -shared -s -o libircclient.dll -Wl,-out-implib,libircclient.dll.a $(OBJS) ../../src/libircclient.def -lkernel32 -lwsock32  -lz -lwsock32 -lgdi32 -lkernel32

libircclient.a: $(OBJS)
	$(AR) libircclient.a $(OBJS)
	$(RANLIB) libircclient.a


.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<
# $Id: Makefile 84 2009-01-10 01:37:29Z chromerium $
