# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=zcoin-git
pkgver=v0.13.4.2.r97.g62f1a32
pkgrel=1
pkgdesc='The Zerocoin Cryptocurrency'
arch=('any')
url='https://github.com/zcoinofficial/zcoin'
license=('MIT')
depends=('db4.8' 'boost' 'miniupnpc' 'qt5-base' 'qt5-tools' 'openssl' 'qrencode' 'libevent' 'libcap' 'zstd')
source=("$pkgname::git+https://github.com/zcoinofficial/zcoin.git"
        "${pkgname/-git/}.desktop")
md5sums=('SKIP'
         '2e3eff2f4fd362a84687979ebb136867')

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    ./autogen.sh
    LDFLAGS=" -lseccomp -lzstd -lcap" ./configure
    # Please uncomment this if you face build errors
    # make clean
    make
}

package() {
    install -Dm755 "$srcdir/$pkgname/src/qt/zcoin-qt" "$pkgdir/usr/bin/zcoin-qt"
    install -Dm755 "$srcdir/$pkgname/src/zcoind" "$pkgdir/usr/bin/zcoind"
    install -Dm755 "$srcdir/$pkgname/src/zcoin-cli" "$pkgdir/usr/bin/zcoin-cli"
    install -Dm755 "$srcdir/$pkgname/src/zcoin-tx" "$pkgdir/usr/bin/zcoin-tx"
    install -Dm644 "$srcdir/$pkgname/src/qt/res/icons/zcoin.png" "$pkgdir/usr/share/icons/zcoin.png"
    install -Dm644 "${pkgname/-git/}.desktop" "$pkgdir/usr/share/applications/${pkgname/-git/}.desktop"
}
