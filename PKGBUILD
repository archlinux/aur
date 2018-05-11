# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='sblg'
pkgdesc='simple off-line blog utility'
pkgver='0.4.9'
pkgrel='1'
url='https://kristaps.bsd.lv/sblg'
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz")
sha512sums=('435923a75b80137bbdb44dcc35d8138f863dfbe656ca82928bc37044dcf62ffc7d92e81868507d613d65bf8e7a09eb5774ca8bd8a24b47a9f98aad6c7761cd4f')
depends=('expat')
makedepends=('gawk')
license=('custom:ISC')
arch=('x86_64')

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
