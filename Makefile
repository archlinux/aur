package:
	sed -i "s/^pkgver=.*/pkgver=\"$${VERSION:?}\"/" PKGBUILD
	sed -i 's/^sha256sums=.*/${shell makepkg --geninteg}/' PKGBUILD
	makepkg --printsrcinfo > .SRCINFO
	git add -A
	git commit -m "Update to version $${VERSION}"
.PHONY: package
