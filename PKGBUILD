# Maintainer: Tom Vincent <aur@tlvince.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot

pkgname=libinput-no-hysteresis
_pkgname=libinput
pkgver=1.8.3
pkgrel=1
pkgdesc="Input device management and event handling library sans hysteresis"
arch=(i686 x86_64)
url="https://www.freedesktop.org/wiki/Software/libinput/"
license=(custom:X11)
provides=("libinput=${pkgver}")
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
makedepends=('doxygen' 'graphviz' 'gtk3' 'meson')
optdepends=('gtk3: libinput debug-gui')
source=(https://freedesktop.org/software/$_pkgname/$_pkgname-$pkgver.tar.xz{,.sig} disable-hysteresis.patch)
sha512sums=('88006d217e3507858fa6b9ac1f25c267255fb51d1bcf1208d2afd423bf2a9292944bc5526ea91f27fad3ff04c2f9f43ab3aa25fd9fb7ace1231ecd33ddf18de6'
            'SKIP'
            '22c97898b8bd2ed6757ce2a0f2c19d8ff908b3134a9bd435285bc5c59d9d4a17cc5bb4ef0bfb01001ef9aeb2c917bdcc79324cc68bc442c2038d9c448773ac5e')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  mkdir build
  cd $_pkgname-$pkgver
  patch -p1 -i "${srcdir}/disable-hysteresis.patch"
}

build() {
  cd build
  meson --prefix=/usr --buildtype=release ../$_pkgname-$pkgver --libexecdir=/usr/lib \
    -Dtests=false
  ninja
}

package() {
  pwd
  cd build
  DESTDIR="$pkgdir" ninja install

  cd ../$_pkgname-$pkgver
  install -Dvm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # install doc - no Makefile target
  install -dv "$pkgdir/usr/share/doc/libinput"
  cp -av doc/html/* "$pkgdir/usr/share/doc/libinput"
}
