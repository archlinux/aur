pkgname=libelectron
pkgver=2026.4
pkgrel=5
libsplashver=1.1
libadblockver=1.2
libuseragent=150.0.0.0
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A meta package for electron and electron dependencies."
makedepends=('unzip')
sha256sums=('5619174b56786bf6fde393aa2f9915992457f3ffec691d5ac007e71a5f1ee170'
            '25b84c3f7ae144409afb7bb8fee64cbd0b44ed78d3c6d6246feb66282936a3f4'
            'cbcdedd53a89030296b08de297a522dc05ffe6b0d4a9f542ce474d791b8274d6'
            'ae44825fc3a66aa62bfb0bf25c5258ac9b2cecc305793dda3c8af0c8c72bac27')
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
