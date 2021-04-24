# Maintainer: iohzrd <iohzrd at protonmail dot com>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: shahid <helllamer@gmail.com>
# Contributor: James Harvey

pkgname=bitcoin-taproot-lot-true-uasf
pkgver='0.21.0.taproot0.1'
_pkgver='0.21.0-taproot0.1'
pkgrel=1
pkgdesc="Bitcoin Core 0.21.0-based Taproot Client 0.1 (LOT = true UASF)"
arch=('x86_64')
url="https://bitcointaproot.cc/"
license=('MIT')
depends=('qt5-base' 'miniupnpc' 'openssl' 'protobuf' 'boost-libs' 'qrencode' 'zeromq' 'libevent' 'desktop-file-utils')
makedepends=('boost' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
provides=('bitcoin' 'bitcoin-qt' 'bitcoind' 'bitcoin-bin' 'bitcoin-daemon' 'bitcoin-tx' 'bitcoin-cli' 'bitcoin-core')
conflicts=('bitcoin' 'bitcoin-qt' 'bitcoind' 'bitcoin-bin' 'bitcoin-daemon' 'bitcoin-tx' 'bitcoin-cli' 'bitcoin-core' 'bitcoin-core-git')
source=("bitcoin-$_pkgver.tar.gz::https://github.com/BitcoinActivation/bitcoin/archive/v$_pkgver.tar.gz"
        "bitcoin.sysusers"
        "bitcoin.tmpfiles"
        "bitcoin-qt.desktop"
        "bitcoin-qt.appdata.xml"
        "packaging::git://github.com/bitcoin-core/packaging.git")
sha256sums=('53e1683a962e0b3bfc50c9beb5b02296c43a80105c88b868e77ce530f49791d3'
            '7a77112fb094b9b2e6dd873e24c9a6bacb1f1c453d811a024f271f4b78f2a704'
            'ba83570b4671b18c230f23d8d93cd8faa73179a546655448c14d1644d9b49f35'
            'a020897651c03690eae3411fe401100fd1a2ffaa799247165eb71124609b7959'
            '71b125555451e9bc60b54a6658d886bad63bd18c58b5d6e3bd8977b82a70da7a'
            'SKIP')

prepare() {
  cd "bitcoin-$_pkgver"
  autoreconf -fi
}

build() {
  cd bitcoin-$_pkgver
  ./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb #LDFLAGS="-L$srcdir/db4/lib/ $LDFLAGS" CPPFLAGS="-I$srcdir/db4/include/ $CPPFLAGS"
  make
}

package() {
	# install bitcoin-qt client
	msg2 'Installing bitcoin-qt...'
	install -Dm755 "$srcdir/bitcoin-$_pkgver/src/qt/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
	install -Dm644 "$srcdir/bitcoin-$_pkgver/share/pixmaps/bitcoin128.xpm" "$pkgdir/usr/share/pixmaps/bitcoin128.xpm"
	desktop-file-install -m 644 --dir="$pkgdir/usr/share/applications/" "$srcdir/packaging/debian/bitcoin-qt.desktop"
	
	# install bitcoin-daemon
        msg2 'Installing bitcoin-daemon...'
        install -Dm755 "$srcdir/bitcoin-$_pkgver/src/bitcoind" "$pkgdir/usr/bin/bitcoind"
        install -Dm644 "$srcdir/packaging/debian/examples/bitcoin.conf" "$pkgdir/usr/share/doc/bitcoin/examples/bitcoin.conf"
        install -Dm644 "$srcdir/bitcoin-$_pkgver/doc/man/bitcoin-cli.1" "$pkgdir/usr/share/man/man1/bitcoin-cli.1"
        install -Dm644 "$srcdir/bitcoin-$_pkgver/doc/man/bitcoin-qt.1" "$pkgdir/usr/share/man/man1/bitcoin-qt.1"
        install -Dm644 "$srcdir/bitcoin-$_pkgver/doc/man/bitcoind.1" "$pkgdir/usr/share/man/man1/bitcoind.1"
        install -Dm644 "$srcdir/bitcoin-$_pkgver/doc/man/bitcoin-tx.1" "$pkgdir/usr/share/man/man1/bitcoin-tx.1"

	# install bitcoin-cli
	msg2 'Installing bitcoin-cli...'
	install -Dm755 "$srcdir/bitcoin-$_pkgver/src/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"

	# install bitcoin-tx
	msg2 'Installing bitcoin-tx...'
	install -Dm755 "$srcdir/bitcoin-$_pkgver/src/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"

	# install license
	install -D -m644 "$srcdir/bitcoin-$_pkgver/COPYING" "$pkgdir/usr/share/licenses/bitcoin/COPYING"
}
