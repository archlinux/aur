# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributor: Loïc Guitaut <flink at belfalas.eu>
# Contributor: Nicolas Doualot <packages at slubman.info>

pkgname=litecoin-qt
pkgver=0.21.2.1
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer network based digital currency (QT)"
depends=(boost-libs qt5-base miniupnpc qrencode protobuf libevent fmt)
makedepends=(boost qt5-tools)
conflicts=(litecoin)
install=litecoin-qt.install
source=("https://download.litecoin.org/litecoin-${pkgver}/src/litecoin-${pkgver}.tar.gz"
        "boost1770.patch"
        "$pkgname.desktop"
        "litecoin128.png")
sha256sums=('533516ebbf5f4efa5b2a789cb93ae9805172c1f547d6cd77c1e8f2bd0e89e00c'
            '3ccbff49fef5a7e820168f4c4b75ae9a1e74e81dc08587145aa85599254b85e5'
            'cfc53dc9028745358235698ddd562d3e6b4a3ea9f896f5efc1aa8cd81f595559'
            '79fb205581c1e6df9758b56e2b527350f23124677036bc68176d088c4a28af8d')

build() {
  cd "$srcdir/litecoin-$pkgver"
  patch -p1 <$srcdir/boost1770.patch
  ./autogen.sh
  ./configure --with-incompatible-bdb --with-gui=qt5
  make
}


package() {
  install -Dm644 litecoin-qt.desktop "$pkgdir"/usr/share/applications/litecoin.desktop
  install -Dm644 litecoin128.png "$pkgdir"/usr/share/pixmaps/litecoin128.png
  cd "$srcdir/litecoin-$pkgver"
  install -Dm755 src/qt/litecoin-qt "$pkgdir"/usr/bin/litecoin-qt
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

