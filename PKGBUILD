# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Daniel Kraft <$(echo "ZEBkb21vYi5ldQo=" | base64 -d)>
# Contributor:  Jeremy Rand <$(echo "YmlvbGl6YXJkODlAZ21haWwuY29tCg==" | base64 -d)>
# Contributor:  The Namecoin Core Developers
# Contributor:  The Bitcoin Core Developers


pkgname=namecoin-core-wallet
pkgver=v0.13.99.name.tab.beta1
pkgrel=3

# Epoch is always set to the most recent PKGBUILD update time.
# This allows for a forced downgrade without messing up versioning.
epoch=1504811212

# Release commit for nc0.13.99-name-tab-beta1
_commit=a11e75411af3b612a36e3516e461934838c0c53b

pkgdesc='This package provides the Namecoin Core GUI client and CLI daemon. This package does not create a systemd service.'
arch=('i686' 'x86_64')
url='https://namecoin.org/'
license=('MIT')
depends=('desktop-file-utils' 'openssl' 'db4.8' 'boost' 'boost-libs' 'libevent' 'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
provides=('namecoin-core-wallet' 'namecoin-cli' 'namecoin-daemon' 'namecoin-qt' 'namecoin-tx')
conflicts=('namecoin-core-wallet' 'namecoin-cli' 'namecoin-daemon' 'namecoin-qt' 'namecoin-tx')
source=('git://github.com/namecoin/namecoin-core'
        'namecoin.desktop'
        'namecoin1500x1500.png')
sha256sums=('SKIP'
            '0226f5a570bbbde63f332d43d9d712287b316c726280f2ae9e21b1b365b3f0dc'
            'f1e0593b872e18e0aebbf399bb5d77be255cb0aa160964c0528698a33f89ba04')

build() {
    mkdir -p "$srcdir/tmp"
    cd "$srcdir/namecoin-core/"

    ### Get OpenSSL patched files
    git checkout bae1eef752dcecfd85fa482881e1dbe4d7e9f74c > /dev/null 2>&1
    cp src/wallet/test/crypto_tests.cpp ../
    git checkout b05b1af10b9a5298bd90bea439f0fd6c636e0cfa > /dev/null 2>&1
    cp src/qt/paymentrequestplus.cpp ../
    ###

    git checkout "$_commit" > /dev/null 2>&1

    ### Replace files with working versions
    rm -f src/qt/paymentrequestplus.cpp
    rm -f src/wallet/test/crypto_tests.cpp
    mv ../paymentrequestplus.cpp ./src/qt/
    mv ../crypto_tests.cpp ./src/wallet/test/
    ###

    ./autogen.sh
    ./configure --prefix=/usr --enable-upnp-default --enable-hardening --with-gui=qt5
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
