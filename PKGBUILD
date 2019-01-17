# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: sulaweyo <sledge.sulaweyo@gmail.com>

pkgname=gerbera
pkgver=1.2.0
pkgrel=2
pkgdesc="UPnP Media Server"
arch=(i686 x86_64 armv7h)
url="https://github.com/v00d00/gerbera"
license=('GPL2')
depends=('taglib' 'curl' 'sqlite' 'file' 'libmariadbclient' 'gcc-libs' 'libupnp18'
	 'duktape' 'libexif' 'expat')
makedepends=('cmake')
install=gerbera.install
options=('emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/v00d00/gerbera/archive/v$pkgver.tar.gz"
	gerbera-mysql.service
	gerbera.service
	gerbera.sysusers)
sha256sums=('a64fe5820aced590bcdc22600596dc8a41c0baf68d7c0ec5baf7a561ade820df'
            'f8abf002308fabb8327f3bff0fd100357360921fcbfde61795f044af96ab9257'
            '766383ece7e5fc308b52d8c9df3924e31c65e0ac0a954033248c7d80a8c40140'
            'b3f956a6eaee8753cff7a04b51091b8b283dd0da054190ced13362a5b050d73f')

build() {
	cd "$pkgname-$pkgver"
	sed -i 's/libupnp-1.8 libupnp/libupnp-1.8/g' cmake/FindLibUpnp.cmake
	# config options can be found here: https://github.com/gerbera/gerbera/blob/master/CMakeLists.txt
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DWITH_MYSQL=1 .
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	install -dm0755 "$pkgdir"/var/lib/gerbera
	install -Dm0644 "$srcdir"/gerbera.sysusers "$pkgdir"/usr/lib/sysusers.d/gerbera.conf
	install -Dm0644 "$srcdir"/gerbera-mysql.service "$pkgdir"/usr/lib/systemd/system/gerbera-mysql.service
	install -Dm0644 "$srcdir"/gerbera.service "$pkgdir"/usr/lib/systemd/system/gerbera.service
}
