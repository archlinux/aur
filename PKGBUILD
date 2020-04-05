# Maintainer: Konstantinos Sideris <siderisk at auth dot gr>
# Maintainer: Joseph Donofry <joe at joedonofry dot com>

pkgname=nheko-git
pkgver=0.7.0.r1532.384ef13
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=("i686" "x86_64")

url="https://github.com/Nheko-Reborn/nheko"
license=("GPL3")

depends=("qt5-base" "lmdb" "qt5-graphicaleffects" "qt5-multimedia" "qt5-svg" "qt5-quickcontrols2"  "boost" "libsodium" "openssl" "cmark" )
makedepends=("git" "cmake" "gcc" "fontconfig" "qt5-tools")

provides=("nheko")
conflicts=("nheko")

source=($pkgname::git://github.com/Nheko-Reborn/nheko.git#branch=master)
md5sums=("SKIP")

prepare() {
  cd "$pkgname"
}

pkgver() {
    cd "$pkgname"
    printf "0.7.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    rm -f cmake/FindOlm.cmake

    # build with more cores than the default
    export CMAKE_BUILD_PARALLEL_LEVEL=$(cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l)
    cmake -H. -Bbuild -DHUNTER_ENABLED=ON -DBUILD_SHARED_LIBS=OFF -DUSE_BUNDLED_OPENSSL=OFF -DUSE_BUNDLED_BOOST=OFF -DUSE_BUNDLED_CMARK=OFF -DUSE_BUNDLED_JSON=ON \
    -DCMAKE_INSTALL_PREFIX=.deps/usr
    cmake --build build --config Release
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
