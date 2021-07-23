# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=lowdown
pkgdesc='Markdown translator producing HTML5 and roff documents in the ms and man formats'
pkgver=0.8.5
pkgrel=1
license=(custom:BSD)
url=https://kristaps.bsd.lv/lowdown/
arch=(i686 x86_64)
depends=(libmd)
makedepends=(libdiff)
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('5951175bfd7b0508d1a87e9a8156a22da9920025db5689f0d21427accf45e333cd1f9950f3f917868cfc8ecbb189364e88e8f5792936e2bb97daef8fbbcbbc1f')

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
	make -C "${pkgname}-${pkgver}" regress
}

package () {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	strip -x --strip-unneeded "${pkgdir}"/usr/bin/lowdown{,-diff}
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
