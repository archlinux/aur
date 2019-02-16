# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html

.PHONY: lint build install

PACKAGE := altogether-*.pkg.tar.xz

init:
	sudo chown -R aur:wheel /home/aur

lint:
	namcap PKGBUILD

build:
	makepkg
	makepkg --printsrcinfo > .SRCINFO
	namcap $(PACKAGE)

install:
	sudo pacman -U --noconfirm $(PACKAGE)

include *.mk
