build:
	makepkg -f

install:
	sudo pacman --noconfirm -U yubihsm2-sdk-*.pkg.tar.*

clean:
	rm -rf pkg src
	rm -rf yubihsm2-sdk*

update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

generate-checksums:
	makepkg -g -f -p PKGBUILD
