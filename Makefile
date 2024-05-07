# Helper make file
BINARY:=anycubic-slicer
all: clean build install

.PHONY: clean
clean:
	@echo "Cleaning build files..."
	@rm -rf *.pkg.tar.xz *.zst *.zip pkg src *.log
	@echo "Done."

.PHONY: build
build:
	@updpkgsums ./PKGBUILD
	@multilib-build -c -- -- -Acsf .
	@makepkg --printsrcinfo > .SRCINFO

.PHONY: install
install:
	@updpkgsums ./PKGBUILD
	@makepkg -Ccip ./PKGBUILD --noconfirm

.PHONY: uninstall
uninstall:
	@sudo pacman -R $(BINARY) --noconfirm 
