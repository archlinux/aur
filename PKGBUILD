# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=bitcoin-unlimited-git
pkgver=20160315.9b1890e
pkgrel=3
pkgdesc='Bitcoin Unlimited versions of Bitcoind, bitcoin-cli, bitcoin-tx, and bitcoin-qt, w/GUI and wallet'
arch=('i686' 'x86_64')
url="http://www.bitcoinunlimited.info/download.html"
license=('MIT')
depends=('boost-libs' 'desktop-file-utils' 'libevent' 'qt5-base' 'protobuf' 'qrencode' 'openssl')
makedepends=('boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'protobuf')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin-qt.install
source=('git+https://github.com/BitcoinUnlimited/BitcoinUnlimited.git#branch=0.12bu'
				'bitcoin-qt.install')
sha256sums=('SKIP'
            'ebf7090ca1202e2c2ccd1aa5bb03e6ac911c458141a1cedda9b41f9c26c2602c')
sha512sums=('SKIP'
            '67383fa1dd2f9576cc3c282f3a9b8c5f2d3eaa13799a6a7eb9eb2969face0ddaf6bb82c286c928b89397d8d2c9ba2efe9a603442f4bf6ed6d89ae9323c169375')

pkgver() {
	cd "$srcdir/BitcoinUnlimited"
  printf "%s.%s" "$(git log -1 --format="%cd" --date=short | sed "s|-||g")" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/BitcoinUnlimited"

	msg2 'Building...'
  CXXFLAGS="$CXXFLAGS -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1"
	./autogen.sh
	./configure --prefix=/usr --with-incompatible-bdb --with-gui=qt5
  make -j$(nproc)
}

package() {
	cd "$srcdir/BitcoinUnlimited"

	msg2 'Installing bitcoin-qt...'
	install -Dm755 "$srcdir/BitcoinUnlimited/src/qt/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
  install -Dm644 "$srcdir/BitcoinUnlimited/share/pixmaps/bitcoin128.png"\
								 "$pkgdir/usr/share/pixmaps/bitcoin128.png"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	cp "$srcdir/BitcoinUnlimited/contrib/debian/bitcoin-qt.desktop" "$srcdir/BitcoinUnlimited/bitcoin.desktop"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "bitcoin.desktop"

	msg2 'Installing bitcoin-daemon...'
	install -Dm755 "$srcdir/BitcoinUnlimited/src/bitcoind" "$pkgdir/usr/bin/bitcoind"
  install -Dm644 "$srcdir/BitcoinUnlimited/contrib/debian/examples/bitcoin.conf"\
								 "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
  install -Dm644 "$srcdir/BitcoinUnlimited/contrib/debian/manpages/bitcoind.1"\
								 "$pkgdir/usr/share/man/man1/bitcoind.1"
  install -Dm644 "$srcdir/BitcoinUnlimited/contrib/debian/manpages/bitcoin.conf.5"\
								 "$pkgdir/usr/share/man/man5/bitcoin.conf.5"

  msg2 'Installing bitcoin-cli...'
	install -Dm755 "$srcdir/BitcoinUnlimited/src/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"

  msg2 'Installing bitcoin-tx...'
	install -Dm755 "$srcdir/BitcoinUnlimited/src/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"
}
