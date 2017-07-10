# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=bitcoin-uasf-git
pkgver=v0.14.2.uasfsegwit1.0.r0.g2e7690fc8
pkgrel=1
pkgdesc='EXPERIMENTAL! Signal support for BIP148, a User Activated Soft Fork (UASF) activating segwit'
arch=('i686' 'x86_64')
url="https://github.com/UASF/bitcoin"
license=('MIT')
depends=('boost-libs' 'desktop-file-utils' 'libevent' 'protobuf' 'qrencode' 'qt5-base' 'zeromq')
makedepends=('git' 'boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'protobuf' 'zeromq' 'python')
optdepends=('db4.8: Wallet portability/compatibility w/official binaries')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
install=bitcoin-qt.install
source=("git+${url}.git#branch=0.14-BIP148"
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
	./configure --prefix=/usr --with-incompatible-bdb --with-gui=qt5 --without-miniupnpc
  make -j$(nproc) check
}

package() {
	cd "$srcdir/bitcoin"
  make install DESTDIR="$pkgdir"
  install -Dm644 "$srcdir/bitcoin/share/pixmaps/bitcoin128.png"\
								 "$pkgdir/usr/share/pixmaps/bitcoin128.png"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	cp "$srcdir/bitcoin/contrib/debian/bitcoin-qt.desktop" "$srcdir/bitcoin/bitcoin.desktop"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "bitcoin.desktop"
  install -Dm644 "$srcdir/bitcoin/contrib/debian/examples/bitcoin.conf"\
								 "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
}
