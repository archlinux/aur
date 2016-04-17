# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=bitcoinxt-gui-git
pkgver=v0.11E.r15.g962434b
pkgrel=1
pkgdesc='Bitcoin XT versions of bitcoind, bitcoin-cli, bitcoin-tx, and bitcoin-qt compiled w/GUI and wallet'
arch=('i686' 'x86_64')
url="https://bitcoinxt.software/"
license=('MIT')
depends=('boost-libs' 'openssl' 'protobuf' 'qrencode' 'qt4')
makedepends=('boost' 'automoc4' 'qrencode' 'protobuf')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin-qt.install
source=('git+https://github.com/bitcoinxt/bitcoinxt.git')
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/bitcoinxt
git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/bitcoinxt"

  msg2 'Building...'
  CXXFLAGS="$CXXFLAGS -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1"
	./autogen.sh
	./configure --prefix=/usr --with-incompatible-bdb --with-gui=qt4
  make -j$(nproc)
}

package() {
	cd "$srcdir/bitcoinxt"
  msg2 'Installing bitcoin-qt...'
	install -Dm755 "$srcdir/bitcoinxt/src/qt/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
  install -Dm644 "$srcdir/bitcoinxt/share/pixmaps/bitcoin128.png" "$pkgdir/usr/share/pixmaps/bitcoin128.png"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  cp "$srcdir/bitcoinxt/contrib/debian/bitcoin-qt.desktop" "$srcdir/bitcoinxt/bitcoin.desktop"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "bitcoin.desktop"

  msg2 'Installing bitcoin-daemon...'
  install -Dm755 "$srcdir/bitcoinxt/src/bitcoind" "$pkgdir/usr/bin/bitcoind"
  install -Dm644 "$srcdir/bitcoinxt/contrib/debian/examples/bitcoin.conf" "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
  install -Dm644 "$srcdir/bitcoinxt/contrib/debian/manpages/bitcoind.1" "$pkgdir/usr/share/man/man1/bitcoind.1"
  install -Dm644 "$srcdir/bitcoinxt/contrib/debian/manpages/bitcoin.conf.5" "$pkgdir/usr/share/man/man5/bitcoin.conf.5"

  msg2 'Installing bitcoin-cli...'
  install -Dm755 "$srcdir/bitcoinxt/src/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"

  msg2 'Installing bitcoin-tx...'
  install -Dm755 "$srcdir/bitcoinxt/src/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"
}
