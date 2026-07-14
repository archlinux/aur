pkgname=libelectron
pkgver=2026.4
pkgrel=2
libsplashver=1.0
libadblockver=1.1
arch=("x86_64" "aarch64")
url="https://gitlab.com/linuxbombay/libelectron"
license=('GPL')
depends=('npm' 'git' 'icu')
pkgdesc="A meta package for electron and electron dependencies."
makedepends=('unzip')
sha256sums=('5619174b56786bf6fde393aa2f9915992457f3ffec691d5ac007e71a5f1ee170'
            'faaa3f1b356e816068e49b745add4bf80f4fedb8c9d5ddf51c57cba6b019aa51'
            'c16de890530e33759716b98e331b0661feb3212568f680ae3b0275321f1f8e35')
source=(
"$url/libelectron/-/archive/$pkgver/libelectron-$pkgver.tar.bz2"
"$url/libsplash/-/archive/$libsplashver/libsplash-$libsplashver.tar.bz2"
"$url/libadblock/libadblock/-/archive/$libadblockver/libadblock-$libadblockver.tar.bz2")

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
}
