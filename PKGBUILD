# Maintainer: metscoin <mets_coin@outlook.com>

pkgname=manocoin-qt
pkgver=1.1.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://manocoin.org/"
license=('MIT')
pkgdesc="Cryptocurrency wallet(QT)"
depends=(boost-libs qt5-base qrencode miniupnpc db4.8 zeromq protobuf libevent)
makedepends=(boost qt5-tools)
conflicts=(manocoin)
install=manocoin-qt.install
source=("${pkgname%-git}::git+https://github.com/MasternodeFoundation/MANOcoin.git#tag=v${pkgver}"
        "$pkgname.desktop" "secp256k1.patch")
sha256sums=('SKIP'
            'cd17b24fd5ca7d2d1faa810ad791b762f7a4a858d5db27bbf0908b340eb58cbb'
            'd4968b2e3c100ee78f0305a6ebacee60466ebb7382fb1e51a58e39f1439daf92')

prepare() {
   cd "$srcdir/$pkgname"
   patch -p1 -i "../secp256k1.patch" 
}

build() {
  cd "$srcdir/$pkgname"
  find . -type f -iname "*.sh" -exec chmod +x {} \; 
  ./autogen.sh
  ./configure --with-gui=qt5
  make
}


package() {
  install -Dm644 manocoin-qt.desktop "$pkgdir"/usr/share/applications/manocoin.desktop
  cd "$srcdir/$pkgname"
  install -Dm755 src/qt/mano-qt "$pkgdir"/usr/bin/manocoin-qt
  install -Dm644 share/pixmaps/mano128.png "$pkgdir"/usr/share/pixmaps/manocoin128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
