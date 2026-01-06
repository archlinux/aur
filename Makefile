clean:
	@rm -rf pkg/

update:
	@updpkgsums
	@makepkg --printsrcinfo > .SRCINFO

test:
	@makepkg -si

publish:
	@echo "Update to $(shell sed -n 's/^pkgver=//p' PKGBUILD) released"
	@git add .
	@git commit -m "Update to $(shell sed -n 's/^pkgver=//p' PKGBUILD) released"
