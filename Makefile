TARGET  = numlockl
SRCS    = numlockl.c strlcat.c
OBJS    = $(SRCS:.c=.o)
LIBS    = 
CPPFLAGS+= -Wall
LDFLAGS+= 
prefix = /usr
exec_prefix = ${prefix}
bindir=${exec_prefix}/bin
INSTALL= /usr/bin/install


$(TARGET): $(OBJS)
	$(CC) -o $@ $^ $(LIBS) $(LDFLAGS)

$(OBJS): $(SRCS)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $(SRCS)

.PHONY: clean
clean:
	rm -f $(OBJS)

install: $(TARGET)
	strip --strip-all $(TARGET)
	$(INSTALL) -Ds $(TARGET) $(bindir)

uninstall:
	rm -i $(bindir)/$(TARGET)


