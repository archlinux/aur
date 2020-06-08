update: .SRCINFO
	@echo "Updating to version $${VERSION:?Which version?}"
	git commit -am "Update to version $${VERSION:?}"
.PHONY: update

updatePKGBUILD:
	sed -i "s/pkgver=.*/pkgver=$${VERSION:?Which version?}/" PKGBUILD
	checksums=$$(makepkg --noprogressbar -g | grep -E '^sha.*sums') && \
		sed -Ei "s/^sha.*sums.*/$${checksums}/" PKGBUILD
.PHONY: updatePKGBUILD

.SRCINFO: updatePKGBUILD
	makepkg --printsrcinfo > .SRCINFO

build:
	makepkg -cCsirfi
