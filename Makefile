all:
	make prepare
	make build
	make clean
	make check

build:
	makepkg -f

prepare:
	sed -i "s|sha256sums.*|`makepkg -g 2>&1|grep sha256sums`|g" PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg/ src/

check:
	namcap *.tar.zst
