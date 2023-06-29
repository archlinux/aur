FIRMWAREDIR = /lib/firmware

all:

install:
	install -d $(DESTDIR)$(FIRMWAREDIR)
	./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)

install-xz:
	install -d $(DESTDIR)$(FIRMWAREDIR)
	./copy-firmware.sh --xz $(DESTDIR)$(FIRMWAREDIR)

install-zst:
	install -d $(DESTDIR)$(FIRMWAREDIR)
	./copy-firmware.sh --zstd $(DESTDIR)$(FIRMWAREDIR)

