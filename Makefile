PREFIX  ?= /usr
LDLIBS   = -lX11 -ljpeg -lm
SRC      = $(wildcard *.cpp)
LINK.o   = $(LINK.cc)

xpuz : $(SRC:.cpp=.o)

install :
	install -Dm755 xpuz $(DESTDIR)$(PREFIX)/bin/xpuz
	install -Dm755 xpuz.6.gz $(DESTDIR)$(PREFIX)/share/man/man6/xpuz.6.gz
