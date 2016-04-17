# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=bitcoin-classic-git
pkgver=v0.12.0cl1.r14.gc596b82
pkgrel=2
pkgdesc='Bitcoin Classic versions of Bitcoind, bitcoin-cli, bitcoin-tx, and bitcoin-qt, most recent stable branch, w/GUI and wallet'
arch=('i686' 'x86_64')
url="https://bitcoinclassic.com/"
license=('MIT')
depends=('boost-libs' 'desktop-file-utils' 'libevent' 'qt5-base' 'protobuf' 'qrencode' 'openssl')
makedepends=('boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'protobuf')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin-qt.install
source=('git+https://github.com/bitcoinclassic/bitcoinclassic.git#branch=0.12')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/bitcoinclassic"
git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/bitcoinclassic"

	msg2 'Building...'
  CXXFLAGS="$CXXFLAGS -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1"
	./autogen.sh
	./configure --prefix=/usr --with-incompatible-bdb --with-gui=qt5
  make -j$(nproc)
}

package() {
	cd "$srcdir/bitcoinclassic"

	msg2 'Installing bitcoin-qt...'
	install -Dm755 "$srcdir/bitcoinclassic/src/qt/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
  install -Dm644 "$srcdir/bitcoinclassic/share/pixmaps/bitcoin128.png"\
								 "$pkgdir/usr/share/pixmaps/bitcoin128.png"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	cp "$srcdir/bitcoinclassic/contrib/debian/bitcoin-qt.desktop" "$srcdir/bitcoinclassic/bitcoin.desktop"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "bitcoin.desktop"

	msg2 'Installing bitcoin-daemon...'
	install -Dm755 "$srcdir/bitcoinclassic/src/bitcoind" "$pkgdir/usr/bin/bitcoind"
  install -Dm644 "$srcdir/bitcoinclassic/contrib/debian/examples/bitcoin.conf"\
								 "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
  install -Dm644 "$srcdir/bitcoinclassic/contrib/debian/manpages/bitcoind.1"\
								 "$pkgdir/usr/share/man/man1/bitcoind.1"
  install -Dm644 "$srcdir/bitcoinclassic/contrib/debian/manpages/bitcoin.conf.5"\
								 "$pkgdir/usr/share/man/man5/bitcoin.conf.5"

  msg2 'Installing bitcoin-cli...'
	install -Dm755 "$srcdir/bitcoinclassic/src/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"

  msg2 'Installing bitcoin-tx...'
	install -Dm755 "$srcdir/bitcoinclassic/src/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"
}
