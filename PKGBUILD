# Maintainer: Henri Derycke <nheir.kim@gmail.com>
pkgname=bluez-alsa-git
pkgver=v1.3.0.r9.g1427cbd
pkgrel=1
pkgdesc="Bluetooth Audio ALSA Backend"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Arkq/bluez-alsa"
license=('MIT')
depends=('bluez-libs' 'glib2' 'libfdk-aac' 'sbc' 'alsa-lib')
makedepends=('git')
source=("$pkgname::git+https://github.com/Arkq/bluez-alsa.git"
	bluealsa.service
	bluealsa.tmpfiles
	bluealsa.sysusers)
md5sums=('SKIP'
         'cf4fb625e446f0e0ab60e7795b764043'
         '3a1e1f2ed2dda1fc28f9dbc6c55b095c'
         'd77dd60a98613682a149b6e4e32bc5bc')
install=bluealsa.install
pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	autoreconf --install
	./configure --prefix=/usr \
	            --enable-aac
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm0644 $srcdir/$pkgname/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm0644 $srcdir/bluealsa.tmpfiles $pkgdir/usr/lib/tmpfiles.d/bluealsa.conf
	install -Dm0644 $srcdir/bluealsa.sysusers $pkgdir/usr/lib/sysusers.d/bluealsa.conf
	install -Dm0644 $srcdir/bluealsa.service $pkgdir/usr/lib/systemd/system/bluealsa.service
}
