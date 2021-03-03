# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>
# Set it to compile with openblas-lapack

pkgname=astromatic-sextractor
_pkgname=sextractor
pkgver=2.25.0
pkgrel=5
pkgdesc="builds a catalogue of objects from an astronomical image (build from source) "
url="http://www.astromatic.net/software/sextractor"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'openblas-lapack')
makedepends=()
provides=()
conflicts=('sextractor-bin')
replaces=('sextractor-bin')
backup=()
source=(https://github.com/astromatic/sextractor/archive/${pkgver}.tar.gz
	gcc10.patch)
sha1sums=('3ed53d55c0c77cd98a38bff1bde1b0d6fc625c18'
          '25ce0219cc1f605f9bf79347b04c098b44f4accf')

prepare() {
	cd $srcdir/${_pkgname}-${pkgver}
	patch --forward --strip=1 --input="${srcdir}/gcc10.patch"
}

build() {

	_COPTS="--enable-openblas --with-openblas-incdir=/usr/include"
	#export CFLAGS="-fcommon"

	cd $srcdir/${_pkgname}-${pkgver}
	sh autogen.sh
	./configure --prefix=/usr $_COPTS
	make
}

package() {

	cd $srcdir/${_pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

}

