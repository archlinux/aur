# Maintainer: Parker Reed <parker.l.reed@gmail.com>

pkgname=libinput-nomiddletap
_basename=libinput
pkgver=1.14.3
pkgrel=1
pkgdesc="Input device management and event handling library (With middle button tap disabled)"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
# upstream doesn't recommend building docs
makedepends=('gtk3' 'meson') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure')
provides=('libinput=${pkgver}')
conflicts=('libinput')
source=(https://freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz{,.sig})
sha512sums=('f01d1bd1b25b8060519575644597d35f0c89de5386d298441f440128ceee3e57549921a058adec31adc8b33dbdedf4c0bd12c76905a69f752859d3136e26336d'
            'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

build() {
  sed 's/BTN_LEFT\, BTN_RIGHT\, BTN_MIDDLE/BTN_LEFT\, BTN_RIGHT/g' -i $_basename-$pkgver/src/evdev-mt-touchpad-tap.c
  arch-meson $_basename-$pkgver build \
    -Dudev-dir=/usr/lib/udev \
    -Dtests=false \
    -Ddocumentation=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dvm644 $_basename-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
