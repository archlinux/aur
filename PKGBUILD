# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=libinput-fix101796-git
pkgver=1.8.0.r48.g27ebea9
pkgrel=1
pkgdesc='Input device management and event handling library (patched to fix bug #101796)'
arch=(i686 x86_64)
url='http://freedesktop.org/wiki/Software/libinput/'
provides=("libinput=${pkgver}")
license=('MIT')
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
checkdepends=('valgrind')
makedepends=('git' 'meson' 'doxygen' 'graphviz' 'gtk3')
conflicts=('libinput')
source=('git://anongit.freedesktop.org/wayland/libinput' 'fix-101796.patch')
sha1sums=('SKIP' '47a933749448928edf23a07c82d6d75be04e4285')

prepare() {
	cd libinput
	patch -p1 -i ../fix-101796.patch
}

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
