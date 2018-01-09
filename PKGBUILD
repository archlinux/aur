# Maintainer: Tom Vincent <aur@tlvince.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot

pkgname=libinput-no-hysteresis
_pkgname=libinput
pkgver=1.9.4
pkgrel=1
pkgdesc="Input device management and event handling library sans hysteresis"
url="https://www.freedesktop.org/wiki/Software/libinput/"
arch=(x86_64)
license=(custom:X11)
provides=("libinput=${pkgver}")
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
makedepends=('doxygen' 'graphviz' 'gtk3' 'meson')
optdepends=('gtk3: libinput debug-gui'
            'python-pyudev: libinput measure'
            'python-evdev: libinput measure')
source=(https://freedesktop.org/software/$_pkgname/$_pkgname-$pkgver.tar.xz{,.sig}
        disable-hysteresis.patch)
sha512sums=('302f9497ea9ffb2163c643e9ca2f0a773ea141f6fe0a3aa3d8e86eb11a5d11e75d858b1e679ebfd3f913c645beac059cfd356b37c4ea17a8853068f79a740a4b'
            'SKIP'
            '22c97898b8bd2ed6757ce2a0f2c19d8ff908b3134a9bd435285bc5c59d9d4a17cc5bb4ef0bfb01001ef9aeb2c917bdcc79324cc68bc442c2038d9c448773ac5e')
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
