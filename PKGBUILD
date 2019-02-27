# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Grigorios Bouzakis <grbzks@gmail.com>
# Contributor: Stephen Gregoratto <dev@sgregoratto.me>

pkgname=fdm-git
_pkgname=fdm
pkgver=20190218.519e418
pkgrel=1
pkgdesc='Program to fetch mail and deliver it in various ways'
url='https://github.com/nicm/fdm'
license=('BSD')
arch=('i686' 'x86_64' 'armv7h')
depends=('openssl' 'pcre' 'tdb' 'zlib')
makedepends=('git')
source=('git+https://github.com/nicm/fdm.git')
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr --enable-pcre
	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	make DESTDIR="${pkgdir}" install

	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	sed '3,17p;d' fdm.c > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	cp -a examples MANUAL "${pkgdir}/usr/share/doc/${pkgname}"
}
