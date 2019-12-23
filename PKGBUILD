# Maintainer: Henri Derycke <nheir.kim@gmail.com>
pkgname=bluez-alsa-git
pkgver=2.0.0.r42.gb7eda3a
pkgrel=1
pkgdesc="Bluetooth Audio ALSA Backend"
arch=('x86_64' 'armv7h' 'aarch64' 'armv6h')
url="https://github.com/Arkq/bluez-alsa"
license=('MIT')
depends=('bluez-libs' 'glib2' 'libfdk-aac' 'sbc' 'alsa-lib')
makedepends=('git')
source=("$pkgname::git+https://github.com/Arkq/bluez-alsa.git"
	bluealsa.service
	bluealsa.conf)
md5sums=('SKIP'
         '9a166b5c2962e6d2cd7febe52342962c'
         '2a661e9d06f0bf82796e027a30910bbd')
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
	install -Dm0644 $srcdir/bluealsa.conf $pkgdir/etc/conf.d/bluealsa
}
