# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=ksql
pkgdesc='Wrapper for the SQLite C interface focusing on ease correct usage and data integrity'
pkgver=0.3.4
pkgrel=1
arch=(x86_64)
url='https://kristaps.bsd.lv/ksql/'
depends=(sqlite)
license=(custom:BSD)
source=("https://kristaps.bsd.lv/ksql/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9843d68c0d2aced37868dfea84ef3d31d7d3a46c2703f156b0582e8ab7944f41e46adb8b248edec3499ae40e0d21f2544fa934e82b413af6e167f141a660bd83')

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
