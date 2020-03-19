# Maintainer: einalex <einalex@aegir.space>

pkgname=syscoin-git
_gitname=syscoin
pkgver=4.1.3
pkgrel=1
pkgdesc="A peer-to-peer network based market place on the blockchain. This package provides syscoin binaries: syscoind, syscoin-qt, syscoin-tx, and syscoin-cli"
arch=('x86_64')
url="https://syscoin.org"
license=('MIT')
conflicts=('syscoin')
provides=('syscoin4')
depends=('boost-libs' 'db4.8' 'dbus' 'harfbuzz' 'libevent' 'libxext' 'protobuf' 'qrencode' 'qt5-base' 'openssl-1.0')
optdepends=('miniupnpc: Firewall-jumping support'
 'zeromq: Allows generating ZMQ notifications')
makedepends=('pkg-config' 'git' 'boost' 'gcc' 'make' 'automoc4' 'automake' 'autoconf' 'libtool')
source=("git+https://github.com/syscoin/syscoin.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  wget -N -q https://raw.githubusercontent.com/syscoin-core/packaging/master/debian/syscoin-qt.desktop
  wget -N -q https://github.com/syscoin/syscoin/raw/master/share/pixmaps/syscoin256.png
}

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags $(git rev-list --tags --max-count=1) | sed "s/^v//"
}


build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig \
  CFLAGS+=" -I/usr/include/openssl-1.0" \
  LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl" \
  ./configure --with-gui=qt5
  make -j$(nproc)
}

package() {
	# install syscoin-qt client
	msg2 'Installing syscoin'
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir/" install
	#install -Dm755 "$srcdir/$_gitname/src/qt/syscoin-qt" "$pkgdir/usr/bin/syscoin-qt"
	install -Dm644 "$srcdir/$_gitname/share/pixmaps/syscoin256.png" "$pkgdir/usr/share/pixmaps/syscoin256.png"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/syscoin-qt.desktop"

	# install syscoin-daemon
	#msg2 'Installing syscoin-daemon...'
	#install -Dm755 "$srcdir/$_gitname/src/syscoind" "$pkgdir/usr/bin/syscoind"
	#install -Dm755 "$srcdir/$_gitname/src/bin/linux/sysrelayer.nod" "$pkgdir/usr/bin/sysrelayer.nod"
	#install -Dm755 "$srcdir/$_gitname/src/bin/linux/sysgeth.nod" "$pkgdir/usr/bin/sysgeth.nod"
	#install -Dm644 "$srcdir/$_gitname/share/examples/syscoin.conf" "$pkgdir/usr/share/doc/$pkgname/examples/syscoin.conf"
	#install -Dm644 "$srcdir/$_gitname/doc/man/syscoin-cli.1" "$pkgdir/usr/share/man/man1/syscoin-cli.1"
	#install -Dm644 "$srcdir/$_gitname/doc/man/syscoin-qt.1" "$pkgdir/usr/share/man/man1/syscoin-qt.1"
	#install -Dm644 "$srcdir/$_gitname/doc/man/syscoind.1" "$pkgdir/usr/share/man/man1/syscoind.1"
	#install -Dm644 "$srcdir/$_gitname/doc/man/syscoin-tx.1" "$pkgdir/usr/share/man/man1/syscoin-tx.1"
	#install -Dm644 "$srcdir/$_gitname/doc/man/syscoin-wallet.1" "$pkgdir/usr/share/man/man1/syscoin-wallet.1"

	# install syscoin-cli
	#msg2 'Installing syscoin-cli...'
	#install -Dm755 "$srcdir/$_gitname/src/syscoin-cli" "$pkgdir/usr/bin/syscoin-cli"

	# install syscoin-tx
	#msg2 'Installing syscoin-tx...'
	#install -Dm755 "$srcdir/$_gitname/src/syscoin-tx" "$pkgdir/usr/bin/syscoin-tx"

	# install syscoin-wallet
	#msg2 'Installing syscoin-wallet...'
	#install -Dm755 "$srcdir/$_gitname/src/syscoin-wallet" "$pkgdir/usr/bin/syscoin-wallet"

	# install license
	#install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
