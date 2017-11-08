PKGVER := $(shell grep -Po 'pkgver=\K.*' PKGBUILD)
PKGREL := $(shell grep -Po 'pkgrel=\K.*' PKGBUILD)


default: clean build

clean:
	rm -rf *.tar.xz

build:
	makepkg
	mksrcinfo

release: commit push

commit:
	git add .
	git commit -m "v$(PKGVER) rel$(PKGREL)"

push:
	git push origin master

