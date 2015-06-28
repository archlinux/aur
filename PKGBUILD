# Maintainer: Christian Hesse <mail@eworm.de>

_pkgbasename=libpng
pkgname=lib32-libpng15
pkgver=1.5.22
pkgrel=2
pkgdesc="A collection of routines used to create PNG format graphics files (32-bit, 1.5 branch)"
arch=('x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('lib32-zlib')
makedepends=('gcc-multilib')
conflicts=('lib32-libpng<1.6')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-${pkgver}.tar.xz"{,.asc}
        "http://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-${pkgver}-apng.patch.gz")
validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F')

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd libpng-${pkgver}

	# Add animated PNG (apng) support
	# see http://sourceforge.net/projects/libpng-apng/
	patch -p1 -i ../libpng-${pkgver}-apng.patch

	./configure --prefix=/usr --libdir=/usr/lib32
	make
}

package() {
	cd libpng-${pkgver}

	make DESTDIR="${pkgdir}" install

	rm -rf "${pkgdir}/usr/"{bin,include,lib32/{pkgconfig,libpng.so,libpng.a},share}
}


sha256sums=('29bff0fb911236654dc3dbe6aed9c6f557b1ceb6aa28bed13089cf2b85d0af76'
            'SKIP'
            'c7a624b53cc8d8a50602f5704682ceae8b6918bb703df5ad113ded84a9597e01')
