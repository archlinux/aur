# Maintainer: Jan Kohnert <bughunter@jan-kohnert.de>
# Contributor:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-sextractor
_pkgname=sextractor
pkgver=2.28.2
pkgrel=1
pkgdesc="builds a catalogue of objects from an astronomical image (build from source)"
url="http://www.astromatic.net/software/sextractor"
arch=("x86_64")
license=("GPL-3.0-or-later")
depends=("cfitsio" "fftw" "glibc" "openblas")
makedepends=()
provides=()
backup=()
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://github.com/astromatic/sextractor/archive/${pkgver}.tar.gz"
	"${_pkgname}-${pkgver}.patch"
)
sha512sums=(
	"f54b9e69944e582c68769c0d01534fc437f03fa5fc9dcb59bc680baed429983ebaa4c2422570b0f424b25c6c44cdf54a6587819ab2bc524aa33ed5c9f2595e62"
	"7ff27ea9b76e702ab36f400f6f1f16dd609f07190e58b8c6982932ad190306a2967381e27ae19663e56d423638078a0acee2aefb7833fd39dfcd4178054bdc83"
)

prepare() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	patch -p1 -i "${srcdir}/${_pkgname}-${pkgver}.patch"
}

build() {
	export CFLAGS="${CFLAGS} -fcommon"
	cd "$srcdir/${_pkgname}-${pkgver}"
	sh autogen.sh
	./configure --prefix=/usr --enable-openblas --with-openblas-incdir=/usr/include/openblas
	make
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
