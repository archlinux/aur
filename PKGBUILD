# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Barry Silbert
# Contributor:  Mike Belshe
# Contributor:  Jeff Garzik
# Contributor:  Gavin Andresen
# Contributor:  Attendees and Signatories of the Bitcoin Scaling Agreement at Consensus
# Contributor:  The Bitcoin Core Developers


pkgname=bitcoin-segwit2x-git
pkgver=v1.14.5.2.ga301696f4
pkgrel=2

pkgdesc='The "official" segwit2x software representing the New York scaling agreement, a.k.a. the Silbert agreement'
arch=('i686' 'x86_64')
url='https://github.com/btc1/bitcoin/tree/segwit2x'
license=('MIT')
depends=('desktop-file-utils' 'openssl' 'db4.8' 'boost' 'boost-libs' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
provides=('bitcoin-segwit2x-git' 'bitcoin' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-segwit2x-git' 'bitcoin' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
source=('git://github.com/btc1/bitcoin'
        'bitcoin.desktop')
sha256sums=('SKIP'
            '2ea956c824ec4b5a4d3d433f52516655be077304dcd33c594e0a1a0b0f9e256c')

pkgver() {
    cd "$srcdir/bitcoin/"
    git checkout segwit2x > /dev/null 2>&1
    git reset --hard HEAD > /dev/null 2>&1
    git describe --long | sed 's/-/./g'
}

build() {
    mkdir -p "$srcdir/tmp"
    cd "$srcdir/bitcoin/"
    git checkout segwit2x > /dev/null 2>&1
    git reset --hard HEAD > /dev/null 2>&1
    ./autogen.sh
    ./configure --prefix=/usr --enable-upnp-default --enable-hardening --with-gui=qt5 --disable-tests
    make DESTDIR="$srcdir/tmp"
    make DESTDIR="$srcdir/tmp" install
}

package() {
    install -Dm644 "$srcdir/bitcoin.desktop" "$pkgdir/usr/share/applications/bitcoin.desktop"
    install -Dm755 "$srcdir/tmp/usr/bin/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
    install -Dm644 "$srcdir/bitcoin/share/pixmaps/bitcoin128.png" "$pkgdir/usr/share/pixmaps/bitcoin128.png"
    install -Dm644 "$srcdir/bitcoin/doc/man/bitcoin-qt.1" "$pkgdir/usr/share/man/man1/bitcoin-qt.1"
    install -Dm755 "$srcdir/tmp/usr/bin/bitcoind" "$pkgdir/usr/bin/bitcoind"
    install -Dm644 "$srcdir/bitcoin/contrib/debian/examples/bitcoin.conf" "$pkgdir/usr/share/doc/bitcoin/examples/bitcoin.conf"
    install -Dm644 "$srcdir/bitcoin/doc/man/bitcoind.1" "$pkgdir/usr/share/man/man1/bitcoind.1"
    install -Dm755 "$srcdir/tmp/usr/bin/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"
    install -Dm644 "$srcdir/bitcoin/doc/man/bitcoin-cli.1" "$pkgdir/usr/share/man/man1/bitcoin-cli.1"
    install -Dm755 "$srcdir/tmp/usr/bin/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"
    install -Dm644 "$srcdir/bitcoin/doc/man/bitcoin-tx.1" "$pkgdir/usr/share/man/man1/bitcoin-tx.1"
    install -Dm644 "$srcdir/bitcoin/COPYING" "$pkgdir/usr/share/licenses/bitcoin/COPYING"
    install -Dm644 "$srcdir/tmp/usr/include/bitcoinconsensus.h" "$pkgdir/usr/include/bitcoinconsensus.h"
    install -Dm644 "$srcdir/tmp/usr/lib/libbitcoinconsensus.so.0.0.0" "$pkgdir/usr/lib/libbitcoinconsensus.so.0.0.0"
    cd "$pkgdir/usr/lib/"
    ln -s "libbitcoinconsensus.so.0.0.0" "libbitcoinconsensus.so.0"
    ln -s "libbitcoinconsensus.so.0.0.0" "libbitcoinconsensus.so"
}
