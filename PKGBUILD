# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=lowdown
pkgdesc='Markdown translator producing HTML5 and roff documents in the ms and man formats'
pkgver=0.7.9
pkgrel=1
license=(custom:BSD)
url=https://kristaps.bsd.lv/lowdown/
arch=(i686 x86_64)
depends=(glibc)
makedepends=(libdiff)
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ec642b285202c932394f84a29c04dfa21882abd4c2d0e80df0d9957c6dc1dc164933d274d034fc96501ca3c90dca42c82ad97f017b92e17f1f11388214458451')

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
