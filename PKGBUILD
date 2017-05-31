# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Matt Whitlock
# Contributor:  The Bitcoin Core Developers

pkgname=bitcoin-infinity
pkgver=v0.14.0.0.g7b3d9c92
pkgrel=4

# Epoch is always set to the most recent PKGBUILD update time.
# This allows for a forced downgrade without messing up versioning.
epoch=1496213925

_commit=7b3d9c9290abbcc2dfaefeb4760ef7b4e9eff490
_commitziphash=62d503dc6448fce24b24b34fc8ca2442d3dd6de174e896bb6b119466258057ca

pkgdesc='A patch with the minimal changes necessary to make Bitcoin Core accept blocks of any size'
arch=('i686' 'x86_64')
url='https://github.com/whitslack/bitcoin-infinity'
license=('MIT')
depends=('desktop-file-utils' 'openssl' 'db4.8' 'boost' 'boost-libs' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
provides=('bitcoin-infinity' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-infinity' 'bitcoin' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
source=("$_commit.zip::https://github.com/whitslack/bitcoin-infinity/archive/$_commit.zip")
sha256sums=("$_commitziphash")

build() {
    mkdir -p "$srcdir/tmp"
    cd "$srcdir/bitcoin-infinity-$_commit/"
    ./autogen.sh
    ./configure --prefix=/usr --enable-upnp-default --enable-hardening --with-gui=qt5
    make DESTDIR="$srcdir/tmp"
    make DESTDIR="$srcdir/tmp" install
    cat contrib/debian/bitcoin-qt.desktop | sed 's/Name\=Bitcoin\ Core/Name\=Bitcoin\ Core\ \(Infinity\)/g' > contrib/debian/bitcoin-qt-2.desktop
}

package() {
    install -Dm644 "$srcdir/bitcoin-infinity-$_commit/contrib/debian/bitcoin-qt-2.desktop" "$pkgdir/usr/share/applications/bitcoin.desktop"
    install -Dm755 "$srcdir/tmp/usr/bin/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
    install -Dm644 "$srcdir/bitcoin-infinity-$_commit/share/pixmaps/bitcoin128.png" "$pkgdir/usr/share/pixmaps/bitcoin128.png"
    install -Dm644 "$srcdir/bitcoin-infinity-$_commit/doc/man/bitcoin-qt.1" "$pkgdir/usr/share/man/man1/bitcoin-qt.1"
    install -Dm755 "$srcdir/tmp/usr/bin/bitcoind" "$pkgdir/usr/bin/bitcoind"
    install -Dm644 "$srcdir/bitcoin-infinity-$_commit/contrib/debian/examples/bitcoin.conf" "$pkgdir/usr/share/doc/bitcoin/examples/bitcoin.conf"
    install -Dm644 "$srcdir/bitcoin-infinity-$_commit/doc/man/bitcoind.1" "$pkgdir/usr/share/man/man1/bitcoind.1"
    install -Dm755 "$srcdir/tmp/usr/bin/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"
    install -Dm644 "$srcdir/bitcoin-infinity-$_commit/doc/man/bitcoin-cli.1" "$pkgdir/usr/share/man/man1/bitcoin-cli.1"
    install -Dm755 "$srcdir/tmp/usr/bin/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"
    install -Dm644 "$srcdir/bitcoin-infinity-$_commit/doc/man/bitcoin-tx.1" "$pkgdir/usr/share/man/man1/bitcoin-tx.1"
    install -Dm644 "$srcdir/bitcoin-infinity-$_commit/COPYING" "$pkgdir/usr/share/licenses/bitcoin/COPYING"
    install -Dm644 "$srcdir/tmp/usr/include/bitcoinconsensus.h" "$pkgdir/usr/include/bitcoinconsensus.h"
    install -Dm644 "$srcdir/tmp/usr/lib/libbitcoinconsensus.so.0.0.0" "$pkgdir/usr/lib/libbitcoinconsensus.so.0.0.0"
    cd "$pkgdir/usr/lib/"
    ln -s "libbitcoinconsensus.so.0.0.0" "libbitcoinconsensus.so.0"
    ln -s "libbitcoinconsensus.so.0.0.0" "libbitcoinconsensus.so"
}
