# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=lowdown
pkgdesc='Markdown translator producing HTML5 and roff documents in the ms and man formats'
pkgver=0.7.4
pkgrel=1
license=(custom:BSD)
url=https://kristaps.bsd.lv/lowdown/
arch=(i686 x86_64)
depends=(glibc)
makedepends=(libdiff)
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c0de30ee5b8fc990e5a629ce4c71a929654fb73c102578f1a1c6d1856bc599ce1bad156ff9b693ea199304c9688b917211911e94f95c0497696b677174f4c2a3')

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
