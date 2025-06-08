# Maintainer: Mike Pento <mjpento@gmail.com>

pkgname=libast
pkgver=0.7
pkgrel=7
pkgdesc="The Library of Assorted Spiffy Things."
arch=('i686' 'x86_64')
url="https://github.com/mej/libast"
license=('BSD')
depends=('imlib2' 'pcre' 'libsm')
options=('!libtool' '!debug')
source=(https://github.com/mej/libast/archive/refs/tags/${pkgver}.tar.gz LICENSE.txt no-implicit-declarations.patch)
md5sums=('a3e13cc80ffeff4b345fd8aa73e44bda' '97071898559acc4f900ceb6cb9579492' 'bff8084e2829e63a47b00d9e06366e24')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}/src

    patch --verbose snprintf.c < ../../../no-implicit-declarations.patch
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# args pass through to configure
	./autogen.sh --prefix=/usr --with-x
	
    # address incompatbilities with c23 dialect (gcc15+)
	make CFLAGS+=-std=gnu17
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make prefix=${pkgdir}/usr install
	install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
