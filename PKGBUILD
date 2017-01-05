# Maintainer: Tom Zander

pkgname=bitcoin-classic
pkgver=1.2.0
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
source=("https://github.com/bitcoinclassic/bitcoinclassic/archive/v1.2.0.tar.gz"
    "bitcoin.logrotate"
    "bitcoin.conf")
sha256sums=('7f16cd27f711d7dfbdc103e79d04800a27e63ed432e3076dd34552c37710a5ac'
    "7bf4bdad419c1ee30b88c7e4190707c5ff250da8b23d68d5adf14043f8e2ac73"
    "c8787560c6423605796c8d3e080cb522ed849cea12b5c23293c22e405a015a53")

build() {
  cd "$srcdir/bitcoinclassic-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure --prefix=/usr --with-incompatible-bdb --with-gui=qt5 --enable-hardening \
        --enable-reduce-exports --disable-gui-tests --disable-maintainer-mode
  make -j$(nproc)
}

check() {
  "$srcdir/bitcoinclassic-$pkgver/src/test/test_bitcoin"
}

package() {
  cd "$srcdir/bitcoinclassic-$pkgver"

  msg2 'Installing bitcoin-qt...'
  install -Dm755 "$srcdir/bitcoinclassic-$pkgver/src/qt/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
  install -Dm644 "$srcdir/bitcoinclassic-$pkgver/share/pixmaps/bitcoin128.png"\
        "$pkgdir/usr/share/pixmaps/bitcoin128.png"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  cp "$srcdir/bitcoinclassic-$pkgver/contrib/debian/bitcoin-qt.desktop" "$srcdir/bitcoinclassic-$pkgver/bitcoin.desktop"
  desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "bitcoin.desktop"

  msg2 'Installing bitcoin-daemon...'
  install -Dm755 "$srcdir/bitcoinclassic-$pkgver/src/bitcoind" "$pkgdir/usr/bin/bitcoind"
  install -Dm644 "$srcdir/bitcoinclassic-$pkgver/contrib/debian/examples/bitcoin.conf"\
        "$pkgdir/usr/share/doc/bitcoin/examples/bitcoin.conf"
  install -Dm644 "$srcdir/bitcoinclassic-$pkgver/contrib/debian/manpages/bitcoind.1"\
        "$pkgdir/usr/share/man/man1/bitcoind.1"
  install -Dm644 "$srcdir/bitcoinclassic-$pkgver/contrib/debian/manpages/bitcoin.conf.5"\
        "$pkgdir/usr/share/man/man5/bitcoin.conf.5"

  msg2 'Installing bitcoin.conf...'
  install -Dm 644 "$srcdir/bitcoin.conf" "$pkgdir/etc/bitcoin/bitcoin.conf.dist"
  install -Dm 644 "$srcdir/bitcoinclassic-$pkgver/share/rpcuser/rpcuser.py" "$pkgdir/etc/bitcoin/rpcuser.py"

  msg2 'Installing bitcoin.service...'
  install -Dm 644 "$srcdir/bitcoinclassic-$pkgver/contrib/init/bitcoind.service" \
               -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing bitcoin.logrotate...'
  install -Dm 644 "$srcdir/bitcoin.logrotate" "$pkgdir/etc/logrotate.d/bitcoin"

  msg2 'Installing bash completion...'
  install -Dm 644 contrib/bitcoind.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/bitcoind"

  msg2 'Installing bitcoin-cli...'
  install -Dm755 "$srcdir/bitcoinclassic-$pkgver/src/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"

  msg2 'Installing bitcoin-tx...'
  install -Dm755 "$srcdir/bitcoinclassic-$pkgver/src/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"
}
