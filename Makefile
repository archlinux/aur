update:
	@./check-version.sh
#	@updpkgsums
	@makepkg --printsrcinfo > .SRCINFO

clean:
	@rm -rf src/ pkg/ *.pkg.tar.zst

test:
	@make clean
	@makepkg -sf

publish:
	@git add .
	@echo "Update to $(shell sed -n 's/^pkgver=//p' PKGBUILD)"
	@git commit -m "Update to $(shell sed -n 's/^pkgver=//p' PKGBUILD)"