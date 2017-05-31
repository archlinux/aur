# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Block Tracker <$(echo "Yml0Y29pbnR4dHJhY2tlckBnbWFpbC5jb20=" | base64 -d)>
# Contributor:  The Bitcoin Core Developers

pkgname=bitcoinec
pkgver=v0.14.0.0.g15436fd2
pkgrel=4

# Epoch is always set to the most recent PKGBUILD update time.
# This allows for a forced downgrade without messing up versioning.
epoch=1496213927

_commit=15436fd2bf1af29523c2ea44156c1c24aec7385f
_commitziphash=fa9b93273638d3d337318197faef33961042c819f9d2bd97ce4e1b871a81f761

pkgdesc='A minimal patchset on top of Bitcoin Core to provide a stable implementation of Emergent Consensus'
arch=('i686' 'x86_64')
url='https://bitcoinec.info'
license=('MIT')
depends=('desktop-file-utils' 'openssl' 'db4.8' 'boost' 'boost-libs' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
provides=('bitcoinec' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoinec' 'bitcoin' 'bitcoind' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
source=("$_commit.zip::https://github.com/bitcoinec/bitcoinec/archive/$_commit.zip")
sha256sums=("$_commitziphash")

build() {
    mkdir -p "$srcdir/tmp"
    cd "$srcdir/bitcoinec-$_commit/"
    ./autogen.sh
    ./configure --prefix=/usr --enable-upnp-default --enable-hardening --with-gui=qt5
    make DESTDIR="$srcdir/tmp"
    make DESTDIR="$srcdir/tmp" install
    cat contrib/debian/bitcoin-qt.desktop | sed 's/Name\=Bitcoin\ Core/Name\=Bitcoin\ Core\ \(EC\)/g' > contrib/debian/bitcoin-qt-2.desktop
}

package() {
    install -Dm644 "$srcdir/bitcoinec-$_commit/contrib/debian/bitcoin-qt-2.desktop" "$pkgdir/usr/share/applications/bitcoin.desktop"
    install -Dm755 "$srcdir/tmp/usr/bin/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
    install -Dm644 "$srcdir/bitcoinec-$_commit/share/pixmaps/bitcoin128.png" "$pkgdir/usr/share/pixmaps/bitcoin128.png"
    install -Dm644 "$srcdir/bitcoinec-$_commit/doc/man/bitcoin-qt.1" "$pkgdir/usr/share/man/man1/bitcoin-qt.1"
    install -Dm755 "$srcdir/tmp/usr/bin/bitcoind" "$pkgdir/usr/bin/bitcoind"
    install -Dm644 "$srcdir/bitcoinec-$_commit/contrib/debian/examples/bitcoin.conf" "$pkgdir/usr/share/doc/bitcoin/examples/bitcoin.conf"
    install -Dm644 "$srcdir/bitcoinec-$_commit/doc/man/bitcoind.1" "$pkgdir/usr/share/man/man1/bitcoind.1"
    install -Dm755 "$srcdir/tmp/usr/bin/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"
    install -Dm644 "$srcdir/bitcoinec-$_commit/doc/man/bitcoin-cli.1" "$pkgdir/usr/share/man/man1/bitcoin-cli.1"
    install -Dm755 "$srcdir/tmp/usr/bin/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"
    install -Dm644 "$srcdir/bitcoinec-$_commit/doc/man/bitcoin-tx.1" "$pkgdir/usr/share/man/man1/bitcoin-tx.1"
    install -Dm644 "$srcdir/bitcoinec-$_commit/COPYING" "$pkgdir/usr/share/licenses/bitcoin/COPYING"
    install -Dm644 "$srcdir/tmp/usr/include/bitcoinconsensus.h" "$pkgdir/usr/include/bitcoinconsensus.h"
    install -Dm644 "$srcdir/tmp/usr/lib/libbitcoinconsensus.so.0.0.0" "$pkgdir/usr/lib/libbitcoinconsensus.so.0.0.0"
    cd "$pkgdir/usr/lib/"
    ln -s "libbitcoinconsensus.so.0.0.0" "libbitcoinconsensus.so.0"
    ln -s "libbitcoinconsensus.so.0.0.0" "libbitcoinconsensus.so"
}
