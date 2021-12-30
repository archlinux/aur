# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributor: Loïc Guitaut <flink at belfalas.eu>
# Contributor: Nicolas Doualot <packages at slubman.info>

pkgname=litecoin-qt
pkgver=0.18.1
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer network based digital currency (QT)"
depends=(boost-libs qt5-base miniupnpc qrencode protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(litecoin)
install=litecoin-qt.install
source=("https://download.litecoin.org/litecoin-${pkgver}/src/litecoin-${pkgver}.tar.gz"
        "deque.patch"
        "qpainterpath.patch"
        "boost1770.patch"
        "$pkgname.desktop")
sha256sums=('6dfa71ccf059463f0a304f85ff1ca8b88039d63e93269d6f056ab24915be936d'
            '595b465639a0ac22c262da404b942d682b8bda5f010db9b13d07b671b3877af1'
            'd7716150afe7cd49b708699c27f5e39835b6849c4839c005ff36b4e06ccd9593'
            '3ccbff49fef5a7e820168f4c4b75ae9a1e74e81dc08587145aa85599254b85e5'
            'cfc53dc9028745358235698ddd562d3e6b4a3ea9f896f5efc1aa8cd81f595559')

build() {
  cd "$srcdir/litecoin-$pkgver"
  patch -p2 <$srcdir/deque.patch
  patch -p1 <$srcdir/qpainterpath.patch
  patch -p1 <$srcdir/boost1770.patch
  ./autogen.sh
  ./configure --with-incompatible-bdb --with-gui=qt5
  make
}


package() {
  install -Dm644 litecoin-qt.desktop "$pkgdir"/usr/share/applications/litecoin.desktop
  cd "$srcdir/litecoin-$pkgver"
  install -Dm755 src/qt/litecoin-qt "$pkgdir"/usr/bin/litecoin-qt
  #install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/litecoin128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

