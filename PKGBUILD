# Maintainer: Mike Pento <mjpento@gmail.com>

pkgname=libast
pkgver=0.7
pkgrel=6
pkgdesc="The Library of Assorted Spiffy Things."
arch=('i686' 'x86_64')
url="https://github.com/mej/libast"
license=('BSD')
depends=('imlib2' 'pcre' 'libsm')
options=('!libtool')
source=(https://github.com/mej/libast/archive/refs/tags/${pkgver}.tar.gz LICENSE.txt snprintf.patch)
md5sums=('a3e13cc80ffeff4b345fd8aa73e44bda' '97071898559acc4f900ceb6cb9579492' 'bff8084e2829e63a47b00d9e06366e24')

prepare() {
	# patch snprintf.c
	patch --verbose ${srcdir}/${pkgname}-${pkgver}/src/snprintf.c < ./snprintf.patch
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# args pass through to configure
	./autogen.sh --prefix=/usr --with-x
	
	# fix for C23 compile failures
	make CFLAGS="$(CFLAGS) -std=gnu17"
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make prefix=${pkgdir}/usr install
	install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
