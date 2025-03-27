update:
	@updpkgsums
	@makepkg --printsrcinfo > .SRCINFO

test:
	@rm -rf *.pkg.tar.zst
	@makepkg -si

clean:
	@rm -rf *.pkg.tar.zst src/ pkg/ *.AppImage

publish:
	@git add .
	@git commit -m "update to $(shell cat PKGBUILD | grep 'pkgver=' | cut -d '=' -f 2)"

