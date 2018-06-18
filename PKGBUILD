# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=criptoreal-qt
pkgver=1.1.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://criptoreal.org/en/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(criptoreal)
install=criptoreal-qt.install
source=("${pkgname%-git}::git+https://github.com/CriptoReal/Criptoreal.git"
        "$pkgname.desktop" "secp256k1.patch")
sha256sums=('SKIP'
            '36074a1504e5307cdf577ce7efe63a6aabef7ca866fdf40294d09b14acdd86e5'
            '684bc456ea471d2dbc7c5463e386f94b245062b28fb50fb741799f76a74446d5')

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
  install -Dm644 criptoreal-qt.desktop "$pkgdir"/usr/share/applications/criptoreal.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/criptoreal-qt "$pkgdir"/usr/bin/criptoreal-qt
  install -Dm644 share/pixmaps/criptoreal128.png "$pkgdir"/usr/share/pixmaps/criptoreal128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
