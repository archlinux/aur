# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=kcaldav
pkgdesc='Simple, safe, minimal CalDAV server'
pkgver=0.1.7
pkgrel=1
url='https://kristaps.bsd.lv/kcaldav/'
license=(custom:BSD)
depends=(libbsd kcgi sqlite3)
makedepends=(expat)
arch=(x86_64)
source=("${url}/snapshots/${pkgname}-${pkgver}.tgz")
sha512sums=('0f24870cae78aa7083b27d3b741d47d26449b31df7580f52514f27f9f79faa6b56a3688997f9cf23b6180269fe14f624f3f065ad66905f58a35215cc9a85d11e')

build () {
	cd "${pkgname}-${pkgver}"
	./configure PREFIX=/usr
	cat >> Makefile.configure <<-EOF
	CFLAGS += ${CFLAGS} $(pkg-config libbsd --cflags)
	LDFLAGS += ${LDFLAGS} $(pkg-config libbsd --libs)
	EOF
	make STATIC=''
}

package () {
	cd "${pkgname}-${pkgver}"
	make install PREFIX="${pkgdir}/usr"

	# Fix path for manual pages
	install -dm755 "${pkgdir}/usr/share/"
	mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/"

	awk '/^\/\*/,/\*\// { print ; }' err.c > COPYING
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
