# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Raansu <Gero3977@gmail.com>

pkgname=bitcoin-git
_gitname=bitcoin
pkgver=29.0rc3.r44374
pkgrel=1
pkgdesc="Bitcoin is a peer-to-peer network based digital currency. This package provides bitcoin-core binaries: bitcoind, bitcoin-qt, bitcoin-tx, and bitcoin-cli"
arch=('x86_64')
url="https://bitcoin.org"
license=('MIT')
depends=('qt6-base' 'miniupnpc' 'openssl' 'protobuf' 'boost-libs' 'db4.8' 'qrencode' 'zeromq' 'libevent' 'desktop-file-utils')
makedepends=('qt6-tools' 'pkg-config' 'git' 'boost' 'gcc' 'gcc-libs' 'cmake' 'libtool' 'python3')
provides=('bitcoin' 'bitcoin-qt' 'bitcoind' 'bitcoin-bin' 'bitcoin-daemon' 'bitcoin-tx' 'bitcoin-cli' 'bitcoin-core')
conflicts=('bitcoin' 'bitcoin-qt' 'bitcoind' 'bitcoin-bin' 'bitcoin-daemon' 'bitcoin-core' 'bitcoin-core-git' 'bitcoin-cli' 'bitcoin-tx')
source=('git+https://github.com/bitcoin/bitcoin.git'
        'packaging::git+https://github.com/bitcoin-core/packaging.git')

sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "%s.r%s" "$(git describe --tags $(git rev-list --tags --max-count=1) | sed "s/^v//;s/-/./g")" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
   cmake -B build -DBUILD_GUI=ON -DWITH_ZMQ=ON -DWITH_QRENCODE=ON -DWITH_BDB=ON
   cmake --build build 
}

check() {
   cd "$srcdir/$_gitname"
   ctest --test-dir build
}

package() {
	# install bitcoin-qt client
	msg2 'Installing bitcoin-qt...'
	install -Dm755 "$srcdir/$_gitname/build/bin/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
	install -Dm644 "$srcdir/$_gitname/share/pixmaps/bitcoin128.xpm" "$pkgdir/usr/share/pixmaps/bitcoin128.xpm"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/packaging/debian/bitcoin-qt.desktop"
	
	# install bitcoin-daemon
        msg2 'Installing bitcoin-daemon...'
        install -Dm755 "$srcdir/$_gitname/build/bin/bitcoind" "$pkgdir/usr/bin/bitcoind"
        install -Dm644 "$srcdir/packaging/debian/examples/bitcoin.conf" "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
        install -Dm644 "$srcdir/$_gitname/doc/man/bitcoin-cli.1" "$pkgdir/usr/share/man/man1/bitcoin-cli.1"
        install -Dm644 "$srcdir/$_gitname/doc/man/bitcoin-qt.1" "$pkgdir/usr/share/man/man1/bitcoin-qt.1"
        install -Dm644 "$srcdir/$_gitname/doc/man/bitcoind.1" "$pkgdir/usr/share/man/man1/bitcoind.1"
        install -Dm644 "$srcdir/$_gitname/doc/man/bitcoin-tx.1" "$pkgdir/usr/share/man/man1/bitcoin-tx.1"

	# install bitcoin-cli
	msg2 'Installing bitcoin-cli...'
	install -Dm755 "$srcdir/$_gitname/build/bin/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"

	# install bitcoin-tx
	msg2 'Installing bitcoin-tx...'
	install -Dm755 "$srcdir/$_gitname/build/bin/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"

	# install license
	install -D -m644 "$srcdir/$_gitname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
