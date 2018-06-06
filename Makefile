all: libGLee.so

MAJOR=5
MINOR=4

SOURCES = $(shell find . -name "*.c")

CC?=$(CC)
CXX?=$(CXX)
SHARED_OBJS = $(SOURCES:.c=.shared.o)
STATIC_OBJS = $(SOURCES:.c=.static.o)

SHARED_CFLAGS+=-fPIC

LDFLAGS?= -Wl,-z,defs -Wl,--as-needed -Wl,--no-undefined
LIBS=-lGL

libGLee.so.$(MAJOR).$(MINOR): $(SHARED_OBJS)
	$(CXX) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -shared \
		-Wl,-soname,libGLee.so.$(MAJOR) \
		-o libGLee.so.$(MAJOR).$(MINOR) \
		$+ -o $@ $(LIBS)

libGLee.so: libGLee.so.$(MAJOR).$(MINOR)
	rm -f $@.$(MAJOR)
	ln -s $@.$(MAJOR).$(MINOR) $@.$(MAJOR)
	rm -f $@
	ln -s $@.$(MAJOR) $@

%.shared.o: %.cpp
	$(CXX) -o $@ -c $+ $(CFLAGS) $(CPPFLAGS) $(SHARED_CFLAGS)

%.shared.o: %.c
	$(CC) -o $@ -c $+ $(CFLAGS) $(CPPFLAGS) $(SHARED_CFLAGS)

%.so : %.o
	$(CXX) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -shared $^ -o $@

clean:
	rm -f $(SHARED_OBJS)
	rm -f $(FIXED_OBJS)
	rm -f *.so *.so* *~

DESTDIR=

install: libGLee.so
	install -d "$(DESTDIR)/usr/lib/"
	cp -a *.so* "$(DESTDIR)/usr/lib/"
	install -d "$(DESTDIR)/usr/include/"
	install -Dm644 *.h "$(DESTDIR)/usr/include/"
	install -d "$(DESTDIR)/usr/lib/pkgconfig/"
	install -Dm644 glee.pc "$(DESTDIR)/usr/lib/pkgconfig/"
	install -d  "$(DESTDIR)/usr/share/licenses/glee"
	sed '9,32!d' readme.txt > "$(DESTDIR)/usr/share/licenses/glee/LICENSE"
