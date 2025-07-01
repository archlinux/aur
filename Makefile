.PHONY: check
check: clean build srcinfo
	namcap PKGBUILD
	namcap uamp-*-x86_64.pkg.tar.zst

.PHONY: build
build:
	makepkg --check

.PHONY: srcinfo
srcinfo:
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	rm -rf pkg src uamp-*.pkg.tar.zst *.tar.gz
