# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=piedock
_pkgname=PieDock
pkgver=1.6.9
pkgrel=1
pkgdesc="A task bar and application launcher in shape of a circular pie menu."
arch=(i686 x86_64)
url="http://www.markusfisch.de/"
license=('custom:MIT')
depends=('libxft' 'libxmu' 'freetype2')
optdepends=('gnome-icon-theme: default icons')
install="$pkgname.install"
# source=("${url}downloads/$pkgname-$pkgver.tar.bz2")
source=("$pkgname-$pkgver.tar.gz::https://github.com/markusfisch/$_pkgname/archive/$pkgver.tar.gz"
        "$pkgname.desktop"
        "freetype-config.patch")
sha256sums=('c20070d9fdf66caf30f954d4435b2d8522ec848a2d00ddb1541c1b39e28842cd'
            '3b1b6e248eecf4591eb0502e914a79e2449e405655fe1f54c8f593b1b6cbcfe4'
            '73ddf4930c1e3716975868504c354a45594bf147454ff73a234b68068d4a9b10')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np2 -b -z .orig <../freetype-config.patch
  autoreconf -fiv
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make V=0
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir/" install

  # configuration file
  install -Dm644 res/${pkgname}rc.sample \
    "$pkgdir/usr/share/$pkgname/${pkgname}rc.sample"

  # additional icons
  cp -a res/window-control \
    "$pkgdir/usr/share/$pkgname"

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
