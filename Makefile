update:
	svn checkout --depth=empty svn://svn.archlinux.org/packages
	cd packages && svn update linux
	find . -maxdepth 1 -name '*.patch' -a ! -name 'xps13.patch' -a ! -name 'PKGBUILD.patch' | xargs -r rm
	cp packages/linux/trunk/* .
	rm -rf packages
	patch PKGBUILD PKGBUILD.patch

build:
	makepkg -c
	mksrcinfo

clean:
	git clean -Xf
	rm -rf packages

