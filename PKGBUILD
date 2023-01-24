# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=d-feet
pkgver=0.3.16
pkgrel=2
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://wiki.gnome.org/Apps/DFeet"
license=('GPL2')
depends=('gtk3' 'python-gobject')
makedepends=('gobject-introspection' 'meson' 'python-pycodestyle' 'yelp-tools')
checkdepends=('xorg-server-xvfb')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha512sums=('ff4db968cbd679e2065c614d538187fe3c56118b44638771ec9f7472bdba4a798dc682565f520a8680a8001ea39ce88555b07cda172e60f88eb6bdf1e00b5a6d')

prepare() {
  cd $pkgname-$pkgver
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
