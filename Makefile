.PHONY: recheck
recheck: clean check

.PHONY: build
build:
	makepkg --printsrcinfo > .SRCINFO
	makepkg

.PHONY: check
check: build
	namcap PKGBUILD
	namcap makemake-*-x86_64.pkg.tar.zst

.PHONY: clean
clean:
	-rm -rf pkg src makemake-*-x86_64.pkg.tar.zst v*.tar.gz
