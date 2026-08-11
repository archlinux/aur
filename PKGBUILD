# Maintainer: Mike Pento <mjpento@gmail.com>

pkgname=libast
pkgver=0.8
pkgrel=1
pkgdesc="The Library of Assorted Spiffy Things."
arch=('i686' 'x86_64')
url="https://github.com/mej/libast"
license=('BSD')
depends=('imlib2' 'pcre' 'libsm')
options=('!libtool' '!debug')
source=(https://github.com/mej/libast/archive/refs/tags/${pkgver}.tar.gz LICENSE.txt no-implicit-declarations.patch)
md5sums=('0e625e406fe6ddd0e053baf719373f55' '97071898559acc4f900ceb6cb9579492' 'bff8084e2829e63a47b00d9e06366e24')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}/src

    patch --verbose snprintf.c < ../../../no-implicit-declarations.patch
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# args pass through to configure
	./autogen.sh --prefix=/usr --with-x
	
    # address incompatbilities with c23 dialect (gcc15+)
	make CFLAGS+=-std=c90
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make prefix=${pkgdir}/usr install
	install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
