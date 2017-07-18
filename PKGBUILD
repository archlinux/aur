# Maintainer: André Vitor de Lima Matos <andre.vmatos at gmail.com>
# Contributor: redfish <redfish at galactica.pw>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=bitcoin-unlimited
_pkgbase=BitcoinUnlimited
pkgver=1.0.3.0
pkgrel=1
pkgdesc='Bitcoin Unlimited versions of Bitcoind, bitcoin-cli, bitcoin-tx, and bitcoin-qt, w/GUI and wallet'
arch=('i686' 'x86_64' 'armv7h')
url="http://www.bitcoinunlimited.info"
license=('MIT')
depends=('boost-libs' 'desktop-file-utils' 'libevent' 'qt5-base' 'protobuf' 'qrencode' 'openssl' 'miniupnpc' 'openssl-1.0')
makedepends=('boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'protobuf')
provides=('bitcoin-unlimited-git' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-unlimited-git' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
source=('git+https://github.com/BitcoinUnlimited/BitcoinUnlimited.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"

  # version based on last tag
  # avoid rebuilding (same version) if last tag hasn't changed
  git describe --long --tags | sed "s/^[^0-9]*\([0-9][^-]\+\).*$/\1/"
}

build() {
  cd "$srcdir/$_pkgbase"
  export CXXFLAGS+=" -I/usr/include/openssl-1.0"
  export LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl -lcrypto"

  export SSL_CFLAGS="-I/usr/include/openssl-1.0"
  export SSL_LIBS="-L/usr/lib/openssl-1.0 -lssl -lcrypto"

  export CRYPTO_CFLAGS="-I/usr/include/openssl-1.0"
  export CRYPTO_LIBS="-L/usr/lib/openssl-1.0 -lssl -lcrypto"

  ./autogen.sh
  ./configure --prefix=/usr --with-incompatible-bdb --with-gui=qt5
  make
}

package() {
  cd "$srcdir/$_pkgbase"

  msg2 'Installing bitcoin-qt...'
  install -Dm755 "src/qt/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
  install -Dm644 "contrib/debian/bitcoin-qt.desktop" \
                 "$pkgdir/usr/share/applications/bitcoin.desktop"
  install -Dm644 "share/pixmaps/bitcoin128.png"\
                 "$pkgdir/usr/share/pixmaps/bitcoin128.png"
  install -Dm644 "contrib/debian/manpages/bitcoin-qt.1" \
                 "$pkgdir/usr/share/man/man1/bitcoin-qt.1"

  msg2 'Installing bitcoin-daemon...'
  install -Dm755 "src/bitcoind" "$pkgdir/usr/bin/bitcoind"
  install -Dm644 "contrib/debian/examples/bitcoin.conf"\
                 "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
  install -Dm644 "contrib/debian/manpages/bitcoind.1"\
                 "$pkgdir/usr/share/man/man1/bitcoind.1"
  install -Dm644 "contrib/debian/manpages/bitcoin.conf.5"\
                 "$pkgdir/usr/share/man/man5/bitcoin.conf.5"

  msg2 'Installing bitcoin-cli...'
  install -Dm755 "src/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"
  install -Dm644 "contrib/debian/manpages/bitcoin-cli.1" \
                 "$pkgdir/usr/share/man/man1/bitcoin-cli.1"

  msg2 'Installing bitcoin-tx...'
  install -Dm755 "src/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
