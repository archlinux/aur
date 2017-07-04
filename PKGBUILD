# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=libinput-git
pkgver=1.8.0.r7.gca9d6a8
pkgrel=1
pkgdesc='Input device management and event handling library'
arch=(i686 x86_64)
url='http://freedesktop.org/wiki/Software/libinput/'
provides=("libinput=${pkgver}")
license=('MIT')
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
checkdepends=('valgrind')
makedepends=('git' 'meson' 'doxygen' 'graphviz' 'gtk3')
conflicts=('libinput')
source=(git://anongit.freedesktop.org/wayland/libinput)
sha1sums=('SKIP')

pkgver() {
	cd libinput
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd libinput
	meson build --prefix=/usr \
	      --buildtype=release \
	      --libexecdir=/usr/lib \
	      -Dtests=false
	ninja -C build
}

check() {
	cd libinput/build
	mesontest
}

package() {
	cd libinput
	DESTDIR="$pkgdir" ninja -C build install

	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
