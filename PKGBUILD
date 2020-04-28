# Maintainer: Danny Lin <[firstname] at kdrag0n dot dev>

_pkgname=libinput
pkgname=libinput-hires-scroll
pkgver=1.15.5
pkgrel=1
pkgdesc="Input device management and event handling library - patched for hi-res wheel scroll"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
conflicts=($_pkgname)
provides=("$_pkgname=$pkgver-$pkgrel")
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
# upstream doesn't recommend building docs
makedepends=('gtk3' 'meson') # 'doxygen' 'graphviz' 'python-sphinx' 'python-recommonmark'
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-libevdev: libinput measure')
source=(https://freedesktop.org/software/$_pkgname/$_pkgname-$pkgver.tar.xz{,.sig}
        mr139.patch)
sha512sums=('a0a3a325048841fc017e19d3bc5f5490605972ab9e2730dc5678bda7efb7a5b1fa6f531f3c8abd8393899ec383d8d2bcfd586eacee04fc1fbda0e02ba2af956a'
            'SKIP'
            '61e5cfac34eaaa93cdc7ae6a14e8ff9fbca9f13e6954101c46d8bfb47ae5e09e98669f4759ab01bac765d1b510e693beff9a842d48ce861ccf7c5e782abc0c0b')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd $_pkgname-$pkgver
  rm -f doc/user/wheel-api.rst
  patch -Np1 -i ../mr139.patch
}

build() {
  arch-meson $_pkgname-$pkgver build \
    -Dudev-dir=/usr/lib/udev \
    -Dtests=false \
    -Ddocumentation=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  install -Dvm644 $_pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
