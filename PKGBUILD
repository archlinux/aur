# Maintainer: Mike Pento <mjpento@gmail.com>

pkgname=xdock
pkgver=0.3.0
pkgrel=2
pkgdesc="Software that emulates the Window Maker dock apps for any window manager."
arch=('i686' 'x86_64')
url="https://xdock.sourceforge.net"
license=('GPL-2.0-only')
depends=('libx11' 'glibc' 'bash')
options+=('!debug')
source=(https://sourceforge.net/projects/xdock/files/xdock/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('7fab19fdde7d0cdc6aba6760edf7d721')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# patch implicit function declarations
	patch -p1 < ../../fix-implicit-declarations.patch	

	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	echo >&2 '==> Packaging dock server'
	install -Dv -m 755 src/server/xdockserver "${pkgdir}"/usr/bin/xdockserver
	
	echo >&2 '==> Packaging dock wrappers'
	install -Dv -m 755 src/docks/xdcalendar "${pkgdir}"/usr/bin/xdcalendar
	install -Dv -m 755 src/docks/xdclock "${pkgdir}"/usr/bin/xdclock
	install -Dv -m 755 src/docks/xdmemory "${pkgdir}"/usr/bin/xdmemory	

	echo >&2 '==> Packaging docks'
	install -Dv -m 755 src/docks/.libs/xdcalendar "${pkgdir}"/usr/bin/.libs/xdcalendar
	install -Dv -m 755 src/docks/.libs/xdclock "${pkgdir}"/usr/bin/.libs/xdclock
	install -Dv -m 755 src/docks/.libs/xdmemory "${pkgdir}"/usr/bin/.libs/xdmemory

	echo >&2 '==> Packaging library files'
	install -Dv -m 755 src/lib/.libs/libxdock.so.2.0.0 "${pkgdir}"/usr/lib/libxdock.so.2.0.0
	install -Dv -m 755 src/lib/.libs/libxdock.lai "${pkgdir}"/usr/lib/libxdock.la
	install -Dv -m 644 src/lib/.libs/libxdock.a "${pkgdir}"/usr/lib/libxdock.a
	ln -sf /usr/lib/libxdock.so.2.0.0 "${pkgdir}"/usr/lib/libxdock.so
	ln -sf /usr/lib/libxdock.so.2.0.0 "${pkgdir}"/usr/lib/libxdock.so.2
	
	echo >&2 '==> Packaging include files'
	install -Dv -m 644 src/lib/xdock.h "${pkgdir}"/usr/include/xdock.h

	echo >&2 '==> Packaging theme'
	install -Dv -m 644 share/themes.rc "${pkgdir}"/usr/share/xdock/themes.rc

	echo >&2 '==> Packaging man page'
	install -Dv -m 644 man/man1/xdockserver.1 "${pkgdir}"/usr/share/man/man1/xdockserver.1
}
