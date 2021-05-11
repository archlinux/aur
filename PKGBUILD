# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=lowdown
pkgdesc='Markdown translator producing HTML5 and roff documents in the ms and man formats'
pkgver=0.8.4
pkgrel=1
license=(custom:BSD)
url=https://kristaps.bsd.lv/lowdown/
arch=(i686 x86_64)
depends=(libmd)
makedepends=(libdiff)
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d1d63c96a53692286285a64809317f4ff4b6d2f4499d984cd1284787f3d7ce42ff1ef842bfebd0a2cb4deccfa2bf3d20ff0deb41443b361a314fcde0ee59bd72')

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
