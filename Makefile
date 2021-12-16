# Helper make file
BINARY:=gk6x-bin

all: clean build install

.PHONY: clean
clean:
	@echo "Cleaning build files..."
	@rm -rf *.pkg.tar.xz *.zst *.zip pkg src
	@echo "Done."

.PHONY: build
build:
	@updpkgsums ./PKGBUILD
	@makepkg -fp ./PKGBUILD --noconfirm
	@makepkg --printsrcinfo > .SRCINFO

.PHONY: install
install:
	@updpkgsums ./PKGBUILD
	@makepkg -Ccip ./PKGBUILD --noconfirm

.PHONY: uninstall
uninstall:
	@sudo pacman -R $(BINARY) --noconfirm 
