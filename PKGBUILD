# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.2.1
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=("i686" "x86_64")

url="https://github.com/mujx/nheko"
license=("GPL3")

depends=("qt5-base" "lmdb" "qt5-multimedia")
makedepends=("cmake" "gcc" "fontconfig" "qt5-tools")

source=(https://github.com/mujx/nheko/archive/v$pkgver.tar.gz)
sha512sums=('7d08c5c561c0388756b663da98b209c3074b61f5743cefa8f1ad21e3184b0de3973a8a6b129a0f1f602e6dbb3c99d7f0cf47e394a4c9527086a250aff7ca5b85')

build() {
    cd "$pkgname-$pkgver"
    cmake -H. -Bbuild -DCMAKE_BUILD_TYPE=RelWithDebInfo
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

