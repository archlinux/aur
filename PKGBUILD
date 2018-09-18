# Maintainer: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko-git
pkgver=0.5.0.r732.96a2c614
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=("i686" "x86_64")

url="https://github.com/mujx/nheko"
license=("GPL3")

depends=("qt5-base" "lmdb" "qt5-multimedia" "qt5-svg" "boost" "libsodium" "openssl" "cmark")
makedepends=("git" "cmake" "gcc" "fontconfig" "qt5-tools")

provides=("nheko")
conflicts=("nheko")

source=($pkgname::git://github.com/mujx/nheko.git)
md5sums=("SKIP")

prepare() {
  cd "$pkgname"
}

pkgver() {
    cd "$pkgname"
    printf "0.5.5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    rm -f cmake/FindOlm.cmake

    cmake -Hdeps -B.deps -DUSE_BUNDLED_BOOST=OFF -DUSE_BUNDLED_CMARK=OFF
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
    install -Dm755 "$pkgname/build/nheko" "$pkgdir/usr/bin/nheko"

    # Desktop launcher
    install -Dm644 "$srcdir/$pkgname/resources/nheko-256.png" "$pkgdir/usr/share/pixmaps/nheko.png"
    install -Dm644 "$srcdir/$pkgname/resources/nheko.desktop" "$pkgdir/usr/share/applications/nheko.desktop"

    # Icons
    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "$icon_dir"
        install -m644 "$srcdir/$pkgname/resources/nheko-${icon_size}.png" "$icon_dir/nheko.png"
    done
}
