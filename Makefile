srcinfo: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src zedless *.pkg.tar.zst

fetch: PKGBUILD .SRCINFO
	makepkg --nobuild

build: PKGBUILD .SRCINFO
	makepkg --force

test: PKGBUILD .SRCINFO
	makepkg --check --force
	namcap PKGBUILD
	namcap *.pkg.tar.zst

install: PKGBUILD .SRCINFO
	makepkg --install
