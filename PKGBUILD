pkgname=libelectron
pkgver=2026.6
pkgrel=2
libsplashver=1.2.1
libadblockver=1.6.2
libuseragent=1.2
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A meta package for electron and electron dependencies."
makedepends=('unzip')
sha256sums=('38ac457e9b6245cc34c7502e41030c45bee13cfdf059bcaa5b432d2f28c5843a'
            '522a6a5c72c9a586847afc2c710c505bbafd031109ccd00b20643cc598f8c68d'
            'a59ae9bc64f2d8e3d9d3392655d9bcfa1cc35fc0419aa911511aae611d59fd43'
            '9fc283a91a8048c78866677c8b099e06a91346b3d2973b85b3aafb5fc72f8a48')
source=(
"$url/libelectron/-/archive/$pkgver/libelectron-$pkgver.tar.bz2"
"$url/libsplash/-/archive/$libsplashver/libsplash-$libsplashver.tar.bz2"
"$url/libadblock/libadblock/-/archive/$libadblockver/libadblock-$libadblockver.tar.bz2"
"$url/libuseragent/-/archive/$libuseragent/libuseragent-$libuseragent.tar.bz2")

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -dm755 "$pkgdir/opt/libelectron"
    ln -s "/usr/bin/libelectronmeta" "$pkgdir/opt/libelectron/electron"

    if [[ -f /opt/libelectron/version.txt ]] && [[ "$(< /opt/libelectron/version.txt)" == "$pkgver" ]] && [[ -d /opt/libelectron/node_modules ]]; then
        cp -a /opt/libelectron/node_modules "$pkgdir/opt/libelectron/"
    else
        npm install --legacy-peer-deps --omit=dev
        cp -a "$srcdir/$pkgname-$pkgver/node_modules" "$pkgdir/opt/libelectron/"
    fi

    printf '%s\n' "$pkgver" > "$pkgdir/opt/libelectron/version.txt"

    #LibSplash
    install -dm755 "$pkgdir/opt/libelectron/libsplash"
    cp -a "$srcdir/libsplash-$libsplashver/." "$pkgdir/opt/libelectron/libsplash/"

    #Libadblock
    install -dm755 "$pkgdir/opt/libelectron/libadblock"
    cp -a "$srcdir/libadblock-$libadblockver/." "$pkgdir/opt/libelectron/libadblock/"

    #Libuseragent
    install -dm755 "$pkgdir/opt/libelectron/libuseragent"
    cp -a "$srcdir/libuseragent-$libuseragent/." "$pkgdir/opt/libelectron/libuseragent/"
}
