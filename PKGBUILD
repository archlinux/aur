# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bitcoin-gold-git
_gitname=BTCGPU
pkgver=0.15.0.2
pkgrel=1
pkgdesc="A peer-to-peer network based digital currency. This package provides bitcoin-gold-core binaries: bgoldd, bgold-qt, bgold-tx, and bgold-cli"
arch=('any')
url="https://bitcoingold.org/"
license=('MIT')
depends=('gcc-libs' 'miniupnpc' 'openssl' 'db4.8' 'protobuf')
makedepends=('qt5-base' 'qt5-tools' 'pkg-config' 'git' 'boost-libs' 'boost' 'gcc' 'qrencode' 'make' 'automoc4' 'automake' 'autoconf' 'libtool' 'libsodium')
provides=('bgold' 'bgold-qt' 'bgoldd' 'bgold-tx' 'bgold-cli')

# Use the 0.15 branch because master is the staging branch according to h4x3rotab on Slack channel.
source=('git://github.com/BTCGPU/BTCGPU.git#branch=0.15')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags $(git rev-list --tags --max-count=1) | sed "s/-/./g;s/^v//g"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --with-gui=qt5
   make -j$(nproc)
}

package() {
	# install bgold-qt client
	msg2 'Installing bgold-qt...'
	install -Dm755 "$srcdir/$_gitname/src/qt/bitcoin-qt" "$pkgdir/usr/bin/bgold-qt"
	#install -Dm644 "$srcdir/$_gitname/share/pixmaps/bitcoin128.xpm" "$pkgdir/usr/share/pixmaps/bitcoin128.xpm"
	#desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/$_gitname/contrib/debian/bitcoin-qt.desktop"
	
	# install bgold-daemon
	msg2 'Installing bgold-daemon...'
	install -Dm755 "$srcdir/$_gitname/src/bgoldd" "$pkgdir/usr/bin/bgoldd"
	install -Dm644 "$srcdir/$_gitname/contrib/debian/examples/bitcoingold.conf" "$pkgdir/usr/share/doc/$pkgname/examples/bitcoingold.conf"
	#install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/bitcoin-cli.1" "$pkgdir/usr/share/man/man1/bgold-cli.1"
	#install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/bitcoin-qt.1" "$pkgdir/usr/share/man/man1/bgold-qt.1"
	#install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/bitcoind.1" "$pkgdir/usr/share/man/man1/bgoldd.1"
	#install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/bitcoin.conf.5" "$pkgdir/usr/share/man/man5/bgold.conf.5"

	# install bgold-cli
	msg2 'Installing bgold-cli...'
	install -Dm755 "$srcdir/$_gitname/src/bgold-cli" "$pkgdir/usr/bin/bgold-cli"

	# install bgold-tx
	msg2 'Installing bgold-tx...'
	install -Dm755 "$srcdir/$_gitname/src/bitcoin-tx" "$pkgdir/usr/bin/bgold-tx"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
