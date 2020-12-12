# Maintainer: Claudio Kozický <claudiokozicky@gmail.com>
# Contributor: peerchemist <peerchemist@protonmail.ch>

pkgname=('peercoin-cli' 'peercoin-daemon' 'peercoin-qt' 'peercoin-tx')
pkgbase='peercoin'
pkgver=0.9.0
pkgrel=3
pkgdesc="A peer-to-peer network-based digital currency"
arch=('x86_64')
url="https://www.peercoin.net/"
license=('MIT')
depends=('boost-libs' 'db' 'libevent' 'miniupnpc' 'openssl' 'protobuf'
         'qrencode' 'qt5-base' 'zeromq')
makedepends=('boost' 'qt5-tools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/peercoin/peercoin/archive/v${pkgver}ppc.tar.gz"
        'boost-placeholders.patch'
        'deque.patch'
        'QPainterPath.patch')
b2sums=('c6b50d5c004216582d487e86470789bf3d146e2c42f8562e759fa65d2c3be72a03fe75f5dd2270da14ceb7538e499ad62cfe363ad66a0fddfc69d4ff4eb64ffc'
        '94304cb1e6af66204b166ba875eee6e1fe590721ad1dd6521728f924695e6be69181bbe7dff09c1b7ae450f6a50d0bd9e3b99d78566250260cfbba4d978d284f'
        '980c8ab54178b254defeecb9f19ecbf9f5e7433d5206995adae1d432e448ac923334be46df644adc428057a8dec57a692636ab007b4b392ff3230bc1aec3de1a'
        '865befa6759a559b5764efc80ee626fe6ca7dc01b13d585a30f168c544d3e0d270cc3c8e3aec5fb8feaf2451ccf91eaaf9e88453538241e3b639e5160a7f737d')

prepare() {
    cd "$pkgbase-${pkgver}ppc"
    patch --strip 1 --input "$srcdir/boost-placeholders.patch"  # fix compilation error
    patch --strip 1 --input "$srcdir/deque.patch"  # fix compilation error
    patch --strip 1 --input "$srcdir/QPainterPath.patch"  # fix compilation error
}

build() {
    cd "$pkgbase-${pkgver}ppc"
    ./autogen.sh
    ./configure --prefix /usr --with-incompatible-bdb
    make
}

check() {
    cd "$pkgbase-${pkgver}ppc"
    make --keep-going check
}

package_peercoin-cli() {
    pkgdesc="A peer-to-peer network-based digital currency - RPC client"
    depends=('boost-libs' 'libevent' 'openssl')

    cd "$pkgbase-${pkgver}ppc"
    install -D --mode 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    install -D --mode 644 \
            contrib/peercoin-cli.bash-completion \
            "$pkgdir/usr/share/bash-completion/completions/peercoin-cli"
    install -D --mode 644 \
            doc/man/peercoin-cli.1 \
            "$pkgdir/usr/share/man/man1/peercoin-cli.1"
    install -D --mode 755 \
            src/peercoin-cli \
            "$pkgdir/usr/bin/peercoin-cli"
}

package_peercoin-daemon() {
    pkgdesc="A peer-to-peer network-based digital currency - daemon"
    depends=('boost-libs' 'db' 'libevent' 'miniupnpc' 'openssl' 'zeromq')
    optdepeneds=('tor')
    backup=('etc/peercoin/peercoin.conf')

    cd "$pkgbase-${pkgver}ppc"
    install -D --mode 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    install -D --mode 644 \
            contrib/debian/examples/peercoin.conf \
            "$pkgdir/etc/peercoin/peercoin.conf"
    install -D --mode 644 \
            contrib/peercoind.bash-completion \
            "$pkgdir/usr/share/bash-completion/completions/peercoind"
    install -D --mode 644 \
            contrib/systemd/peercoind@.service \
            "$pkgdir/usr/lib/systemd/system/peercoind@.service"
    install -D --mode 644 \
            contrib/systemd/peercoind-tor@.service \
            "$pkgdir/usr/lib/systemd/system/peercoind-tor@.service"
    install -D --mode 644 \
            contrib/debian/manpages/peercoin.conf.5 \
            "$pkgdir/usr/share/man/man5/peercoin.conf.5"
    install -D --mode 644 \
            contrib/debian/manpages/peercoind.1 \
            "$pkgdir/usr/share/man/man1/peercoind.1"
    install -D --mode 755 \
            src/peercoind \
            "$pkgdir/usr/bin/peercoind"
}

package_peercoin-qt() {
    pkgdesc="A peer-to-peer network-based digital currency - Qt"
    depends=('boost-libs' 'db' 'libevent' 'miniupnpc' 'protobuf' 'qrencode'
             'qt5-base' 'openssl' 'zeromq')

    cd "$pkgbase-${pkgver}ppc"
    install -D --mode 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    install -D --mode 644 \
            contrib/debian/peercoin-qt.desktop \
            "$pkgdir/usr/share/applications/peercoin-qt.desktop"
    install -D --mode 644 \
            contrib/debian/manpages/peercoin-qt.1 \
            "$pkgdir/usr/share/man/man1/peercoin-qt.1"
    install -D --mode 644 \
            share/pixmaps/peercoin128.png \
            "$pkgdir/usr/share/pixmaps/peercoin128.png"
    install -D --mode 755 \
            src/qt/peercoin-qt \
            "$pkgdir/usr/bin/peercoin-qt"
}

package_peercoin-tx() {
    pkgdesc="A peer-to-peer network-based digital currency - transaction tool"
    depends=('boost-libs' 'openssl')

    cd "$pkgbase-${pkgver}ppc"
    install -D --mode 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    install -D --mode 644 \
            contrib/peercoin-tx.bash-completion \
            "$pkgdir/usr/share/bash-completion/completions/peercoin-tx"
    install -D --mode 644 \
            doc/man/peercoin-tx.1 \
            "$pkgdir/usr/share/man/man1/peercoin-tx.1"
    install -D --mode 755 \
            src/peercoin-tx \
            "$pkgdir/usr/bin/peercoin-tx"
}
