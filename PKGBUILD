# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.3.0
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=("i686" "x86_64")

url="https://github.com/mujx/nheko"
license=("GPL3")

depends=("qt5-base" "lmdb" "qt5-multimedia")
makedepends=("cmake" "gcc" "fontconfig" "qt5-tools")

source=(https://github.com/mujx/nheko/archive/v$pkgver.tar.gz)
sha512sums=('303c5fae4ec6552da42e5a2386fc18ebd8fed62fbc5d559d321c8d8feef4e62d3f3ea16172b9751e7712597155f2ca878d1fcee469a5c944b75f122fb269be3d')

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

