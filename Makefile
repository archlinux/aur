.PHONY: install pkg clean

install: pkg
	sudo pacman -U backupninja-borg-git-*.pkg.tar.xz

pkg:
	makepkg -f
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf src/ pkg/ backupninja/ backupninja-borg-git-*.pkg.tar.xz
