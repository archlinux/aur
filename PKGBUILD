# Maintainer: Christian Hesse <mail@eworm.de>

_pkgbasename=libpng
pkgname=lib32-libpng15
pkgver=1.5.24
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics files (32-bit, 1.5 branch)"
arch=('x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('lib32-zlib')
makedepends=('gcc-multilib')
conflicts=('lib32-libpng<1.6')
options=('!libtool')
validpgpkeys=('8048643BA2C840F4F92A195FF54984BFA16C640F')
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-${pkgver}.tar.xz"{,.asc}
        "http://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-${pkgver}-apng.patch.gz")
sha256sums=('b92e3474f3136b5d9443ba92822154ebc2573fc6feead90d364ee9ebc3741be2'
            'SKIP'
            '830ebd4f2d58f9b7b9e6e9e686d0da3f027e4760a761d78f108479fad54f46af')

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

