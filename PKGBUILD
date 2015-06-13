# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=airspy-git
pkgver=20141216
pkgrel=1
pkgdesc="Host code for Airspy SDR."
arch=('i686' 'x86_64')
url="http://www.airspy.com"
license=('GPL2')
depends=('libusb>=1.0')
provides=('airspy')
conflicts=('airspy')
makedepends=('git' 'cmake')
source=("git+https://github.com/airspy/host"
        "airspy.conf")
md5sums=('SKIP'
         '29e481d56bfc56cface4f1457ca6df23')

_gitname="host"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
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
  install -Dm644 "../airspy-tools/52-airspy.rules" "$pkgdir/usr/lib/udev/rules.d/52-airspy.rules"
  install -Dm644 "$srcdir/airspy.conf" "$pkgdir/etc/modprobe.d/airspy.conf"
}

# vim:set ts=2 sw=2 et:
