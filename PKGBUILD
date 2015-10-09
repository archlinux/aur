# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=bitcoinxt-gui-git
pkgver=v0.11B.r5.gd9e470b
pkgrel=1
pkgdesc='Bitcoin XT versions of bitcoind, bitcoin-cli, bitcoin-tx, and bitcoin-qt compiled with GUI and wallet enabled'
arch=('i686' 'x86_64')
url="https://bitcoinxt.software/"
license=('MIT')
depends=('boost-libs' 'openssl' 'miniupnpc' 'protobuf' 'qrencode' 'qt4')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin-qt.install
source=('git+https://github.com/bitcoinxt/bitcoinxt.git'
				'https://github.com/bitcoin/bitcoin/commit/9f3e48e5219a09b5ddfd6883d1f0498910eff4b6.patch'
				'bitcoin-qt.install')
sha256sums=('SKIP'
            '0910004577764c2251a33c4868c7358a42da68f94d6462e44bbcb1945cefd748'
            'ebf7090ca1202e2c2ccd1aa5bb03e6ac911c458141a1cedda9b41f9c26c2602c')
sha512sums=('SKIP'
            'e9bf98634af791949d0d05951f7f256660d85717922e0037e5a9def40fcdb71922ccfff24774ea448a3a53a1c95a6da1f79fa43e280900a020362c51960de9db'
            '67383fa1dd2f9576cc3c282f3a9b8c5f2d3eaa13799a6a7eb9eb2969face0ddaf6bb82c286c928b89397d8d2c9ba2efe9a603442f4bf6ed6d89ae9323c169375')


pkgver() {
	cd ${srcdir}/bitcoinxt
git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/bitcoinxt"
  patch -Np1 -i "$srcdir"/9f3e48e5219a09b5ddfd6883d1f0498910eff4b6.patch
}

build() {
  cd "$srcdir/bitcoinxt"

  msg2 'Building...'

  CXXFLAGS="$CXXFLAGS -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1 -UUPNPDISCOVER_SUCCESS"
	./autogen.sh
	./configure --prefix=/usr --with-incompatible-bdb --with-gui=qt4
  make
}

package() {
	# Install bitcoin-qt
	cd "$srcdir/bitcoinxt"
	install -Dm755 "$srcdir/bitcoinxt/src/qt/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
  install -Dm644 "$srcdir/bitcoinxt/share/pixmaps/bitcoin128.png" "$pkgdir/usr/share/pixmaps/bitcoin128.png"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  cd "$srcdir/bitcoinxt/contrib/debian"
	mv "bitcoin-qt.desktop" "bitcoin.desktop"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "bitcoin.desktop"

	# Install bitcoin daemon
	cd "$srcdir/bitcoinxt"
	install -Dm755 "$srcdir/bitcoinxt/src/bitcoind" "$pkgdir/usr/bin/bitcoind"
  install -Dm644 "$srcdir/bitcoinxt/contrib/debian/examples/bitcoin.conf" "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
  install -Dm644 "$srcdir/bitcoinxt/contrib/debian/manpages/bitcoind.1" "$pkgdir/usr/share/man/man1/bitcoind.1"
  install -Dm644 "$srcdir/bitcoinxt/contrib/debian/manpages/bitcoin.conf.5" "$pkgdir/usr/share/man/man5/bitcoin.conf.5"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

	# Install bitcoin-cli
  install -Dm755 "$srcdir/bitcoinxt/src/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  #install bitcoin-tx
  install -Dm755 "$srcdir/bitcoinxt/src/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"
}
