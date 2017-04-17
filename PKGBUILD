# Maintainer:   Maximilian Weiss <max at maxweiss dot io>
# Contributor:  Block Tracker <bitcointxtracker at gmail dot com>


pkgname=bitcoinec
pkgver=v0.14.0.1.g15436fd
pkgrel=2

# Epoch is always set to the most recent PKGBUILD update time.
# This allows for a forced downgrade without messing up versioning.
epoch=1492432225

_commit=15436fd2bf1af29523c2ea44156c1c24aec7385f
_commitziphash=286e73c516f10f431aaaf77cb920650c83c501e222b81052da58faa38700be73


# Below this line should rarely need to be changed..

pkgdesc='A minimal patchset on top of Bitcoin Core to provide a stable implementation of Emergent Consensus'
arch=('i686' 'x86_64')
url='https://bitcoinec.info'
license=('MIT')
depends=('desktop-file-utils' 'openssl' 'db4.8' 'boost' 'boost-libs' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
provides=('bitcoinec' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoinec' 'bitcoin' 'bitcoind' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
source=("https://github.com/bitcoinec/bitcoinec/archive/$_commit.zip")
sha256sums=("$_commitziphash")

build() {
    cd "$srcdir/bitcoinec-$_commit/"
    ./autogen.sh
    ./configure --prefix=/usr --enable-upnp-default --enable-hardening --with-gui=qt5
    make
    cat contrib/debian/bitcoin-qt.desktop | sed 's/Name\=Bitcoin\ Core/Name\=Bitcoin\ Core\ \(EC\)/g' > contrib/debian/bitcoin-qt-2.desktop
}

package() {
    cd "$srcdir/bitcoinec-$_commit/"
    install -Dm755 "src/qt/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
    install -Dm644 "contrib/debian/bitcoin-qt-2.desktop" "$pkgdir/usr/share/applications/bitcoin.desktop"
    install -Dm644 "share/pixmaps/bitcoin128.png" "$pkgdir/usr/share/pixmaps/bitcoin128.png"
    install -Dm644 "doc/man/bitcoin-qt.1" "$pkgdir/usr/share/man/man1/bitcoin-qt.1"
    install -Dm755 "src/bitcoind" "$pkgdir/usr/bin/bitcoind"
    install -Dm644 "contrib/debian/examples/bitcoin.conf" "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
    install -Dm644 "doc/man/bitcoind.1" "$pkgdir/usr/share/man/man1/bitcoind.1"
    install -Dm755 "src/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"
    install -Dm644 "doc/man/bitcoin-cli.1" "$pkgdir/usr/share/man/man1/bitcoin-cli.1"
    install -Dm755 "src/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
