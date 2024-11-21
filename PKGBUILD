# Maintainer: kbtz <contact@kbtz.dev>
# Contributor: eNV25 <env252525@gmail.com>

pkgref=keyd
pkgname=keyd-openrc
pkgver=2.5.0.r3.393d341
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc='A key remapping daemon for linux'
url='https://github.com/rvaiya/keyd'
license=('MIT')
makedepends=(git)
depends=(openrc)
provides=($pkgref)
conflicts=($pkgref)
install=$pkgref.install
optdepends=('python3: for keyd-application-mapper')
source=('git+https://github.com/rvaiya/keyd.git'
	Makefile.patch keyd.install keyd.init usb-gadget.init)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd $srcdir/$pkgref
	git describe --long --tags | sed -E '
		s/([^-]*-)g/r\1/
		s/-/./g
		s/^v//
	'
}

prepare(){ 
	cd $srcdir
	patch $pkgref/Makefile Makefile.patch
}

build() {
	cd $srcdir/$pkgref
	make
}

package() {
	cd $srcdir/$pkgref

	make DESTDIR=$pkgdir PREFIX=/usr install
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/keyd

	install -Dm755 $srcdir/keyd.init $pkgdir/etc/init.d/keyd
	if [ "$VKBD" = "usb-gadget" ]; then
		install -Dm755 $srcdir/usb-gadget.init $pkgdir/etc/init.d/keyd-usb-gadget
	fi
	
	# Set permissions for libinput quirks
	install -dm755 $pkgdir/usr/share/libinput
}
