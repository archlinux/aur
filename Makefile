update:
	@updpkgsums
	@makepkg --printsrcinfo > .SRCINFO

clean:
	@rm -rf src/ pkg/ *.tar.gz *.pkg.tar.zst

test:
	$(MAKE) clean
	@makepkg -si

publish:
	@makepkg --printsrcinfo > .SRCINFO
	@git add .
	@echo "update to $$(sed -n 's/^pkgver=\(.*\)$$/\1/p' PKGBUILD)"
	@git commit -m "update to $$(sed -n 's/^pkgver=\(.*\)$$/\1/p' PKGBUILD)"
