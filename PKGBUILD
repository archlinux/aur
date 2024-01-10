# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=kcaldav
pkgdesc='Simple, safe, minimal CalDAV server'
pkgver=0.2.5
pkgrel=3
url='https://kristaps.bsd.lv/kcaldav/'
license=(custom:BSD)
depends=(libbsd sqlite3)
makedepends=(expat kcgi)
arch=(x86_64)
install="$pkgname.install"
source=("${url}/snapshots/${pkgname}-${pkgver}.tgz")
sha512sums=('a559d2684f3fd742a4eac3e36cd01cf999222aed40e05472fbd28987f8de89da96ef9a4b1d118300a546f39d43b0c719c7523e9906845274e7460a40adb56e03')

build () {
	cd "${pkgname}-${pkgver}"
	./configure PREFIX=/usr
	cat >> Makefile.configure <<-EOF
	CFLAGS += ${CFLAGS} $(pkg-config libbsd --cflags) \
		-include stdint.h -D_GNU_SOURCE -include errno.h
	LDFLAGS += ${LDFLAGS} $(pkg-config libbsd --libs)
	EOF
	make LDADD_STATIC=''
}

package () {
	cd "${pkgname}-${pkgver}"
	make install installcgi DESTDIR="${pkgdir}" \
		CGIPREFIX=/usr/lib/kcaldav \
		HTDOCSPREFIX=/usr/share/kcaldav

	# Fix path for manual pages
	install -dm755 "${pkgdir}/usr/share/"
	mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/"

	awk '/^\/\*/,/\*\// { print ; }' kcaldav.c > COPYING
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
