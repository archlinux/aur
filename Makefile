all:
	make prepare
	make build
	make clean
	make check

build:
	makepkg -f

prepare:
	sed -i "s|md5sums.*|`makepkg -g 2>&1|grep md5sums`|g" PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg/ src/

check:
	namcap *.tar.xz
