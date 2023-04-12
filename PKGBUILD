# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=d-feet
pkgver=0.3.16
pkgrel=3
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://wiki.gnome.org/Apps/DFeet"
license=('GPL2')
depends=('gtk3' 'python-gobject')
makedepends=('gobject-introspection' 'meson' 'python-pycodestyle' 'yelp-tools')
checkdepends=('xorg-server-xvfb')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz meson-drop-unused-argument.patch python-del-fix.patch)
sha512sums=('ff4db968cbd679e2065c614d538187fe3c56118b44638771ec9f7472bdba4a798dc682565f520a8680a8001ea39ce88555b07cda172e60f88eb6bdf1e00b5a6d'
            '019dbeff67c22eccab4e34ed3c3aa292a86c6113f0f9575ecbec948aa5e2fc06f0f862d8e07d8ce566045e6aeb985cebddbc3c70ce6cffc8a074c1e08c80e27c'
            '082938045dda067c1fca4d3954fffbaf6d3fe39e5a69ce4e6d629aa62c148009e7f228f01b76863d2b78d6fac663a93eb06988b1239901bfb41b2f65d62f249e')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ${srcdir}/meson-drop-unused-argument.patch
  patch -Np1 -i ${srcdir}/python-del-fix.patch
}

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

check() {
  xvfb-run meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
