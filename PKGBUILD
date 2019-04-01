# Maintainer: Henri Derycke <nheir.kim@gmail.com>
pkgname=bluez-alsa-git
pkgver=1.4.0.r9.g1557602
pkgrel=1
pkgdesc="Bluetooth Audio ALSA Backend"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Arkq/bluez-alsa"
license=('MIT')
depends=('bluez-libs' 'glib2' 'libfdk-aac' 'sbc' 'alsa-lib')
makedepends=('git')
source=("$pkgname::git+https://github.com/Arkq/bluez-alsa.git"
	bluealsa.service)
md5sums=('SKIP'
         '081aa1ae957cd3d013521c4170a83480')
install=bluealsa.install

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	autoreconf --install
	./configure --prefix=/usr \
	            --sysconfdir=/etc \
	            --enable-aac
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm0644 $srcdir/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm0644 $srcdir/bluealsa.service $pkgdir/usr/lib/systemd/system/bluealsa.service
}
