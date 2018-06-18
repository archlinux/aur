# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=creativecoin-qt
pkgver=1.2.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://creativechain.org/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(creativecoin)
install=creativecoin-qt.install
source=("${pkgname%-git}::git+https://github.com/creativechain/creativechain-core.git"
        "$pkgname.desktop" "boost166.patch")
sha256sums=('SKIP'
            'e1f166f658e2234913de9c80f82cbf05259e67bf705aa6f9500def4524045df8'
            'f3828f3633d0534efb60399a44b315b155d6bc0105195095d374039e8020164e'
           )

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i "../boost166.patch" 
}

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5 --disable-tests
  make
}


package() {
  install -Dm644 creativecoin-qt.desktop "$pkgdir"/usr/share/applications/creativecoin.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/creativecoin-qt "$pkgdir"/usr/bin/creativecoin-qt
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/creativecoin128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
