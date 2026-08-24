pkgname=libelectron
pkgver=2026.5
pkgrel=2
libsplashver=1.1
libadblockver=1.5
libuseragent=151.0.0.0
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A meta package for electron and electron dependencies."
makedepends=('unzip')
sha256sums=('51b7313fc2e0512190548964c967fee9794bb8c376a216a97ff3b3f194b064a1'
            '25b84c3f7ae144409afb7bb8fee64cbd0b44ed78d3c6d6246feb66282936a3f4'
            '1c210ee8b378ce5b9491bc33eb09fc6d6d2b913ded5cb4ac41738fd07a7579b3'
            '239d663ca06632841e1d02e99f3390ed5a7e112c56143049e06a043f6890d22f')
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
