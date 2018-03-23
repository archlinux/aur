# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='ksql'
pkgdesc='Wrapper for the SQLite C interface focusing on ease correct usage and data integrity'
pkgver='0.2.5'
pkgrel='2'
arch=('x86_64')
url='https://kristaps.bsd.lv/ksql/'
depends=('sqlite')
license=('custom:BSD')
source=("https://kristaps.bsd.lv/ksql/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9ec89ad337bbf31aa0ecf3884eb8ceec68dfbdb1f716db56a7c21e8daaee9a0c3a85563758a4647507bbad524478a40ad4cd1c38010ee3e4dcb3bc712617f2e6')

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
