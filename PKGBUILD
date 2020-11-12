# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=d-feet
pkgver=0.3.15
pkgrel=3
pkgdesc="D-Bus debugger for GNOME"
arch=('any')
url="https://wiki.gnome.org/Apps/DFeet"
license=('GPL2')
depends=('gtk3' 'python-gobject')
makedepends=('gobject-introspection' 'meson' 'python-pycodestyle' 'yelp-tools')
checkdepends=('xorg-server-xvfb')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('1fff149ad01ccbd93c927f5733346a9122324b9d367da3adbf4f1a52e47dfdb1')

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
  DESTDIR="$pkgdir" meson install -C build
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
