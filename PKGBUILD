# Maintainer: Tadeo Kondrak <me@tadeo.ca>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot

_basename=libinput
pkgname=libinput-nosmoothing
pkgver=1.12.6
pkgrel=1
pkgdesc="Input device management and event handling library (with patch to disable graphics tablet smoothing)"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
conflicts=('libinput')
provides=("${_basename}=$pkgver")
# upstream doesn't recommend building docs
makedepends=('gtk3' 'meson') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-evdev: libinput measure')
source=(https://freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz{,.sig}
        disable-tablet-smoothing.patch)
sha512sums=('02ad90c77a0c8c27fd96ec34e1546c5f0947ced49bad386372c1ef7c41b3b2157c39020f0766f20aaf2ab3c97128567e169279bea21115ced39499dda325d2ef'
            'SKIP'
            'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd ${_basename}-$pkgver
  patch -p1 <../disable-tablet-smoothing.patch
}

build() {
  arch-meson $_basename-$pkgver build \
    -Dudev-dir=/usr/lib/udev \
    -Dtests=false \
    -Ddocumentation=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dvm644 $_basename-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$_basename/LICENSE"
}
