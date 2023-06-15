# Maintainer: Jan Kohnert <bughunter@jan-kohnert.de>
# Contributor:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-sextractor
_pkgname=sextractor
pkgver=2.25.0
pkgrel=6
pkgdesc="builds a catalogue of objects from an astronomical image (build from source) "
url="http://www.astromatic.net/software/sextractor"
arch=("x86_64")
license=("GPL3")
depends=("fftw" "glibc" "openblas")
makedepends=()
provides=()
conflicts=("sextractor-bin")
replaces=("sextractor-bin")
backup=()
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://github.com/astromatic/sextractor/archive/${pkgver}.tar.gz"
	"gcc10.patch"
)
sha512sums=(
	"1b1d476065de1a087682f473312056429505a063cd016a028a0fcf822928fdb133d5cddded00fa8c31b60043012aebfcbc623b7715be0104613ce92ddc8379de"
	"fe5e4917248e6f646d741190975d9cc2030ccd99e07e8b89ff51e469958d8691a194805443e9b460ef5b4f48b52844566a6fb67a54dc9ff8700b6696e15722aa"
)

prepare() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/gcc10.patch"
}

build() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	sh autogen.sh
	./configure --prefix=/usr --enable-openblas --with-openblas-incdir=/usr/include/openblas
	make
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
