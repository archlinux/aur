# Maintainer: VCalV
_pkgname=gourou
pkgname="${_pkgname}"
__pkgname="lib${_pkgname}"
pkgver=0.5.1
pkgrel=2
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL3')
url="https://indefero.soutade.fr/p/libgourou"
depends=(glibc gcc-libs qt5-base zlib libzip openssl pugixml)
conflicts=(gourou-bin)
options=(!strip)
source=(make.patch "gourou::git://soutade.fr/libgourou.git#tag=v$pkgver" "base64::git://gist.github.com/f0fd86b6c73063283afe550bc5d77594.git" "updfparser::git://soutade.fr/updfparser.git#commit=47143308ca253a6ae108b10a6ae5e7852bdd2c5d")
md5sums=(b1a33163659f7c0e782d7a19a304a012 SKIP SKIP SKIP)

prepare() {
	patch --strip=1 --input=make.patch
}

build() {
	cd $srcdir/gourou

	mkdir -p lib

	ln -fs $srcdir/base64 lib
	ln -fs $srcdir/updfparser lib

	cd lib/updfparser
	BUILD_STATIC=1 BUILD_SHARED=0 make all
	cd ../../

	#scripts/setup.sh
	make all
}

package() {
	cd $srcdir/gourou

	install -d $pkgdir/{usr/bin/,usr/lib/}
	cp -a --no-preserve=ownership utils/{acsmdownloader,adept_activate,adept_remove} $pkgdir/usr/bin
	cp -a --no-preserve=ownership *.so $pkgdir/usr/lib
}
