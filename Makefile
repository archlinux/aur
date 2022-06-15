all:
	make prepare
	make build
	make clean
	make check

build:
	makepkg -f

prepare:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg/ src/

check:
	namcap *.tar.zst
