.PHONY: check
check: clean build srcinfo
	namcap PKGBUILD
	namcap thedit-*-x86_64.pkg.tar.zst

sums:
	makepkg -g

.PHONY: build
build:
	makepkg --check

.PHONY: srcinfo
srcinfo:
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	rm -rf pkg src thedit-*.pkg.tar.zst *.tar.gz
