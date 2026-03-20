.PHONY: build test clean update push srcinfo

# Build the package
build:
	rm -f *.pkg.tar.zst
	makepkg -sf

# Build and run namcap checks (filter AppImage-related false positives)
test: build
	@output=$$(namcap PKGBUILD 2>&1 | grep -v "may not be needed ('fuse2')"); \
	if [ -n "$$output" ]; then echo "$$output"; exit 1; fi
	@output=$$(namcap *.pkg.tar.zst 2>&1 | grep -v -e "ELF files outside" -e "lacks FULL RELRO" -e "lacks PIE" -e "is empty" -e "lacks GNU_PROPERTY" -e "may not be needed"); \
	if [ -n "$$output" ]; then echo "$$output"; exit 1; fi

# Clean build artifacts
clean:
	rm -rf pkg/ src/ *.pkg.tar.zst squashfs-root/

# Regenerate .SRCINFO
srcinfo:
	makepkg --printsrcinfo > .SRCINFO

# Update to a new version: make update VERSION=x.y.z
update:
	@test -n "$(VERSION)" || (echo "Usage: make update VERSION=x.y.z" && exit 1)
	sed -i 's/^pkgver=.*/pkgver=$(VERSION)/' PKGBUILD
	sed -i 's/^pkgrel=.*/pkgrel=1/' PKGBUILD
	updpkgsums
	$(MAKE) srcinfo

# Build, test, commit, and push to AUR
push: test srcinfo
	git add PKGBUILD .SRCINFO
	git commit -m "$$(grep '^pkgver=' PKGBUILD | cut -d= -f2)-$$(grep '^pkgrel=' PKGBUILD | cut -d= -f2)"
	git push origin master
