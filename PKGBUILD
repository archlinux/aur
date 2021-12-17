# Maintainer: Konrad Beckmann <konrad.beckmann@gmail.com>

pkgname=airspyhf-git
pkgver=r90.2bf53e1
pkgrel=1
pkgdesc="Host code for AirspyHF+ SDR."
arch=('i686' 'x86_64' 'aarch64')
url="http://www.airspy.com"
license=('BSD')
depends=('libusb>=1.0')
provides=('airspyhf')
conflicts=('airspyhf')
makedepends=('git' 'cmake' 'make' 'gcc' 'pkgconfig')
source=("git+https://github.com/airspy/airspyhf")
md5sums=('SKIP')

_gitname="airspyhf"

pkgver() {
  cd "$srcdir/$_gitname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -Wno-dev ../
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "../tools/52-airspyhf.rules" "$pkgdir/usr/lib/udev/rules.d/52-airspyhf.rules"
}

# vim:set ts=2 sw=2 et:
