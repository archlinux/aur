.PHONY: clean build install

.SRCINFO:
	makepkg --printsrcinfo > .SRCINFO

build: .SRCINFO
	makepkg

install:
	makepkg -si

clean:
	rm -rf pkg/ src/ *.pkg.tar.zst *.tar.gz .SRCINFO
