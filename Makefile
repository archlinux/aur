# hfc - hosts file client
# See LICENSE file for copyright and license details.

CC = gcc
CFLAGS = -Wall -Wextra -std=c11 -D_POSIX_C_SOURCE=200809L
LDFLAGS = -lcurl -lncurses

PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man
VERSION = 0.0.1

SRCS = hfc.c get.c update.c config.c
OBJS = hfc.o get.o update.o config.o
TARGET = hfc

all: prepare $(TARGET)
prepare:
	mkdir -p $(HOME)/.config/hfc
	mkdir -p $(HOME)/.local/state
	touch $(HOME)/.config/hfc/urls
	touch $(HOME)/.config/hfc/conf
	touch $(HOME)/.local/state/counts

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

install:
	mkdir -p ${DESTDIR}${PREFIX}/bin
	install -Dm755 ./$(TARGET) ${DESTDIR}${PREFIX}/bin/$(TARGET)
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < hfc.1 > ${DESTDIR}${MANPREFIX}/man1/hfc.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/hfc.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/$(TARGET)
	rm -f ${DESTDIR}${MANPREFIX}/man1/hfc.1

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean install uninstall prepare

