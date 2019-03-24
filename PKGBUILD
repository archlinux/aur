# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Facundo Tuesca <facutuesca at gmail dot com>

_tesseract_version=4.0.0

pkgname=k2pdfopt
pkgver=2.51
pkgrel=1
pkgdesc="A tool that optimizes PDF files for viewing on mobile readers"
arch=('i686' 'x86_64')
url="http://www.willus.com/k2pdfopt/"
license=('GPL3')
makedepends=('cmake')
depends=('mupdf>=1.14'
	'djvulibre>=3.5.25.3'
	'netpbm>=10.61.02'
	'leptonica>=1.74.4'
	'jasper')
source=("http://www.willus.com/k2pdfopt/src/${pkgname}_v${pkgver}_src.zip"
	"http://deb.debian.org/debian/pool/main/k/k2pdfopt/k2pdfopt_2.51+ds-1.debian.tar.xz"
	"jasper.patch")
md5sums=('97bd96b21c7ee2680a9bfe12060992ba'
         '9075edbbef77506cb18e2a4479d71ec4'
         'aa38a1626c75962385bb3a0f5123a297')

prepare() {
	cd "${srcdir}/${pkgname}_v${pkgver}"
	for i in ../debian/patches/*.patch
	do
	  patch -p1 -i "$i"
	done
        patch -p2 -i "${srcdir}/jasper.patch"
}

build() {
	cd "${srcdir}/${pkgname}_v${pkgver}"
        [ -d build ] && rm -r build
        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "${srcdir}/${pkgname}_v${pkgver}/build"
	make DESTDIR="$pkgdir" install
}
