# Maintainer: Mike Pento <mjpento@gmail.com>

pkgname=xdock
pkgver=0.3.0
pkgrel=1
pkgdesc="Software that emulates the Window Maker dock apps for any window manager."
arch=('i686' 'x86_64')
url="https://xdock.sourceforge.net"
license=('GPL')
depends=('libx11')
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
	install -Dv -m 755 src/server/xdockserver "${pkgdir}"/usr/local/bin/xdockserver
	
	echo >&2 '==> Packaging dock wrappers'
	install -Dv -m 755 src/docks/xdcalendar "${pkgdir}"/usr/local/bin/xdcalendar
	install -Dv -m 755 src/docks/xdclock "${pkgdir}"/usr/local/bin/xdclock
	install -Dv -m 755 src/docks/xdmemory "${pkgdir}"/usr/local/bin/xdmemory	

	echo >&2 '==> Packaging docks'
	install -Dv -m 755 src/docks/.libs/xdcalendar "${pkgdir}"/usr/local/bin/.libs/xdcalendar
	install -Dv -m 755 src/docks/.libs/xdclock "${pkgdir}"/usr/local/bin/.libs/xdclock
	install -Dv -m 755 src/docks/.libs/xdmemory "${pkgdir}"/usr/local/bin/.libs/xdmemory

	echo >&2 '==> Packaging library files'
	install -Dv -m 755 src/lib/.libs/libxdock.so.2.0.0 "${pkgdir}"/usr/local/lib/libxdock.so.2.0.0
	install -Dv -m 755 src/lib/.libs/libxdock.lai "${pkgdir}"/usr/local/lib/libxdock.la
	install -Dv -m 644 src/lib/.libs/libxdock.a "${pkgdir}"/usr/local/lib/libxdock.a
	ln -sf "${pkgdir}"/usr/local/lib/libxdock.so.2.0.0 "${pkgdir}"/usr/local/lib/libxdock.so
	ln -sf "${pkgdir}"/usr/local/lib/libxdock.so.2.0.0 "${pkgdir}"/usr/local/lib/libxdock.so.2
	
	echo >&2 '==> Packaging include files'
	install -Dv -m 644 src/lib/xdock.h "${pkgdir}"/usr/local/include/xdock.h

	echo >&2 '==> Packaging theme'
	install -Dv -m 644 share/themes.rc "${pkgdir}"/usr/share/xdock/themes.rc

	echo >&2 '==> Packaging man page'
	install -Dv -m 644 man/man1/xdockserver.1 "${pkgdir}"/usr/share/man/man1/xdockserver.1
}
