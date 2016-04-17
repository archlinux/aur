# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=bitcoin-gui-git
pkgver=v0.12.1.r0.g9779e1e
pkgrel=1
pkgdesc='Bitcoind, bitcoin-cli, bitcoin-tx, and bitcoin-qt, most recent stable branch, w/GUI and wallet'
arch=('i686' 'x86_64')
url="https://bitcoin.org/en/download"
license=('MIT')
depends=('boost-libs' 'desktop-file-utils' 'libevent' 'qt5-base' 'protobuf' 'qrencode' 'openssl')
makedepends=('boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'protobuf')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin-qt.install
source=('git+https://github.com/bitcoin/bitcoin.git#branch=0.12'
				'bitcoin-qt.install')
sha256sums=('SKIP'
            'ebf7090ca1202e2c2ccd1aa5bb03e6ac911c458141a1cedda9b41f9c26c2602c')
sha512sums=('SKIP'
            '67383fa1dd2f9576cc3c282f3a9b8c5f2d3eaa13799a6a7eb9eb2969face0ddaf6bb82c286c928b89397d8d2c9ba2efe9a603442f4bf6ed6d89ae9323c169375')

pkgver() {
	cd "$srcdir/bitcoin"
git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/bitcoin"

	msg2 'Building...'
  CXXFLAGS="$CXXFLAGS -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1"
	./autogen.sh
	./configure --prefix=/usr --with-incompatible-bdb --with-gui=qt5
  make -j$(nproc)
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

  msg2 'Installing bitcoin-cli...'
	install -Dm755 "$srcdir/bitcoin/src/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"

  msg2 'Installing bitcoin-tx...'
	install -Dm755 "$srcdir/bitcoin/src/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"
}
