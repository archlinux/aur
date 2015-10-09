# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=bitcoin-gui-git
pkgver=v0.11.0.r12.g5c27f12
pkgrel=2
pkgdesc='Bitcoind, bitcoin-cli, bitcoin-tx, and bitcoin-qt, most recent stable branch, w/GUI and wallet'
arch=('i686' 'x86_64')
url="https://bitcoinxt.software/"
license=('MIT')
depends=('boost-libs' 'openssl' 'miniupnpc' 'protobuf' 'qrencode' 'qt4')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin-qt.install
source=('git+https://github.com/bitcoin/bitcoin.git#branch=0.11'
				'https://github.com/bitcoin/bitcoin/commit/9f3e48e5219a09b5ddfd6883d1f0498910eff4b6.patch'
				'bitcoin-qt.install')
sha256sums=('SKIP'
            '0910004577764c2251a33c4868c7358a42da68f94d6462e44bbcb1945cefd748'
            'ebf7090ca1202e2c2ccd1aa5bb03e6ac911c458141a1cedda9b41f9c26c2602c')

pkgver() {
	cd "$srcdir/bitcoin"
git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/bitcoin"
  patch -Np1 -i "$srcdir"/9f3e48e5219a09b5ddfd6883d1f0498910eff4b6.patch
}

build() {
  cd "$srcdir/bitcoin"

	msg2 'Building...'
  CXXFLAGS="$CXXFLAGS -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1 -UUPNPDISCOVER_SUCCESS"
	./autogen.sh
	./configure --prefix=/usr --with-incompatible-bdb --with-gui=qt4
  make
}

package() {
	cd "$srcdir/bitcoin"

	msg2 'Installing bitcoin-qt...'
	install -Dm755 "$srcdir/bitcoin/src/qt/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
  install -Dm644 "$srcdir/bitcoin/share/pixmaps/bitcoin128.png"\
								 "$pkgdir/usr/share/pixmaps/bitcoin128.png"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	cp "$srcdir/bitcoin/contrib/debian/bitcoin-qt.desktop" "$srcdir/bitcoin/bitcoin.desktop"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "bitcoin.desktop"

	msg2 'Installing bitcoin-daemon...'
	install -Dm755 "$srcdir/bitcoin/src/bitcoind" "$pkgdir/usr/bin/bitcoind"
  install -Dm644 "$srcdir/bitcoin/contrib/debian/examples/bitcoin.conf"\
								 "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
  install -Dm644 "$srcdir/bitcoin/contrib/debian/manpages/bitcoind.1"\
								 "$pkgdir/usr/share/man/man1/bitcoind.1"
  install -Dm644 "$srcdir/bitcoin/contrib/debian/manpages/bitcoin.conf.5"\
								 "$pkgdir/usr/share/man/man5/bitcoin.conf.5"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  msg2 'Installing bitcoin-cli...'
	install -Dm755 "$srcdir/bitcoin/src/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  msg2 'Installing bitcoin-tx...'
	install -Dm755 "$srcdir/bitcoin/src/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"
}
