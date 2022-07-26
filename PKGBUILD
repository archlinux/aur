# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=kcaldav
pkgdesc='Simple, safe, minimal CalDAV server'
pkgver=0.2.0
pkgrel=1
url='https://kristaps.bsd.lv/kcaldav/'
license=(custom:BSD)
depends=(libbsd sqlite3)
makedepends=(expat kcgi)
arch=(x86_64)
source=("${url}/snapshots/${pkgname}-${pkgver}.tgz")
sha512sums=('a82867b854d7e02870625656c5469001f7c73583d9a98e7de1d3dd3db521fd7dc8d40555b80bef98b4584fcecbcbc7a7373f107babf315bcf1459bcb62be2b0e')

build () {
	cd "${pkgname}-${pkgver}"
	./configure PREFIX=/usr
	cat >> Makefile.configure <<-EOF
	CPPFLAGS += -D_GNU_SOURCE
	CFLAGS += ${CFLAGS} $(pkg-config libbsd --cflags)
	LDFLAGS += ${LDFLAGS} $(pkg-config libbsd --libs)
	EOF
	make LDADD_STATIC=''
}

package () {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"

	# Fix path for manual pages
	install -dm755 "${pkgdir}/usr/share/"
	mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/"

	awk '/^\/\*/,/\*\// { print ; }' kcaldav.c > COPYING
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
