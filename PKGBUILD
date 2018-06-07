# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.4.3
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=("i686" "x86_64")

url="https://github.com/mujx/nheko"
license=("GPL3")

depends=("qt5-base" "lmdb" "qt5-multimedia" "qt5-svg")
makedepends=("cmake" "gcc" "fontconfig" "qt5-tools")

source=(https://github.com/mujx/nheko/archive/v$pkgver.tar.gz)
sha512sums=('b9ad4131b75af7ee3b79cb89d63313e94f76a6a6672c5c02b264ebec75a2a2525de266d6e4d07482736b714188a5a1eba721802ff951ee4d77f8cbf571758777')

build() {
    cd "$pkgname-$pkgver"
    cmake -H. -Bbuild -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    # Creating needed directories
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/pixmaps/"
    install -dm755 "$pkgdir/usr/share/applications/"

    # Program
    install -Dm755 "$pkgname-$pkgver/build/nheko" "$pkgdir/usr/bin/nheko"

    # Desktop launcher
    install -Dm644 "$pkgname-$pkgver/resources/nheko-256.png" "$pkgdir/usr/share/pixmaps/nheko.png"
    install -Dm644 "$pkgname-$pkgver/resources/nheko.desktop" "$pkgdir/usr/share/applications/nheko.desktop"

    # Icons
    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "$icon_dir"
        install -m644 "$pkgname-$pkgver/resources/nheko-${icon_size}.png" "$icon_dir/nheko.png"
    done
}

