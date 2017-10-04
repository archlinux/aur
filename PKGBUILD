# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=gerbera
pkgver=1.1.0
pkgrel=1
pkgdesc="UPnP Media Server"
arch=(i686 x86_64 armv7h)
url="https://github.com/v00d00/gerbera"
license=('GPL2')
depends=('taglib' 'curl' 'sqlite' 'file' 'libmariadbclient' 'gcc-libs' 'pupnp'
	 'duktape' 'libexif' 'expat')
makedepends=('cmake')
install=gerbera.install
options=('emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/v00d00/gerbera/archive/v$pkgver.tar.gz"
	gerbera-mysql.service
	gerbera.service
	gerbera.sysusers)
sha256sums=('225247e94983d24d50c0877cd7c9ef1e013091f2ec43fac7e2a3c3b82c11d5bd'
            'f8abf002308fabb8327f3bff0fd100357360921fcbfde61795f044af96ab9257'
            '766383ece7e5fc308b52d8c9df3924e31c65e0ac0a954033248c7d80a8c40140'
            'b3f956a6eaee8753cff7a04b51091b8b283dd0da054190ced13362a5b050d73f')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
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
