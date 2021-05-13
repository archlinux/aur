#
# $Log: Makefile,v $
# Revision 1.2  1999/08/19 17:58:51  carsten
# Almost final version
#
# Revision 1.1  1999/08/15 15:38:09  carsten
# Added wmwave project to repository

LIBDIR = -L/usr/X11R6/lib
LIBS   = -lXpm -lXext -lX11 -lm
FLAGS = $(CFLAGS) -fcommon
OBJS =	 \
		wmgeneral.o \

default:all

.c.o:
	$(CC) -I/usr/X11R6/share/include $(FLAGS) -c -Wall $< -o $*.o

wmwave.o: wmwave.c wmwave-master.xpm
	$(CC) -I/usr/X11R6/share/include $(FLAGS) -c -Wall wmwave.c -o $*.o

wmwave: $(OBJS) wmwave.o
	$(CC) $(FLAGS) -o wmwave $(OBJS) -lXext $(LIBDIR) $(LIBS) wmwave.o

all:: wmwave

clean::
	rm -f *.o
	rm -f wmwave 
	rm -f *~

install:: wmwave
	mkdir -p $(DESTDIR)/usr/bin/
	cp -f wmwave $(DESTDIR)/usr/bin/
	chmod 755 $(DESTDIR)/usr/bin/wmwave
	chown root:root $(DESTDIR)/usr/bin/wmwave
	mkdir -p $(DESTDIR)/usr/share/man/man1/
	cp -f wmwave.1 $(DESTDIR)/usr/share/man/man1/
	chmod 644 $(DESTDIR)/usr/share/man/man1/wmwave.1
	chown root:root $(DESTDIR)/usr/share/man/man1/wmwave.1
