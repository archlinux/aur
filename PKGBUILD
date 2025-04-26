# Maintainer: User0 <user0thenyancat@proton-me>
pkgname=erwise
pkgver="0.1"
pkgrel=3
pkgdesc="An early discontinued web-browser built with Motif. Doesn't seem to successfully connect to the web, however opens local HTML files really well."
arch=('x86_64')
url="https://ftp.funet.fi/pub/networking/services/www/erwisE/"
license=('unknown')
options=('!emptydirs')
depends=(
    "openmotif"
    "libxmu"
    "libx11"
    "libxext"
    "libxt"
    "libxaw"
    "libxi" # <- unsure?
)
makedepends=(
    "make"
    "gcc"
    "openmotif"
    "libxmu"
    "libx11"
    "libxext"
    "libxt"
    "libxaw"
    "libxi" # <- unsure?
    "imagemagick"
)
source=(
    $pkgname-$pkgver.tar.gz::https://ftp.funet.fi/pub/networking/services/www/erwisE/erwise-0.1.tar.Z
    $pkgname-$pkgver.png
    $pkgname-$pkgver.desktop
    $pkgname-$pkgver.patch
)
sha256sums=(
    '30d9dd36585610bb8be95895f7ca4874c6f15f3e064844607f31fac913686291'
    '07e108bef809bcb6c6edeb408c92e8de13c976c545cd3086b0e7c0930948f500'
    '18b3f0ee3fa2beb8bb764a37d3dae98c876f61ad145740132951de49233fb4e7'
    '30db5656bf458f93d65b5d2e32e5fe75cbce68f4d05adb7c34da7847c9cf3ed5'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
    make clean

    magick "../$pkgname-$pkgver.png" -define icon:auto-resize=256 -thumbnail 256x256 icon-256.png
    magick "../$pkgname-$pkgver.png" -define icon:auto-resize=128 -thumbnail 128x128 icon-128.png
    magick "../$pkgname-$pkgver.png" -define icon:auto-resize=32 -thumbnail 32x32 icon-32.png
    magick "../$pkgname-$pkgver.png" -define icon:auto-resize=16 -thumbnail 16x16 icon-16.png
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 "Cl/libCl.a" "$pkgdir/usr/lib/libCl.a"
    install -Dm644 "HText/libHt.a" "$pkgdir/usr/lib/libHt.a"
    install -Dm644 "Ui/libUi.a" "$pkgdir/usr/lib/libUi.a"
    install -Dm644 "Xl/libXl.a" "$pkgdir/usr/lib/libXl.a"

    install -Dm755 "erwise/erwise" "$pkgdir/usr/local/bin/erwise"

    install -Dm644 "../$pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/erwise.desktop"
    install -Dm644 "icon-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/erwise.png"
    install -Dm644 "icon-128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/erwise.png"
    install -Dm644 "icon-32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/erwise.png"
    install -Dm644 "icon-16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/erwise.png"
}
