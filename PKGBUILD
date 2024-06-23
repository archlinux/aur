# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: David Parrish <daveparrish@tutanota.com>

pkgname=bitcoin-gold-git
_gitname=BTCGPU
pkgver=0.17.3
pkgrel=2
pkgdesc="A peer-to-peer network based digital currency. This package provides bitcoin-gold-core binaries: bgoldd, bgold-qt, bgold-tx, and bgold-cli"
arch=('any')
url="https://bitcoingold.org/"
license=('MIT')
depends=('gcc-libs' 'miniupnpc' 'openssl' 'db4.8' 'protobuf' 'libb2')
makedepends=('qt5-base' 'qt5-tools' 'pkg-config' 'git' 'boost-libs' 'boost' 'gcc' 'qrencode' 'make' 'automake' 'autoconf' 'libtool' 'libsodium')
provides=('bgold' 'bgold-qt' 'bgoldd' 'bgold-tx' 'bgold-cli')

# Use the 0.15 branch because master is the staging branch according to h4x3rotab on Slack channel.
source=('git+https://github.com/BTCGPU/BTCGPU.git#branch=0.17'
        'deque.patch'
        'qpainterpath.patch::https://github.com/bitcoin/bitcoin/commit/79b0a69e09c1a912122e6431ea3c530cc292c690.patch')
sha256sums=('SKIP'
            '45e0f557f46ba5769e3aaaf91599b8190e5844bba65a3a83b40e3a8cf411b62d'
            '6ff385b67936c152ae3f618076196b626c770937486be7c08b4ddaf333b5d721')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags $(git rev-list --tags --max-count=1) | sed "s/-/./g;s/^v//g"
}

prepare() {
  cd "$srcdir/$_gitname"
 #deque patch 2020-02-12
 #inlcude deque.h library in httpserver.cpp found in https://github.com/dogecoin/dogecoin/pull/1626
 #will delete when upstream fixes/commits this.
  patch --forward --strip=1 --input="../../deque.patch"

 #QPainterPath 2020-10-12 == Add missing QPainterPath include
 #include QPainterPath library in src/qt/trafficgraphwidget.cpp found in https://github.com/bitcoin/bitcoin/commit/79b0a69e09c1a912122e6431ea3c530cc292c690
 #will delete when dash fixes/commits this. This happens because dash is compiling against older versions of qt5-base
  patch --forward --strip=1 --input="../../qpainterpath.patch"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --with-gui=qt5
   make
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
