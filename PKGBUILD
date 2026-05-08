# Maintainer: Tom Zander
# Maintainer: Calvin McAnarney <calvin@mcanarney.org>

pkgname=fulcrum
pkgdesc='A fast & nimble SPV server for BCH, BTC, and LTC'
pkgver=2.1.1
pkgrel=1
url='https://fulcrumserver.org'
arch=('x86_64')
license=('GPL3')
depends=(
  'qt6-base'
  'rocksdb'
  'python'
  'miniupnpc'
)
optdepends=('jemalloc: reduce memory fragmentation')
backup=('etc/fulcrum.conf')
install=fulcrum.install
provides=("$pkgname")
source=(
    "https://github.com/cculianu/Fulcrum/releases/download/v$pkgver/Fulcrum-$pkgver-src.tar.gz"
    "fulcrum.conf"
)
sha256sums=('49f72ccc5f811603ff93a8b6cca88eb81485b959741abba5817f4763504fb03a'
            '39c732e08ffa4d5b566b49f1e3a6929c8d0a12590e1616ccad1d6d4d8987e3a6')

prepare() {
  cd "Fulcrum-$pkgver-src/"
  qmake -makefile CONFIG+=recheck CONFIG+=release Fulcrum.pro
}

build() {
  cd "Fulcrum-$pkgver-src/"
  make
}

package() {
  install -Dm 775 "$srcdir/Fulcrum-$pkgver-src/Fulcrum" -T "$pkgdir/usr/bin/fulcrum"
  install -Dm 775 "$srcdir/Fulcrum-$pkgver-src/FulcrumAdmin" -T "$pkgdir/usr/bin/fulcrum-admin"
  install -Dm 664 "$srcdir/fulcrum.conf" -t "$pkgdir/etc/"
  install -Dm 644 "$srcdir/Fulcrum-$pkgver-src/contrib/rpm/fulcrum.service" -t "$pkgdir/usr/lib/systemd/system"
}
