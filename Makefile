update: 
	ABSROOT=. abs core/linux
	find . -maxdepth 1 -name '*.patch' -a ! -name 'xps13.patch' -a ! -name 'PKGBUILD.patch' | xargs -r rm
	cp core/linux/* .
	rm -rf core
	patch PKGBUILD PKGBUILD.patch

build:
	makepkg -c
	mksrcinfo

clean:
	git clean -Xf

