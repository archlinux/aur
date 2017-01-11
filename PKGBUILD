# Maintainer: Tom Zander

pkgname=bitcoin-classic-daemon
pkgver=1.2.0
pkgrel=1
pkgdesc='Bitcoin Classic with bitcoind, bitcoin-tx, and bitcoin-cli'
arch=('i686' 'x86_64')
url="https://bitcoinclassic.com/"
license=('MIT')
depends=('boost-libs' 'libevent' 'openssl' 'miniupnpc' 'zeromq')
makedepends=('boost')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-tx')
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-tx')
install=bitcoin.install
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/bitcoinclassic/bitcoinclassic/archive/v1.2.0.tar.gz"
    "bitcoin.logrotate"
    "bitcoin.conf")
sha256sums=('7f16cd27f711d7dfbdc103e79d04800a27e63ed432e3076dd34552c37710a5ac'
    "7bf4bdad419c1ee30b88c7e4190707c5ff250da8b23d68d5adf14043f8e2ac73"
    "c8787560c6423605796c8d3e080cb522ed849cea12b5c23293c22e405a015a53")

build() {
  cd "bitcoinclassic-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --with-incompatible-bdb --with-gui=no --enable-hardening \
        --enable-reduce-exports --disable-gui-tests --disable-maintainer-mode
  make
}

check() {
  "bitcoinclassic-$pkgver/src/test/test_bitcoin"
}

package() {
  cd "bitcoinclassic-$pkgver"

  install -Dm644 "contrib/debian/examples/bitcoin.conf"\
        -t "$pkgdir/usr/share/doc/bitcoin/examples"
  install -Dm644 "contrib/debian/manpages/bitcoind.1"\
        -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "contrib/debian/manpages/bitcoin.conf.5"\
        -t "$pkgdir/usr/share/man/man5"

  install -Dm 644 "$srcdir/bitcoin.conf" "$pkgdir/etc/bitcoin/bitcoin.conf.dist"
  install -Dm 644 "share/rpcuser/rpcuser.py" -t "$pkgdir/etc/bitcoin"
  install -Dm 644 "contrib/init/bitcoind.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/bitcoin.logrotate" "$pkgdir/etc/logrotate.d/bitcoin"

  install -Dm 644 contrib/bitcoind.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/bitcoind"

  install -Dm755 "src/bitcoind" "src/bitcoin-cli" "src/bitcoin-tx" -t "$pkgdir/usr/bin"
}
