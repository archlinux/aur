# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Jeremy Rand <$(echo "YmlvbGl6YXJkODlAZ21haWwuY29tCg==" | base64 -d)>
# Contributor:  Daniel Kraft <$(echo "ZEBkb21vYi5ldQo=" | base64 -d)>
# Contributor:  The Namecoin Core Developers
# Contributor:  The Bitcoin Core Developers


pkgname=namecoin-core-wallet
pkgver=v30.0
pkgrel=1


# Epoch is always set to the most recent PKGBUILD update time.
# This allows for a forced downgrade without messing up versioning.
epoch=1760374425


# Release commit for 30.0
_commit=6cfd509e54d31b82c0db8c0a9abc21e9c1b19ee4


pkgdesc='This package provides the Namecoin Core GUI client, CLI daemon, and daemon user service.'

arch=('i686' 'x86_64')
url='https://namecoin.org/'
license=('MIT')
depends=('desktop-file-utils' 'openssl' 'boost' 'boost-libs' 'libevent' 'qt6-base'
         'qt6-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq' 'sqlite')
makedepends=('git' 'gzip' 'patch' 'make' 'coreutils' 'cmake' 'doxygen')
provides=('namecoin-core-wallet' 'namecoin-cli' 'namecoin-daemon'
          'namecoin-qt' 'namecoin-tx')
conflicts=('namecoin-core-wallet' 'namecoin-cli' 'namecoin-daemon'
           'namecoin-qt' 'namecoin-tx')
source=('git+https://github.com/namecoin/namecoin-core'
        'namecoin.desktop'
        'namecoin1500x1500.png'
        'namecoind.service'
        'namecoind@.service')

sha256sums=('SKIP'
            '0226f5a570bbbde63f332d43d9d712287b316c726280f2ae9e21b1b365b3f0dc'
            'f1e0593b872e18e0aebbf399bb5d77be255cb0aa160964c0528698a33f89ba04'
            '0a8cb03f33a895ccaed63fb9d946db69bee7188b7a9f41bc92879167c2718dcf'
            '216bf1642feb5c37cc82a0801faf0717308f98e5aed86d75dac8fafd150a4b68')

build() {
    PLATFORMNAME="x86_64-pc-linux-gnu"
    [ "$CARCH" == i686 ] && PLATFORMNAME="i686-pc-linux-gnu" || true
    cd "$srcdir/namecoin-core/"
    git checkout "$_commit"
    make "CMAKE_POLICY_VERSION_MINIMUM=4.0" STATIC=1 -C depends NO_BOOST=1 NO_LIBEVENT=1 NO_QT=1 NO_SQLITE=1 NO_ZMQ=1 NO_USDT=1 NO_QR=1
    cmake -B build -DCMAKE_POLICY_VERSION_MINIMUM="4.0" -DCMAKE_INSTALL_PREFIX="/usr" -DBerkeleyDB_INCLUDE_DIR:PATH="${srcdir}/namecoin-core/depends/${PLATFORMNAME}/include" -DBerkeleyDB_LIB_DIR:PATH="${srcdir}/namecoin-core/depends/${PLATFORMNAME}/lib" -DWITH_BDB=ON -DENABLE_WALLET=ON -DSECP256K1_INSTALL=ON -DREDUCE_EXPORTS=ON -DBUILD_UTIL_CHAINSTATE=OFF -DBUILD_GUI=ON -DCMAKE_BUILD_TYPE=MinSizeRel -DBUILD_TESTS=OFF -DBUILD_SHARED_LIBS=ON -DBUILD_WALLET_TOOL=ON -DBUILD_TX=ON -DBUILD_UTIL=ON -DWITH_ZMQ=ON -DENABLE_IPC=OFF -DAPPEND_LDFLAGS="-static-libstdc++ -s -w"
    cmake --build build
}

package() {
    install -Dm644 "$srcdir/namecoin.desktop"      "$pkgdir/usr/share/applications/namecoin.desktop"
    install -Dm644 "$srcdir/namecoin1500x1500.png" "$pkgdir/usr/share/pixmaps/namecoin1500x1500.png"
    install -Dm644 "$srcdir/namecoind@.service"    "$pkgdir/usr/lib/systemd/system/namecoind@.service"
    install -Dm644 "$srcdir/namecoind.service"     "$pkgdir/usr/lib/systemd/user/namecoind.service"
    install -Dm644 "$srcdir/namecoin-core/COPYING" "$pkgdir/usr/share/licenses/namecoin/COPYING"
    install -Dm755 "$srcdir/namecoin-core/build/bin/namecoin-qt"    "$pkgdir/usr/bin/namecoin-qt"
    install -Dm755 "$srcdir/namecoin-core/build/bin/namecoind"      "$pkgdir/usr/bin/namecoind"
    install -Dm755 "$srcdir/namecoin-core/build/bin/namecoin-cli"   "$pkgdir/usr/bin/namecoin-cli"
    install -Dm755 "$srcdir/namecoin-core/build/bin/namecoin-tx"    "$pkgdir/usr/bin/namecoin-tx"
    install -Dm755 "$srcdir/namecoin-core/build/bin/namecoin-wallet"    "$pkgdir/usr/bin/namecoin-wallet"
    install -Dm755 "$srcdir/namecoin-core/build/bin/namecoin-util"    "$pkgdir/usr/bin/namecoin-util"
    install -Dm644 "$srcdir/namecoin-core/doc/man/namecoin-cli.1"     "$pkgdir/usr/share/man/man1/namecoin-cli.1"
    install -Dm644 "$srcdir/namecoin-core/doc/man/namecoind.1"        "$pkgdir/usr/share/man/man1/namecoind.1"
    install -Dm644 "$srcdir/namecoin-core/doc/man/namecoin-qt.1"      "$pkgdir/usr/share/man/man1/namecoin-qt.1"
    install -Dm644 "$srcdir/namecoin-core/doc/man/namecoin-tx.1"      "$pkgdir/usr/share/man/man1/namecoin-tx.1"
    install -Dm644 "$srcdir/namecoin-core/doc/man/namecoin-wallet.1"  "$pkgdir/usr/share/man/man1/namecoin-wallet.1"
    install -Dm644 "$srcdir/namecoin-core/doc/man/namecoin-util.1"  "$pkgdir/usr/share/man/man1/namecoin-util.1"
    gzip "$pkgdir/usr/share/man/man1/namecoin-cli.1"
    gzip "$pkgdir/usr/share/man/man1/namecoind.1"
    gzip "$pkgdir/usr/share/man/man1/namecoin-qt.1"
    gzip "$pkgdir/usr/share/man/man1/namecoin-tx.1"
    gzip "$pkgdir/usr/share/man/man1/namecoin-wallet.1"
    gzip "$pkgdir/usr/share/man/man1/namecoin-util.1"
}
