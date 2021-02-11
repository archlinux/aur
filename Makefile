PKG := littlefs-fuse

build:
	makepkg -f

chroot-build:
	# https://aur.archlinux.org/packages/aurutils/
	aur chroot --update --build

install:
	yes | makepkg -i

clean:
	rm -rf pkg src
	rm -rf $(PKG)*
	rm -rf *.tar.gz

update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

generate-checksums:
	makepkg -g PKGBUILD
