TARGET  = numlockl
SRCS    = numlockl.c
OBJS    = $(SRCS:.c=.o)
LIBS    = -lbsd
CPPFLAGS+=-Wall
prefix = /usr
exec_prefix = ${prefix}
bindir=${exec_prefix}/bin
INSTALL= /usr/bin/install -c


$(TARGET): $(OBJS)
	$(CC) -o $@ $< $(LIBS) $(LDFLAGS)

$(OBJS): $(SRCS)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $(SRCS)

.PHONY: clean
clean:
	rm -f $(OBJS)

install: $(TARGET)
	$(INSTALL) -s $(TARGET) $(bindir)

uninstall:
	rm -i $(bindir)/$(TARGET)


