# Maintainer: David Parrish <daveparrish@gmail.com>

pkgbase=elements-mainchain-git
pkgname=('elements-mainchain-cli-git' 'elements-mainchain-daemon-git' 'elements-mainchain-qt-git')
pkgver=r8258.0b05c94
pkgrel=1
arch=('i686' 'x86_64')
url="http://elementsproject.org/"
license=('MIT')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf')
source=("${pkgbase}::git+https://github.com/ElementsProject/elements#branch=mainchain"
  "elements-bitcoin.desktop")
sha256sums=('SKIP'
            '6737b1733fad150bf70d0b6df10a2e9a1ce0a0ae56d0d30e34f08c1ed1c79977')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgbase}"
  ./autogen.sh
  ./configure --with-incompatible-bdb
  make
}

package_elements-mainchain-cli-git() {
  pkgdesc="Bitcoin RPC cli client modified for bitcoin experiments"
  depends=(boost-libs openssl)
  conflicts=(bitcoin-cli)

  cd "$pkgbase"
  install -Dm755 src/bitcoin-cli "$pkgdir"/usr/bin/bitcoin-cli
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_elements-mainchain-daemon-git() {
  pkgdesc="Bitcoin daemon modified for bitcoin experiments"
  depends=(boost-libs miniupnpc openssl)
  conflicts=(bitcoin-daemon)

  cd "$pkgbase"
  install -Dm755 src/bitcoind "$pkgdir"/usr/bin/bitcoind
  install -Dm644 contrib/debian/examples/bitcoin.conf \
    "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
  install -Dm644 contrib/debian/manpages/bitcoind.1 \
    "$pkgdir"/usr/share/man/man1/bitcoind.1
  install -Dm644 contrib/debian/manpages/bitcoin.conf.5 \
    "$pkgdir"/usr/share/man/man5/bitcoin.conf.5
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_elements-mainchain-qt-git() {
  pkgdesc="Bitcoin Qt GUI modified for bitcoin experiments"
  depends=(boost-libs qt4 miniupnpc qrencode protobuf)
  conflicts=(bitcoin-qt)
 
  cd "$pkgbase"
  install -Dm755 src/qt/bitcoin-qt "$pkgdir"/usr/bin/bitcoin-qt
  install -Dm644 "$srcdir"/elements-bitcoin.desktop \
    "$pkgdir"/usr/share/applications/elements-bitcoin.desktop
  install -Dm644 share/pixmaps/bitcoin128.png \
    "$pkgdir"/usr/share/pixmaps/bitcoin128.png

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
