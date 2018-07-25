# Maintainer: Tom Vincent <aur@tlvince.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot

pkgname=libinput-no-hysteresis
_pkgname=libinput
pkgver=1.11.2
pkgrel=1
pkgdesc="Input device management and event handling library sans hysteresis"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
provides=("libinput=${pkgver}")
conflicts=("libinput=${pkgver}")
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
makedepends=('doxygen' 'graphviz' 'gtk3' 'meson')
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-evdev: libinput measure')
source=(https://freedesktop.org/software/$_pkgname/$_pkgname-$pkgver.tar.xz{,.sig}
        disable-hysteresis.patch)
sha512sums=('cb6ada877fc3c09f634f3db39d5507e66d4b86c3d632bb8f7498c7b01fdf8372b2053a79b641293900b7fcc0aa4e920f7c830d9c7b2d9ff3cd61c58eb7c20b65'
            'SKIP'
            '2217ec9b6b9a7843cec564eeae22e0f5f5ddacd946cc863735f43fe2a2b264e155b72aa1cf3d39f567a4c5007371d38c98c606751c3c32b7d6a132d5dfc2d52b')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd $_pkgname-$pkgver
  # Reduce docs size
  printf '%s\n' >>doc/libinput.doxygen.in \
    HAVE_DOT=yes DOT_IMAGE_FORMAT=svg INTERACTIVE_SVG=yes
  patch -p1 -i "${srcdir}/disable-hysteresis.patch"
}

build() {
  arch-meson $_pkgname-$pkgver build -Dtests=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dvm644 $_pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # install doc - no Makefile target
  install -d "$pkgdir/usr/share/doc"
  cp -av build/html "$pkgdir/usr/share/doc/libinput"
}
