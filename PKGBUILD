# Maintainer: Vincent Grande <shoober420@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot

pkgname=libinput-git
pkgver=1.12.3.r8.g51ffff36
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
depends=('mtdev' 'libevdev' 'libwacom')
provides=('libinput')
conflicts=('libinput')
# upstream doesn't recommend building docs
makedepends=('gtk3' 'meson') # 'doxygen' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-evdev: libinput measure')
source=(git+https://gitlab.freedesktop.org/libinput/libinput)
sha512sums=('SKIP')
validpgpkeys=('SKIP') # Peter Hutterer (Who-T) <office@who-t.net>

pkgver() {
	cd libinput
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson libinput build \
    -Dudev-dir=/usr/lib/udev \
    -Dtests=false \
    -Ddocumentation=false
  ninja $NINJAFLAGS -C build
}

package() {
  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C build install

  install -Dvm644 libinput/COPYING \
    "$pkgdir/usr/share/licenses/libinput/LICENSE"
}
