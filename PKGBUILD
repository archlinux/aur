# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.5.2
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=("i686" "x86_64")

url="https://github.com/mujx/nheko"
license=("GPL3")

depends=("lmdb" "qt5-multimedia" "qt5-svg" "libsodium" "boost-libs" "hicolor-icon-theme")
makedepends=("cmake" "fontconfig" "qt5-tools" "git" "boost")

source=("$pkgname-$pkgver.tar.gz::https://github.com/mujx/nheko/archive/v$pkgver.tar.gz")
sha512sums=('829d31aabd32338cb7eb8d15311b43e946b2b42e553894c7c5f76bb1a94cb5bbaa6f454d1910d8e6c4e10df5d2523d998743a39a1cc49850befce6d1897dbe37')

prepare() {
    rm -f "$pkgname-$pkgver"/cmake/FindOlm.cmake
}

build() {
    cd "$pkgname-$pkgver"
    cmake -Hdeps -B.deps -DUSE_BUNDLED_BOOST=OFF
    cmake --build .deps

    cmake -H. -Bbuild -DCMAKE_BUILD_TYPE=Release \
        -DLMDBXX_INCLUDE_DIR=.deps/usr/include \
        -DTWEENY_INCLUDE_DIR=.deps/usr/include
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

