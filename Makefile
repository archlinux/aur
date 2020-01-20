.PHONY: clean install

PKGNAME:=bitwig-8-track
PKGVER:=3.1.2
PKGARCH:=x86_64
PKGREL:=1
PACKAGE:=${PKGNAME}-${PKGVER}-${PKGREL}-${PKGARCH}.pkg.tar.xz
PACKAGE-SOURCE:="bitwig-studio-${PKGVER}.deb"

all: $(PACKAGE) $(PACKAGE-SOURCE)

$(PACKAGE):
	updpkgsums
	makepkg
	mksrcinfo

$(PACKAGE-SOURCE):
	makepkg --source

install: $(PACKAGE)
	sudo pacman -U $<

clean:
	rm -f ${PKGNAME}-*-${PKGREL}-${PKGARCH}.pkg.tar.xz\
		${PKGNAME}-*.src.tar.gz\
		${PKGNAME}-*.deb\
	rm -fr ./src ./pkg

