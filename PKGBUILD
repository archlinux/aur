# Maintainer: einalex <einalex@mayanna.org>

pkgname=syscoin-git
_gitname=syscoin
pkgver=v4.1.0
pkgrel=1
pkgdesc="A peer-to-peer network based market place on the blockchain. This package provides syscoin binaries: syscoind, syscoin-qt, syscoin-tx, and syscoin-cli"
arch=('x86_64')
url="https://syscoin.org"
license=('MIT')
depends=('boost-libs' 'db4.8' 'dbus' 'harfbuzz' 'libevent' 'libxext' 'protobuf' 'qrencode' 'qt5-base' 'openssl-1.0')
optdepends=('miniupnpc: Firewall-jumping support'
 'zeromq: Allows generating ZMQ notifications')
makedepends=('pkg-config' 'git' 'boost' 'gcc' 'make' 'automoc4' 'automake' 'autoconf' 'libtool')
source=("git+https://github.com/syscoin/syscoin.git#tag=$pkgver")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags $(git rev-list --tags --max-count=1) | sed "s/-/./g"
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
	msg2 'Installing syscoin-qt...'
	install -Dm755 "$srcdir/$_gitname/src/qt/syscoin-qt" "$pkgdir/usr/bin/syscoin-qt"
	install -Dm644 "$srcdir/$_gitname/share/pixmaps/syscoin128.xpm" "$pkgdir/usr/share/pixmaps/syscoin128.xpm"
#	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/$_gitname/contrib/debian/syscoin-qt.desktop"

	# install syscoin-daemon
	msg2 'Installing syscoin-daemon...'
	install -Dm755 "$srcdir/$_gitname/src/syscoind" "$pkgdir/usr/bin/syscoind"
#	install -Dm644 "$srcdir/$_gitname/contrib/debian/examples/syscoin.conf" "$pkgdir/usr/share/doc/$pkgname/examples/syscoin.conf"
#	install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/syscoin-cli.1" "$pkgdir/usr/share/man/man1/syscoin-cli.1"
#	install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/syscoin-qt.1" "$pkgdir/usr/share/man/man1/syscoin-qt.1"
#	install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/syscoind.1" "$pkgdir/usr/share/man/man1/syscoind.1"
#	install -Dm644 "$srcdir/$_gitname/contrib/debian/manpages/syscoin.conf.5" "$pkgdir/usr/share/man/man5/syscoin.conf.5"

	# install syscoin-cli
	msg2 'Installing syscoin-cli...'
	install -Dm755 "$srcdir/$_gitname/src/syscoin-cli" "$pkgdir/usr/bin/syscoin-cli"

	# install syscoin-tx
	#msg2 'Installing syscoin-tx...'
	#install -Dm755 "$srcdir/$_gitname/src/syscoin-tx" "$pkgdir/usr/bin/syscoin-tx"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
