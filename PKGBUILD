# Maintainer: Dimitri Kaparis <dimitri at kaparis dot name>
# Contributor: redfish <redfish at galactica.pw>

pkgname=bitcoin-unlimited
_pkgbase=BitcoinUnlimited
pkgver=1.4.0.0
pkgrel=1
pkgdesc='Bitcoin Unlimited Cash (BCH) versions of Bitcoind, bitcoin-cli, 
bitcoin-tx, and bitcoin-qt, w/GUI and wallet'
arch=('i686' 'x86_64' 'armv7h')
url="http://www.bitcoinunlimited.info"
license=('MIT')
depends=('boost-libs' 'desktop-file-utils' 'libevent' 'openssl')
optdepends=('miniupnpc' 'db4.8' 'qt5-base' 'protobuf' 'qrencode')
makedepends=('boost' 'qt5-tools')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-unlimited-git' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
source=('https://github.com/BitcoinUnlimited/BitcoinUnlimited/archive/bucash1.4.0.0.tar.gz')
sha256sums=('ff8e7be5d80333041d0e878c35a95c6cc12fcee019e9bff6a9ec9d8bc960a756')


build() {
  cd "$srcdir/$_pkgbase"

  ./autogen.sh
  ./configure --prefix=/usr --with-incompatible-bdb
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
