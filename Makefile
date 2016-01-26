SOURCES := ramspeed.c

ifeq ($(CARCH),i686)
SOURCES += $(wildcard i386/*.s) $(wildcard i386/cpuinfo/*.s)
CPPFLAGS += -DI386_ASM
else ifeq ($(CARCH),x86_64)
SOURCES += $(wildcard amd64/*.s)
CPPFLAGS += -DAMD64_ASM
else
SOURCES += fltmem.c intmem.c fltmark.c intmark.c
endif

CPPFLAGS += -DLinux
CFLAGS += -O3

ramspeed: $(SOURCES)
	echo $(CARCH)
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $^ -o $@

clean:
	rm -f *.o ramspeed
