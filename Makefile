all:
	make srcinfo
	make build
	make clean

build:
	makepkg -f

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg/ src/
