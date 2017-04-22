# Maintainer: Tom Vincent <aur@tlvince.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot

pkgname=libinput-no-hysteresis
_pkgname=libinput
pkgver=1.7.0
pkgrel=2
pkgdesc="Input device management and event handling library sans hysteresis"
arch=(i686 x86_64)
url="https://www.freedesktop.org/wiki/Software/libinput/"
provides=("libinput=${pkgver}")
license=(custom:X11)
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
# currently no doc files to install
makedepends=('doxygen' 'graphviz' 'gtk3')
#checkdepends=('check' 'libunwind')
conflicts=('libinput')
replaces=('libinput')
source=(https://freedesktop.org/software/$_pkgname/$_pkgname-$pkgver.tar.xz{,.sig} disable-hysteresis.patch)
sha512sums=('9058eab813ea3de230835155ca843f248127cbafaf1aecc9a2e209a0215b090beef0468cc863a24320f8d0db1f2863baba680e2416e9e409e958b2c1d18e43a1'
            'SKIP'
            '22c97898b8bd2ed6757ce2a0f2c19d8ff908b3134a9bd435285bc5c59d9d4a17cc5bb4ef0bfb01001ef9aeb2c917bdcc79324cc68bc442c2038d9c448773ac5e')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i "${srcdir}/disable-hysteresis.patch"
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd $_pkgname-$pkgver
# disabled for now:
# https://github.com/libcheck/check/issues/18
#  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  # install doc - no Makefile target
  install -v -dm755 ${pkgdir}/usr/share/doc/libinput
  cp -rv doc/html/* ${pkgdir}/usr/share/doc/libinput
}
