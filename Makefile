PKG := elftosb-bin
_PKG := elftosb

build:
	makepkg -f

install:
	yes | sudo pacman -U $(PKG)-*.pkg.tar.*

clean:
	rm -rf pkg src
	rm -rf $(_PKG)*

update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

generate-checksums:
	makepkg -g -f -p PKGBUILD
