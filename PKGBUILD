#AUR Maintainter: JKA Network <contacto@jkanetwork.com>
pkgname=openlitespeed
pkgver=1.5.12
pkgrel=1
pkgdesc="A high-performance, lightweight, open source HTTP server"
arch=('x86_64' 'i686')
url="https://openlitespeed.org/downloads/"
license=('GPLv3')
depends=('pcre' 'rcs' 'geoip' 'expat' 'openssl' 'libzip')
makedepends=('git' 'imake')
provides=('openlitespeed')
options=()
source=("https://openlitespeed.org/packages/openlitespeed-$pkgver.src.tgz")
md5sums=('3029e2034f7470051a2dc210aec44a5d')
install=$pkgname.install
build() {
	cd "$pkgname-$pkgver"
	sed -i 's,#include <sys/sysctl.h>,,g' src/main/lshttpdmain.cpp
	./configure --prefix=/usr/local/lsws/ --with-lsphp7

	make
}
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	#Replace $pkgdir to / in installed files.
	cd "${pkgdir}/usr/local/lsws/admin/misc"
	sed -i 's,'"${pkgdir}"',/,g' *
	#Install systemd service
	install -Dm0644 "${pkgdir}/usr/local/lsws/admin/misc/lshttpd.service" "${pkgdir}/usr/lib/systemd/system/lshttpd.service"
	#fix ln at php building (It has problems with installed compiled php (And its php5 I don't know why)
	cd "${pkgdir}/usr/local/lsws/fcgi-bin"
	rm lsphp
	ln -s lsphp5 lsphp
}
