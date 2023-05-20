# Maintainer: Tom Zander

pkgname=fulcrum
pkgdesc='A fast & nimble SPV server for Bitcoin Cash'
pkgver=1.9.1
pkgrel=1
url='https://codeberg.org/Flowee/fulcrum'
arch=('x86_64')
license=('GPL3')
depends=(
  'qt5-base'
  'rocksdb'
  'python'
)
optdepends=('jemalloc: reduce memory fragmentation')
backup=('etc/fulcrum.conf')
install=fulcrum.install
provides=("$pkgname")
source=(
    "https://codeberg.org/Flowee/fulcrum/archive/v$pkgver.tar.gz"
    "fulcrum.conf"
    "0001-Fix-for-compiling-against-rocksdb-8.1-headers.patch"
)
sha256sums=('94ef6cdaf34ccc2a88afe6a9f9d4366f24dcefa0ddee0a4e7df94e050b620ae1'
    '7af8de6df023a2c06575e675de72af71abc1bdc74be6629c08aded63bf55ac1a'
    'a5e97b0bc19d330cfdae6ac052ec7e8d1be7d4ba7a07262371557c69b92c5b94'
)

prepare() {
  cd "fulcrum"
  patch -p1 < $srcdir/0001-Fix-for-compiling-against-rocksdb-8.1-headers.patch
  qmake -makefile CONFIG+=recheck CONFIG+=release Fulcrum.pro
}

build() {
  cd "fulcrum"
  make
}

package() {
  install -Dm 775 "$srcdir/fulcrum/Fulcrum" -T "$pkgdir/usr/bin/fulcrum"
  install -Dm 775 "$srcdir/fulcrum/FulcrumAdmin" -T "$pkgdir/usr/bin/fulcrum-admin"
  install -Dm 664 "$srcdir/fulcrum.conf" -t "$pkgdir/etc/"
  install -Dm 644 "$srcdir/fulcrum/contrib/rpm/fulcrum.service" -t "$pkgdir/usr/lib/systemd/system"
}
