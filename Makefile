LDFLAGS = -s -rdynamic -lm -ldl -Wl,-z,relro,-z,now,-z,shstk
CFLAGS = -O2 -I.
CFLAGS += '-DS7_LOAD_PATH="/usr/lib/s7"'

all: s7 libc_s7.so

libs7.so: s7.c
	$(CC) -fPIC -shared -o $@ $(CFLAGS) $(LDFLAGS) $<

s7: repl.c libs7.so
	$(CC) -L. -ls7 -o $@ $(CFLAGS) $(LDFLAGS) $<

libc_s7.so: s7 libc.scm
	LD_LIBRARY_PATH=. ./s7 libc.scm
