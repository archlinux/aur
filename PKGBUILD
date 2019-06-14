# Maintainer: Tadeo Kondrak <me@tadeo.ca>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot

_basename=libinput
pkgname=libinput-nosmoothing
pkgver=1.13.2
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
sha512sums=('26f11c5274c26acc38b9b5729195010c0799a9563f1eb0e0cd67e323f8ed73b0fc8db8584ec8fdf1b726417f64c2daeb54832167079832626c8c1190fccf459f'
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
