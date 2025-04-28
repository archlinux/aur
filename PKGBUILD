# Maintainer: Tom Zander
# Maintainer: Calvin McAnarney <calvin@mcanarney.org>

pkgname=fulcrum
pkgdesc='A fast & nimble SPV server for Bitcoin Cash'
pkgver=1.12.0
pkgrel=2
url='https://codeberg.org/Flowee/fulcrum'
arch=('x86_64')
license=('GPL3')
depends=(
  'qt5-base'
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
sha256sums=('db53a495011e2df6c0f8913fea720f1268a877ac2602fe079190c43b08cbe1a7'
    '39c732e08ffa4d5b566b49f1e3a6929c8d0a12590e1616ccad1d6d4d8987e3a6'
)

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
