# Maintainer: Miguel Palencia <mike@qtum.org>

pkgname=qtum-core
pkgver=0.17.2
pkgrel=2
pkgdesc="Qtum Core is a Smart Contracts blockchain platform which makes use of UTXO and Proof of Stake."
arch=('x86_64')
url="https://qtum.org"
depends=('boost-libs' 'libevent' 'desktop-file-utils' 'qt5-base' 'protobuf' 'openssl' 'miniupnpc' 'zeromq' 'qrencode')
makedepends=('boost' 'qt5-tools' 'miniupnpc' 'qrencode' 'zeromq' 'git')
license=('MIT')
source=(https://github.com/qtumproject/qtum/archive/mainnet-ignition-v$pkgver.tar.gz)
sha256sums=('e4899740ae73759796d7769c4631f8d075c1c3eccab58dd6090f14ea539225a9')
provides=('qtum-cli' 'qtum-daemon' 'qtum-tx' 'qtum-qt')
conflicts=('qtum-cli' 'qtum-daemon' 'qtum-tx' 'qtum-qt')


build() {
  cd "$srcdir/qtum-mainnet-ignition-v$pkgver/"
  git clone https://github.com/qtumproject/cpp-eth-qtum.git src/cpp-ethereum
  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr/ \
    --with-incompatible-bdb \

  make
}


package() {
  cd "$srcdir/qtum-mainnet-ignition-v$pkgver"
 msg2 'Fixing btc references...'
  sed -i -e 's/Bitcoin/Qtum/g' contrib/debian/qtum-qt.desktop
  
  msg2 'Installing wallet...'
  install -Dm755 src/qt/qtum-qt "$pkgdir"/usr/bin/qtum-qt
  install -Dm644 contrib/debian/qtum-qt.desktop \
    "$pkgdir"/usr/share/applications/qtum.desktop
  install -Dm644 share/pixmaps/bitcoin128.png \
    "$pkgdir"/usr/share/pixmaps/qtum128.png

}



