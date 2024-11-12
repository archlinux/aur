srcinfo: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

build: PKGBUILD .SRCINFO
	make srcinfo
	makepkg --cleanbuild --force

test: PKGBUILD .SRCINFO
	make build
	namcap PKGBUILD
	namcap *.pkg.tar.zst

install: PKGBUILD .SRCINFO
	make build
	makepkg --install

clean:
	rm -rf pkg src *.tar.*
