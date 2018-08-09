# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=gentarium-qt
pkgver=1.1.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://gtmcoin.io/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(gentarium)
install=gentarium-qt.install
source=("${pkgname%-git}::git+https://github.com/genterium-project/gentarium.git#tag=v1.1.0"
        "$pkgname.desktop" 
        "secp256k1.patch")
sha256sums=('SKIP'
            '4a87b3fa5e5f3bdbee4ec44d786a50264a4bc800e53bef202769663b8131cbf7'
            '127f48f77d3685c9bfea77f7e809d1cca91dcf57845ff85c2f2af7f5a0835e2f')

prepare() {
   cd "$srcdir/$pkgname"
   patch -p1 -i "../secp256k1.patch" 
} 

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5 --disable-tests
  make
}


package() {
  install -Dm644 gentarium-qt.desktop "$pkgdir"/usr/share/applications/gentarium.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/gentarium-qt "$pkgdir"/usr/bin/gentarium-qt
  install -Dm644 share/pixmaps/gentarium128.png "$pkgdir"/usr/share/pixmaps/gentarium128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
