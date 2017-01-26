# $Id: PKGBUILD 287240 2017-01-23 18:46:28Z andyrtr $
# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname_orig=libinput
pkgname=libinput-hith
pkgver=1.6.0
pkgrel=1
pkgdesc="Input device management and event handling library -- compiled with high tap threshold values"
arch=(i686 x86_64)
url="https://www.freedesktop.org/wiki/Software/libinput/"
license=(custom:X11)
depends=('mtdev' 'systemd' 'libevdev' 'libwacom')
# currently no doc files to install
makedepends=('doxygen' 'graphviz' 'gtk3')
#checkdepends=('check' 'libunwind')
provides=('libinput=1.6.0')
conflicts=('libinput')
source=(https://freedesktop.org/software/$pkgname_orig/$pkgname_orig-$pkgver.tar.xz)
sha256sums=('b7534f518d735c643aedca2fb4694683dfddc8d0600cfb628c87a18e65255832')

prepare() {
  sed -ie 's/#define DEFAULT_TAP_INITIAL_TIMEOUT_PERIOD ms2us(100)/#define DEFAULT_TAP_INITIAL_TIMEOUT_PERIOD ms2us(180)/g' $pkgname_orig-$pkgver/src/evdev-mt-touchpad-tap.c 
  sed -ie 's/#define DEFAULT_TAP_MOVE_THRESHOLD TP_MM_TO_DPI_NORMALIZED(1.3)/#define DEFAULT_TAP_MOVE_THRESHOLD TP_MM_TO_DPI_NORMALIZED(3)/g' $pkgname_orig-$pkgver/src/evdev-mt-touchpad-tap.c
}

build() {
  cd $pkgname_orig-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd $pkgname_orig-$pkgver
# disabled for now:
# https://github.com/libcheck/check/issues/18
#  make check
}

package() {
  cd $pkgname_orig-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname_orig}/COPYING"
  # install doc - no Makefile target
  install -v -dm755 ${pkgdir}/usr/share/doc/libinput
  cp -rv doc/html/* ${pkgdir}/usr/share/doc/libinput
}
