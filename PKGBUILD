# Maintainer: Konstantinos Sideris <siderisk at auth dot gr>
# Maintainer: Joseph Donofry <joe at joedonofry dot com>

pkgname=nheko-git
pkgver=0.7.2.r2316.b6f2acfe
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=("i686" "x86_64")

url="https://github.com/Nheko-Reborn/nheko"
license=("GPL3")

depends=("qt5-base" "lmdb" "qt5-graphicaleffects" "qt5-multimedia" "qt5-svg" "qt5-quickcontrols2" "qt5-declarative" "qtkeychain-qt5" "boost-libs" "libsodium" "cmark" "openssl" "hicolor-icon-theme" "gstreamer" "gst-plugins-base" "gst-plugins-good" "gst-plugins-bad" "libnice" "libolm" "spdlog" "tweeny" "lmdbxx")
makedepends=("git" "cmake" "gcc" "fontconfig" "qt5-tools" "nlohmann-json" "boost")

provides=("nheko")
conflicts=("nheko")

source=($pkgname::git://github.com/Nheko-Reborn/nheko.git#branch=master)
md5sums=("SKIP")

prepare() {
  cd "$pkgname"
}

pkgver() {
    cd "$pkgname"
    printf "0.7.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    rm -f cmake/FindOlm.cmake

    # build with more cores than the default
    export CMAKE_BUILD_PARALLEL_LEVEL=$(cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l)
    cmake -H. -Bbuild -DHUNTER_ENABLED=OFF -DBUILD_SHARED_LIBS=OFF -DUSE_BUNDLED_MTXCLIENT=ON -DCMAKE_INSTALL_PREFIX=.deps/usr -DCMAKE_BUILD_TYPE=Release
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
