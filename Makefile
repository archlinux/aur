clean:
	rm -rf pkg
	rm -rf src
	rm *.pkg.tar.zst || true

package: clean
	makepkg --force
	makepkg --printsrcinfo > .SRCINFO

install: package
	sudo pacman -U xlap-*.pkg.tar.zst
