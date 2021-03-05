# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=lowdown
pkgdesc='Markdown translator producing HTML5 and roff documents in the ms and man formats'
pkgver=0.8.2
pkgrel=2
license=(custom:BSD)
url=https://kristaps.bsd.lv/lowdown/
arch=(i686 x86_64)
depends=(glibc libmd)
makedepends=(libdiff)
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('5a45dba3f1bf5c959687cd4aa04b5ac7cce2e6f7f5c14ef442d433ca78a24c86ffc66593ae5ff37aa89a6e7f34fcab51f767c552e2a90139f3f989d0d21bdf0f')

build () {
	cd "${pkgname}-${pkgver}"
	./configure PREFIX=/usr MANDIR=/usr/share/man
	cat >> Makefile.configure <<-EOF
	CFLAGS += ${CFLAGS}
	LDFLAGS += ${LDFLAGS}
	EOF
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	strip -x --strip-unneeded "${pkgdir}"/usr/bin/lowdown{,-diff}
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
