LIBPURPLE_CFLAGS = -I/usr/include/libpurple -I/usr/local/include/libpurple \
	-DPURPLE_PLUGINS -DENABLE_NLS -DHAVE_ZLIB \
	-I/usr/include/dbus-1.0 -I/usr/lib/dbus-1.0/include -Ipidgin/libpurple 
GLIB_CFLAGS = -pthread -I/usr/include/pidgin -I/usr/include/glib-2.0 \
	-I/usr/lib/glib-2.0/include
GLIB_LIBS = -Wl --export-dynamic -pthread -lgobject-2.0 -lgmodule-2.0 -ldl -lgthread-2.0 -lglib-2.0
COMPILER = gcc
GNOMESHELLPIDGIN_SOURCES=gnomeShellPidgin.c

install: gnomeShellPidgin.so
	cp -fv gnomeShellPidgin.so $(DESTDIR)/usr/lib/purple-2/gnomeShellPidgin.so

gnomeShellPidgin.so: ${GNOMESHELLPIDGIN_SOURCES}
	${COMPILER} ${LIBPURPLE_CFLAGS} -Wall ${GLIB_CFLAGS} -I. -g -O2 -pipe ${GNOMESHELLPIDGIN_SOURCES} -o gnomeShellPidgin.so -shared -fPIC -DPIC

clean:
	rm gnomeShellPidgin.so
    
all: gnomeShellPidgin.so
