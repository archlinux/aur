GCC = $(CROSS_COMPILE)gcc
SYS := $(shell $(GCC) -dumpmachine)
ifneq (, $(findstring x86_64, $(SYS)))
	OSFLAGS = -Ofast -fPIC -march=native -mtune=native -mfpmath=sse -Wconversion -Wunreachable-code -Wstrict-prototypes 
endif
ifneq (, $(findstring arm, $(SYS)))
	ifneq (, $(findstring gnueabihf, $(SYS)))
		OSFLAGS = -Ofast -mfloat-abi=hard -mfpu=vfp -march=armv6 -Wconversion -Wunreachable-code -Wstrict-prototypes 
	endif
	ifneq (, $(findstring gnueabi, $(SYS)))
		OSFLAGS = -Ofast -mfloat-abi=hard -mfpu=vfp -march=armv6 -Wconversion -Wunreachable-code -Wstrict-prototypes 
	endif	
	ifneq (, $(findstring gnueabisf, $(SYS)))
		OSFLAGS = -Ofast -mfloat-abi=soft -mfpu=vfp -march=armv6 -Wconversion -Wunreachable-code -Wstrict-prototypes 
	endif
endif
ifneq (, $(findstring amd64, $(SYS)))
	OSFLAGS = -O3 -fPIC -march=native -mtune=native -mfpmath=sse -Wno-conversion
endif
GIT_HASH := $(shell git describe --always)
CFLAGS = -ffast-math $(OSFLAGS) -Wfloat-equal -Wshadow -Wpointer-arith -Wcast-align -Wstrict-overflow=5 -Wwrite-strings -Waggregate-return -Wcast-qual -Wswitch-default -Wswitch-enum -Wformat=2 -g -Wall -I. -isystem.. -Ilibs/pilight/ -Ilibs/protocols/ -Ilibs/hardwares/ -pthread -lm -DHASH=\"$(GIT_HASH)\"
SUBDIRS = libs/pilight libs/protocols libs/hardwares libs/websockets
SRC = $(wildcard *.c)
INCLUDES = $(wildcard protocols/*.h) $(wildcard protocols/*.c) $(wildcard hardwares/*.h) $(wildcard hardwares/*.c) $(wildcard libs/pilight/*.h) $(wildcard libs/websockets/*.c) $(wildcard libs/websockets/*.h) $(wildcard libs/websockets/*.c)
PROGAMS = $(patsubst %.c,pilight-%,$(SRC))
LIBS = libs/pilight/pilight.o libs/protocols/protocols.o libs/hardwares/hardwares.o libs/websockets/websockets.o

.PHONY: subdirs $(SUBDIRS)

subdirs: $(SUBDIRS) all

$(SUBDIRS):
	$(MAKE) -C $@

all: $(LIBS) libpilight.so libpilight.a $(PROGAMS) 

libpilight.so: $(LIBS)
	$(GCC) $(LIBS) -shared -o libpilight.so -lpthread -lm -ldl
	
libpilight.a: $(LIBS)
	$(CROSS_COMPILE)ar -rsc libpilight.a $(LIBS)

pilight-daemon: daemon.c $(INCLUDES) $(LIBS) libpilight.so
	$(GCC) $(CFLAGS) -o $@ $(patsubst pilight-%,%.c,$@) libpilight.so

pilight-send: send.c $(INCLUDES) $(LIBS) libpilight.so
	$(GCC) $(CFLAGS) -o $@ $(patsubst pilight-%,%.c,$@) libpilight.so

pilight-receive: receive.c $(INCLUDES) $(LIBS) libpilight.so
	$(GCC) $(CFLAGS) -o $@ $(patsubst pilight-%,%.c,$@) libpilight.so

pilight-debug: debug.c $(INCLUDES) $(LIBS) libpilight.so
	$(GCC) $(CFLAGS) -o $@ $(patsubst pilight-%,%.c,$@) libpilight.so

pilight-learn: learn.c $(INCLUDES) $(LIBS) libpilight.so
	$(GCC) $(CFLAGS) -o $@ $(patsubst pilight-%,%.c,$@) libpilight.so

pilight-control: control.c $(INCLUDES) $(LIBS) libpilight.so
	$(GCC) $(CFLAGS) -o $@ $(patsubst pilight-%,%.c,$@) libpilight.so

pilight-raw: raw.c $(INCLUDES) $(LIBS) libpilight.so
	$(GCC) $(CFLAGS) -o $@ $(patsubst pilight-%,%.c,$@) libpilight.so
	
install:
	install -Ddm 0755 -d $(DESTDIR)usr/lib/pilight
	install -Ddm 0755 -d $(DESTDIR)usr/bin
	install -Ddm 0755 -d $(DESTDIR)etc/pilight
	install -Ddm 0755 -d $(DESTDIR)usr/share/webapps/pilight
	install -Dm 0655 pilight-daemon $(DESTDIR)usr/bin/
	install -Dm 0655 pilight-send $(DESTDIR)usr/bin/
	install -Dm 0655 pilight-receive $(DESTDIR)usr/bin/
	install -Dm 0655 pilight-control $(DESTDIR)usr/bin/
	install -Dm 0655 pilight-debug $(DESTDIR)usr/bin/
	install -Dm 0655 pilight-learn $(DESTDIR)usr/bin/
	install -Dm 0655 pilight-raw $(DESTDIR)usr/bin/
	install -Dm 0655 libpilight.so $(DESTDIR)usr/lib/pilight/
	install -Dm 0655 libpilight.a $(DESTDIR)usr/lib/pilight/
	install -Dm 0644 settings.json-default $(DESTDIR)etc/pilight/settings.json
	install -Dm 0644 web/index.html $(DESTDIR)usr/share/webapps/pilight/
	install -Dm 0644 web/pilight.css $(DESTDIR)usr/share/webapps/pilight/
	install -Dm 0644 web/pilight.js $(DESTDIR)usr/share/webapps/pilight/
	install -Dm 0644 web/favicon.ico $(DESTDIR)usr/share/webapps/pilight/
	install -Dm 0644 web/logo.png $(DESTDIR)usr/share/webapps/pilight/
	install -Dm 0644 web/battery_green.png $(DESTDIR)usr/share/webapps/pilight/
	install -Dm 0644 web/battery_red.png $(DESTDIR)usr/share/webapps/pilight/
	install -Dm 0644 web/apple-touch-icon-iphone-retina-display.png $(DESTDIR)usr/share/webapps/pilight/
	install -Dm 0644 web/apple-touch-icon-ipad.png $(DESTDIR)usr/share/webapps/pilight/
	install -Dm 0644 web/apple-touch-icon-iphone.png $(DESTDIR)usr/share/webapps/pilight/	

	mv $(DESTDIR)usr/lib/pilight/libpilight.so $(DESTDIR)usr/lib/pilight/libpilight.so.2
	ln -sf /usr/lib/pilight/libpilight.so.2 $(DESTDIR)usr/lib/libpilight.so
	
clean:
	rm pilight-* >/dev/null 2>&1 || true
	rm *pilight*.so* >/dev/null 2>&1 || true
	rm *pilight*.a* >/dev/null 2>&1 || true
	$(MAKE) -C libs/protocols/ $@;
	
dist-clean:
	rm pilight-* >/dev/null 2>&1 || true
	rm *pilight*.so* >/dev/null 2>&1 || true
	rm *pilight*.a* >/dev/null 2>&1 || true
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir $@; \
	done
