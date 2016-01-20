CC=gcc
PREFIX=/usr
BINDIR=$(PREFIX)/bin
DESTDIR=
BIN=gtkrc-reload
CFLAGS=`pkg-config --cflags --libs gdk-2.0`

all: $(BIN)

$(BIN):
	@$(CC) $(BIN).c $(CFLAGS) -o $(BIN)

install:
	mkdir -p $(DESTDIR)$(BINDIR)
	install -Dm755 $(BIN) $(DESTDIR)$(BINDIR)

clean:
	@rm -f $(BIN)
