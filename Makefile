update:
	@updpkgsums
	@makepkg --printsrcinfo > .SRCINFO

clean:
	@rm -rf src/ pkg/ *.pkg.tar.zst *.dmg

test:
	@rm -rf *.pkg.tar.zst
	@makepkg -si

publish:
	@git add .
	@echo "Update to $(shell sed -n 's/^pkgver=//p' PKGBUILD)"
	@git commit -m "Update to $(shell sed -n 's/^pkgver=//p' PKGBUILD)"