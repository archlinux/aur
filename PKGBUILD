# Maintainer: Tom Zander

pkgname=bitcoin-classic-daemon-git
pkgver=git
pkgrel=1
pkgdesc="Bitcoin Classic versions of bitcoind, bitcoin-cli, and bitcoin-tx"
arch=('i686' 'x86_64')
url="https://bitcoinclassic.com/"
license=('MIT')
depends=('boost-libs' 'libevent' 'openssl' 'miniupnpc' 'zeromq')
makedepends=('boost')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-tx')
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-tx')
backup=("etc/bitcoin/bitcoin.conf")
install=bitcoin.install
source=("git+https://github.com/bitcoinclassic/bitcoinclassic.git#branch=master"
    "bitcoin.logrotate"
    "bitcoin.conf")
sha256sums=('SKIP'
    "7bf4bdad419c1ee30b88c7e4190707c5ff250da8b23d68d5adf14043f8e2ac73"
    "c8787560c6423605796c8d3e080cb522ed849cea12b5c23293c22e405a015a53")

pkgver() {
  cd "$srcdir/bitcoinclassic"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/bitcoinclassic"

  ./autogen.sh
  ./configure --prefix=/usr --with-incompatible-bdb --with-gui=no --enable-hardening \
        --enable-reduce-exports --disable-gui-tests --disable-maintainer-mode
  make
}

check() {
  "bitcoinclassic/src/test/test_bitcoin"
}

package() {
  cd "bitcoinclassic"

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
