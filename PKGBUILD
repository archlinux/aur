# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=monkey
pkgver=1.7.3
pkgrel=2
pkgdesc='Lightweight and powerful web server'
url='https://github.com/monkey/monkey'
arch=('i686' 'x86_64')
license=('Apache')
depends=('mbedtls')
makedepends=('cmake')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
				0001-fix_include.patch)
sha1sums=('3ffb76235aec734188fbc41f97ef661cf05cf9ab'
          '9346e0c2ad44a9019e461b42f4a2ab860584236a')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Fix include dir (not include/, but include/monkey/)
	patch -Np2 -i "${srcdir}"/0001-fix_include.patch  
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir build
	./configure \
		--malloc-libc \
		--mbedtls-shared \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--libdir=/usr/lib \
		--includedir=/usr/include \
		--sysconfdir=/etc/monkey \
		--webroot=/srv/http \
		--default-port=80 \
		--default-user=http \

	make CMAKE_COMMAND="/usr/bin/cmake" RM="/usr/bin/cmake" CMAKE_SOURCE_DIR="." CMAKE_BINARY_DIR="." DESTDIR="${pkgdir}"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--malloc-libc \
		--mbedtls-shared \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--libdir=/usr/lib \
		--includedir=/usr/include \
		--sysconfdir=/etc/monkey \
		--webroot=/srv/http \
		--default-port=80 \
		--default-user=http

	make CMAKE_COMMAND="/usr/bin/cmake" RM="/usr/bin/cmake" CMAKE_SOURCE_DIR="." CMAKE_BINARY_DIR="." DESTDIR="${pkgdir}" install
	rm -fr "${pkgdir}"/srv/http
}
