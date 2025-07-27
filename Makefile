.PHONY: build install clean

build:
	makepkg

install:
	makepkg -si

clean:
	rm -f *.pkg.tar.xz *.pkg.tar.zst
	rm -rf pkg/ src/

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

update: .SRCINFO
	git add PKGBUILD .SRCINFO
	git commit -m "Update python-pyzipper package"