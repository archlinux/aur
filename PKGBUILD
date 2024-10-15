# Maintainer: Aditya Bhargava <libinput-noaccum.basket389 at slmail dot me>
_pkgname=libinput
pkgname=$_pkgname-noaccum
pkgver=1.26.2
pkgrel=1
pkgdesc="libinput with ACC_V120_THRESHOLD set to 1 for smooth high-resolution scrolling"
url="https://gitlab.freedesktop.org/libinput/libinput"
arch=(x86_64)
license=(MIT)
depends=('mtdev' 'libevdev' 'libwacom' 'systemd-libs' 'glibc')
# upstream doesn't recommend building docs
makedepends=('gtk4' 'meson' 'wayland-protocols' 'check' 'sed') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
checkdepends=('python-pytest')
optdepends=('gtk4: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure'
            'python-yaml: used by various tools')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=(https://gitlab.freedesktop.org/libinput/libinput/-/archive/$pkgver/$_pkgname-$pkgver.tar.bz2)
sha256sums=('e2dbbf515905086dc3f8c8536d326e04012f5716b8b047bb3392a17b13ca78ec')
#validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  sed -i \
    -e '/^#define ACC_V120_THRESHOLD 60$/s/60/1/' \
      "${srcdir}"/$_pkgname-$pkgver/src/evdev-wheel.c
}

build() {
  arch-meson $_pkgname-$pkgver build \
    -D udev-dir=/usr/lib/udev \
    -D documentation=false

  # Print config
  meson configure build

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dvm644 $_pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
