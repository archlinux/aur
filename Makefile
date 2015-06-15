PROJECT = aesthe
USR_PATH = $(PKGDIR)/usr
INSTALL_OPTS = -o root -g root -v
INSTALL_OPTS_2 = $(INSTALL_OPTS_BIN) -m 644

all:
	cd src; make all

clean:
	cd src; make clean

run:
	cd src; make run

runexamples:
	cd src; make runexamples

install: all uninstall
	install -d $(USR_PATH)/bin
	install -d $(USR_PATH)/share
	install $(INSTALL_OPTS) -d $(USR_PATH)/share/$(PROJECT)
	install $(INSTALL_OPTS) -d $(USR_PATH)/share/$(PROJECT)/image
	install $(INSTALL_OPTS) -d $(USR_PATH)/share/$(PROJECT)/image/example
	install $(INSTALL_OPTS) -d $(USR_PATH)/share/$(PROJECT)/model
	install $(INSTALL_OPTS) -d $(USR_PATH)/share/$(PROJECT)/model/example
	install $(INSTALL_OPTS) -d $(USR_PATH)/share/$(PROJECT)/script
	install $(INSTALL_OPTS) -d $(USR_PATH)/share/$(PROJECT)/script/example
	install $(INSTALL_OPTS) bin/aesthe $(USR_PATH)/bin
	install $(INSTALL_OPTS_2) image/*.ppm $(USR_PATH)/share/$(PROJECT)/image
	install $(INSTALL_OPTS_2) image/example/*.ppm $(USR_PATH)/share/$(PROJECT)/image/example
	install $(INSTALL_OPTS_2) model/example/*.aexi $(USR_PATH)/share/$(PROJECT)/model/example
	install $(INSTALL_OPTS_2) script/*.lua $(USR_PATH)/share/$(PROJECT)/script
	install $(INSTALL_OPTS_2) script/example/*.lua $(USR_PATH)/share/$(PROJECT)/script/example

uninstall:
	rm -f $(USR_PATH)/bin/aesthe
	rm -rf $(USR_PATH)/share/$(PROJECT)


