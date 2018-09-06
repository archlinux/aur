# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=verticalcoin-qt
pkgver=1.3.0
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.verticalcoin.io/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(verticalcoin)
install=verticalcoin-qt.install
source=("${pkgname%-git}::git+https://github.com/verticalcoin/verticalcoin.git"
        "$pkgname.desktop"
        "zstd.patch")
sha256sums=('SKIP'
            'bb085a9d4679e338f577c45c154a2fed656fe1339f44894376117bcfbec238ba'
            '0d355f8baea6d09bffd673a0fdcb761cc5b4747464285ba97e638545dff8a237')

prepare() {
   cd "$srcdir/$pkgname"
   patch -p1 -i "../zstd.patch" 
}

build() {
  cd "$srcdir/$pkgname" || exit
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5 --disable-tests
  make
}


package() {
  install -Dm644 verticalcoin-qt.desktop "$pkgdir"/usr/share/applications/verticalcoin.desktop
  cd "$srcdir/$pkgname" || exit
  install -Dm755 src/qt/verticalcoin-qt "$pkgdir"/usr/bin/verticalcoin-qt
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/verticalcoin128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
