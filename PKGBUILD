# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=sblg
pkgdesc='simple off-line blog utility'
pkgver=0.4.17
pkgrel=1
url='https://kristaps.bsd.lv/sblg'
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
depends=(expat)
makedepends=(gawk)
license=(custom:ISC)
arch=(x86_64)
sha512sums=('b137e985dabe1255418d23701302c7de0649815dc8358d4903a869cba0cb0e7805c38e2bf0091bb9f7ea8b4b48ef6b3d3086b1a4b11d472ffc9139dc3d191885')

build () {
	cd "${pkgname}-${pkgver}"
	./configure PREFIX=/usr MANDIR=/usr/share/man
	cat >> Makefile.configure <<-EOF
	CFLAGS += ${CFLAGS}
	LDFLAGS += ${LDFLAGS}
	EOF
	make
	awk '/^\/\*/,/\*\// { print }' main.c > COPYING
}

package () {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" make install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
