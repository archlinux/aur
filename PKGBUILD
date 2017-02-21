# Maintainer: Tom Zander

pkgname=bitcoin-classic
pkgver=1.2.1
pkgrel=1
pkgdesc='Bitcoin Classic with bitcoind, bitcoin-cli, bitcoin-tx, and bitcoin-qt'
arch=('i686' 'x86_64')
url="https://bitcoinclassic.com/"
license=('MIT')
depends=('boost-libs' 'libevent' 'desktop-file-utils' 'qt5-base' 'protobuf' 'openssl' 'miniupnpc' 'zeromq' 'qrencode')
makedepends=('boost' 'qt5-tools')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin.install
backup=("etc/bitcoin/bitcoin.conf")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/bitcoinclassic/bitcoinclassic/archive/v${pkgver}.tar.gz"
    "bitcoin.logrotate"
    "bitcoin.conf")
sha256sums=('7b57dcd9cc6cda6ede39de2c837335752c0feeae4f6793e4ec75fb6efdc8ecbe'
    "7bf4bdad419c1ee30b88c7e4190707c5ff250da8b23d68d5adf14043f8e2ac73"
    "c8787560c6423605796c8d3e080cb522ed849cea12b5c23293c22e405a015a53")

build() {
  cd "bitcoinclassic-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --with-incompatible-bdb --with-gui=qt5 --enable-hardening \
        --enable-reduce-exports --disable-gui-tests --disable-maintainer-mode
  make
}

check() {
  "bitcoinclassic-$pkgver/src/test/test_bitcoin"
}

package() {
  cd "bitcoinclassic-$pkgver"

  install -Dm755 "src/qt/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
  install -Dm644 "share/pixmaps/bitcoin128.png" "$pkgdir/usr/share/pixmaps/bitcoin128.png"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "contrib/debian/bitcoin-qt.desktop" "$pkgdir/usr/share/applications/bitcoin.desktop"

  install -Dm644 "contrib/debian/examples/bitcoin.conf"\
        -t "$pkgdir/usr/share/doc/bitcoin/examples"
  install -Dm644 "contrib/debian/manpages/bitcoind.1"\
        -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "contrib/debian/manpages/bitcoin.conf.5"\
        -t "$pkgdir/usr/share/man/man5"

  install -Dm 644 "$srcdir/bitcoin.conf" "share/rpcuser/rpcuser.py" -t "$pkgdir/etc/bitcoin"
  install -Dm 644 "contrib/init/bitcoind.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/bitcoin.logrotate" "$pkgdir/etc/logrotate.d/bitcoin"

  install -Dm 644 contrib/bitcoind.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/bitcoind"

  install -Dm755 "src/bitcoind" "src/bitcoin-cli" "src/bitcoin-tx" -t "$pkgdir/usr/bin"
}
