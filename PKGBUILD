#AUR Maintainter: JKA Network <contacto@jkanetwork.com>
pkgname=openlitespeed
pkgver=1.5.10
pkgrel=3
pkgdesc="A high-performance, lightweight, open source HTTP server"
arch=('x86_64' 'i686')
url="https://openlitespeed.org/downloads/"
license=('GPLv3')
depends=('pcre' 'rcs' 'geoip' 'expat' 'openssl' 'libzip')
makedepends=('git' 'imake')
provides=('openlitespeed')
options=()
source=("https://openlitespeed.org/packages/openlitespeed-$pkgver.src.tgz"
		'openlitespeed.service')
md5sums=('7d0126687c01222047ee9c454c898e1d'
         'f4acf3cdbf449a457818982eb933d6f7')
install=$pkgname.install
build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr/local/lsws/ --with-lsphp7
	make
}
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm0644 "${srcdir}/openlitespeed.service" "${pkgdir}/usr/lib/systemd/system/openlitespeed.service"
	#fix ln at php building (It has problems with installed compiled php (And its php5 I don't know why)
	cd "${pkgdir}/usr/local/lsws/fcgi-bin"
	rm lsphp
	ln -s lsphp5 lsphp
}
