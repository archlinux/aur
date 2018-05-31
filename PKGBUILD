# Maintainer: Raansu <Gero3977@gmail.com>

pkgname=bitcoin-git
_gitname=bitcoin
pkgver='v0.16.0.r16350'
pkgrel=2
pkgdesc="Bitcoin is a peer-to-peer network based digital currency. This package provides bitcoin-core binaries: bitcoind, bitcoin-qt, bitcoin-tx, and bitcoin-cli"
arch=('any')
url="https://bitcoin.org"
license=('MIT')
depends=( 'miniupnpc' 'openssl' 'protobuf')
makedepends=('qt5-base' 'qt5-tools' 'pkg-config' 'db4.8' 'git' 'boost-libs' 'boost' 'gcc' 'gcc-libs' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool' 'zeromq')
provides=('bitcoin' 'bitcoin-qt' 'bitcoind' 'bitcoin-bin' 'bitcoin-daemon' 'bitcoin-tx' 'bitcoin-cli' 'bitcoin-core')
conflicts=('bitcoin' 'bitcoin-qt' 'bitcoind' 'bitcoin-bin' 'bitcoin-daemon' 'bitcoin-core' 'bitcoin-core-git' 'bitcoin-cli' 'bitcoin-tx')
source=('git://github.com/bitcoin/bitcoin.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "%s.r%s" "$(git describe --tags $(git rev-list --tags --max-count=1) | sed "s/-/./g")" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --with-gui=qt5
   make -j$(nproc)
}

package() {
	# install bitcoin-qt client
	msg2 'Installing bitcoin-qt...'
	install -Dm755 "$srcdir/$_gitname/src/qt/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
	install -Dm644 "$srcdir/$_gitname/share/pixmaps/bitcoin128.xpm" "$pkgdir/usr/share/pixmaps/bitcoin128.xpm"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/$_gitname/contrib/debian/bitcoin-qt.desktop"
	
	# install bitcoin-daemon
        msg2 'Installing bitcoin-daemon...'
        install -Dm755 "$srcdir/$_gitname/src/bitcoind" "$pkgdir/usr/bin/bitcoind"
        install -Dm644 "$srcdir/$_gitname/contrib/debian/examples/bitcoin.conf" "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
        install -Dm644 "$srcdir/$_gitname/doc/man/bitcoin-cli.1" "$pkgdir/usr/share/man/man1/bitcoin-cli.1"
        install -Dm644 "$srcdir/$_gitname/doc/man/bitcoin-qt.1" "$pkgdir/usr/share/man/man1/bitcoin-qt.1"
        install -Dm644 "$srcdir/$_gitname/doc/man/bitcoind.1" "$pkgdir/usr/share/man/man1/bitcoind.1"
        install -Dm644 "$srcdir/$_gitname/doc/man/bitcoin-tx.1" "$pkgdir/usr/share/man/man1/bitcoin-tx.1"

	# install bitcoin-cli
	msg2 'Installing bitcoin-cli...'
	install -Dm755 "$srcdir/$_gitname/src/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"

	# install bitcoin-tx
	msg2 'Installing bitcoin-tx...'
	install -Dm755 "$srcdir/$_gitname/src/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
