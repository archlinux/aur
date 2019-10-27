# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=ksql
pkgdesc='Wrapper for the SQLite C interface focusing on ease correct usage and data integrity'
pkgver=0.3.5
pkgrel=2
arch=(x86_64)
url=https://kristaps.bsd.lv/ksql/
depends=(sqlite)
license=(custom:ISC)
source=("https://kristaps.bsd.lv/ksql/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9550693089217f741d9af6c5e3c868ec5c1e88bde0d8ddfa6bb28eb2e94c77b7dc8dc7a145a19d36ab3a4ffc0cb95dd30e7c46f284bccb6c0420a710c9d44aed')

build () {
	cd "${pkgname}-${pkgver}"
	./configure PREFIX=/usr MANDIR=/usr/share/man
	cat >> Makefile.configure <<-EOF
	CFLAGS += ${CFLAGS}
	LDFLAGS += ${LDFLAGS}
	EOF
	make
}

check () {
	cd "${pkgname}-${pkgver}"
	./test
}

package () {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
	awk '/^\/\*/,/\*\// { print ; }' test.c > COPYING
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
