# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Jeremy Rand <$(echo "YmlvbGl6YXJkODlAZ21haWwuY29tCg==" | base64 -d)>
# Contributor:  Daniel Kraft <$(echo "ZEBkb21vYi5ldQo=" | base64 -d)>
# Contributor:  The Namecoin Core Developers
# Contributor:  The Bitcoin Core Developers


pkgname=namecoin-core-wallet
pkgver=v0.16.3
pkgrel=2


# Epoch is always set to the most recent PKGBUILD update time.
# This allows for a forced downgrade without messing up versioning.
epoch=1538009445


# Release commit for 0.16.3
_commit=6fdea2aedfbcf0e8c24ce1552f7f58950e5efb55


pkgdesc='This package provides the Namecoin Core GUI client and CLI daemon.'
pkgdesc="$pkgdesc This package does not create a systemd service."

arch=('i686' 'x86_64')
url='https://namecoin.org/'
license=('MIT')
depends=('desktop-file-utils' 'openssl' 'db4.8' 'boost' 'boost-libs' 'libevent'
         'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
provides=('namecoin-core-wallet' 'namecoin-cli' 'namecoin-daemon'
          'namecoin-qt' 'namecoin-tx')
conflicts=('namecoin-core-wallet' 'namecoin-cli' 'namecoin-daemon'
           'namecoin-qt' 'namecoin-tx')
source=('git://github.com/namecoin/namecoin-core'
        'namecoin.desktop'
        'namecoin1500x1500.png'
        'patch.diff')
sha256sums=('SKIP'
            '0226f5a570bbbde63f332d43d9d712287b316c726280f2ae9e21b1b365b3f0dc'
            'f1e0593b872e18e0aebbf399bb5d77be255cb0aa160964c0528698a33f89ba04'
            '59367280936748c3f10fdea0eb7c21e2407b522617a9856dcd43ce7417e8d6a8')


prepare() {
    mkdir -p "$srcdir/tmp"
    cd "$srcdir/namecoin-core/"
    git checkout "$_commit"

    # Fix Qt GUI start freeze bug
    # https://bbs.archlinux.org/viewtopic.php?id=240553
    cd "$srcdir"
    patch -p0 -i patch.diff
}


build() {

    cd "$srcdir/namecoin-core/"
    ./autogen.sh

    # I have not tested the static build process on 32 bit machines yet,
    # so I'm leaving i686 with the normal dynamic build.
    if [ "$CARCH" == i686 ]; then
        ./configure --prefix=/usr --enable-upnp-default --enable-hardening \
                    --with-gui=qt5 --disable-tests

    # This should produce a static build that doesn't brick every time Arch
    # rolls out updates to the system libraries.
    elif [ "$CARCH" == x86_64 ]; then
        ./configure LDFLAGS="-static-libstdc++" \
                   --prefix=/usr \
                   --enable-glibc-back-compat \
                   --enable-reduce-exports \
                   --enable-upnp-default \
                   --enable-hardening \
                   --with-gui=qt5 \
                   --disable-tests
    fi

    make DESTDIR="$srcdir/tmp"
    make DESTDIR="$srcdir/tmp" install
}


# Namecoin does not include any man pages.
# Or rather, it has Bitcoin's man pages completely unchanged.
# Therefore, I have not included them in the package.
package() {
    install -Dm644 "$srcdir/namecoin.desktop" "$pkgdir/usr/share/applications/namecoin.desktop"
    install -Dm644 "$srcdir/namecoin1500x1500.png" "$pkgdir/usr/share/pixmaps/namecoin1500x1500.png"
    install -Dm755 "$srcdir/tmp/usr/bin/namecoin-qt" "$pkgdir/usr/bin/namecoin-qt"
    install -Dm755 "$srcdir/tmp/usr/bin/namecoind" "$pkgdir/usr/bin/namecoind"
    install -Dm755 "$srcdir/tmp/usr/bin/namecoin-cli" "$pkgdir/usr/bin/namecoin-cli"
    install -Dm755 "$srcdir/tmp/usr/bin/namecoin-tx" "$pkgdir/usr/bin/namecoin-tx"
    install -Dm644 "$srcdir/namecoin-core/COPYING" "$pkgdir/usr/share/licenses/namecoin/COPYING"
    install -Dm644 "$srcdir/tmp/usr/include/namecoinconsensus.h" "$pkgdir/usr/include/namecoinconsensus.h"
    install -Dm644 "$srcdir/tmp/usr/lib/libnamecoinconsensus.so.0.0.0" "$pkgdir/usr/lib/libnamecoinconsensus.so.0.0.0"
    cd "$pkgdir/usr/lib/"
    ln -s "libnamecoinconsensus.so.0.0.0" "libnamecoinconsensus.so.0"
    ln -s "libnamecoinconsensus.so.0.0.0" "libnamecoinconsensus.so"
}
