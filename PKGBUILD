# Maintainer:   Maximilian Weiss <max at maxweiss dot io>
# Contributor:  Matt Whitlock <matt at mattwhitlock dot com>


pkgname=bitcoin-infinity
pkgver=v0.14.0.0.g7b3d9c92
pkgrel=1

# Epoch is always set to the most recent PKGBUILD update time.
# This allows for a forced downgrade without messing up versioning.
epoch=1493790571

_commit=7b3d9c9290abbcc2dfaefeb4760ef7b4e9eff490
_commitziphash=b9c4c147ad6967181d66acfb3d90f072e96f5d8792fe824ca5436a91fded4036


# Below this line should rarely need to be changed..

pkgdesc='A patch with the minimal changes necessary to make Bitcoin Core accept blocks of any size'
arch=('i686' 'x86_64')
url='https://github.com/whitslack/bitcoin-infinity'
license=('MIT')
depends=('desktop-file-utils' 'openssl' 'db4.8' 'boost' 'boost-libs' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
provides=('bitcoin-infinity' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-infinity' 'bitcoin' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
source=("https://github.com/whitslack/bitcoin-infinity/archive/$_commit.zip")
sha256sums=("$_commitziphash")

build() {
    cd "$srcdir/bitcoin-infinity-$_commit/"
    ./autogen.sh
    ./configure --prefix=/usr --enable-upnp-default --enable-hardening --with-gui=qt5
    make
    cat contrib/debian/bitcoin-qt.desktop | sed 's/Name\=Bitcoin\ Core/Name\=Bitcoin\ Core\ \(Infinity\)/g' > contrib/debian/bitcoin-qt-2.desktop
}

package() {
    cd "$srcdir/bitcoin-infinity-$_commit/"
    install -Dm755 "src/qt/bitcoin-qt" "$pkgdir/usr/bin/bitcoin-qt"
    install -Dm644 "contrib/debian/bitcoin-qt-2.desktop" "$pkgdir/usr/share/applications/bitcoin.desktop"
    install -Dm644 "share/pixmaps/bitcoin128.png" "$pkgdir/usr/share/pixmaps/bitcoin128.png"
    install -Dm644 "doc/man/bitcoin-qt.1" "$pkgdir/usr/share/man/man1/bitcoin-qt.1"
    install -Dm755 "src/bitcoind" "$pkgdir/usr/bin/bitcoind"
    install -Dm644 "contrib/debian/examples/bitcoin.conf" "$pkgdir/usr/share/doc/bitcoin/examples/bitcoin.conf"
    install -Dm644 "doc/man/bitcoind.1" "$pkgdir/usr/share/man/man1/bitcoind.1"
    install -Dm755 "src/bitcoin-cli" "$pkgdir/usr/bin/bitcoin-cli"
    install -Dm644 "doc/man/bitcoin-cli.1" "$pkgdir/usr/share/man/man1/bitcoin-cli.1"
    install -Dm755 "src/bitcoin-tx" "$pkgdir/usr/bin/bitcoin-tx"
    install -Dm644 "doc/man/bitcoin-tx.1" "$pkgdir/usr/share/man/man1/bitcoin-tx.1"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/bitcoin/COPYING"
}

