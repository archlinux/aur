srcinfo: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

sums: PKGBUILD .SRCINFO
	makepkg --geninteg

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

changelog:
	git cliff -o

clean:
	rm -rf pkg src *.tar.*
