PKG := grml-systemd-boot

build:
	makepkg -f

install:
	yes | makepkg -i

clean:
	sudo rm -rf pkg src
	rm -rf $(PKG)*

update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

generate-checksums:
	makepkg -g -f -p PKGBUILD
