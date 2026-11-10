# Maintainer: Blaadick <null>

pkgname="libraven"
pkgdesc="Lightweight multithreaded GUI library in C for editors and tools"
url="https://github.com/oscar-soirey/Raven"
license=("Apache-2.0" "OFL-1.1" "MIT OR Unlicense" "Zlib" "MIT")
pkgver="0.2.2"
pkgrel=1
arch=("x86_64")
depends=(
    "glibc"
    "libx11"
    "vulkan-icd-loader"
)
optdepends=(
    "wayland: native Wayland windows"
    "libxkbcommon: native Wayland windows"
    "libdecor: window decorations on Wayland compositors without server-side ones"
    "libxi: touch and pen input on X11"
    "zenity: system file dialogs"
    "kdialog: system file dialogs"
    "dbus: accessibility through AT-SPI, notifications and tray"
    "curl: remote images in Markdown"
    "chromium: web pages (raven_web)"
    "python: Python bindings"
)
makedepends=(
    "cmake"
    "ninja"
    "vulkan-headers"
)
checkdepends=(
    "python"
    "wayland"
    "libxkbcommon"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("ba58d97366b7f9dbfb552691ef266d6840743712188127de4d9f58f507cbd49568a70575e9e28f9dfa4fc43a45e990ce6bdf028c200d4c0356ff68dc598ccaf4")

build() {
    CFLAGS+=" -DNDEBUG"
    cmake -B build -S "Raven-$pkgver" -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DRAVEN_BUILD_SHARED=ON \
        -DRAVEN_BUILD_TOOLS=ON \
        -DRAVEN_BUILD_TESTS=ON \
        -DRAVEN_BUILD_EXAMPLES=OFF \
        -DRAVEN_WAYLAND=ON \
        -DRAVEN_FETCH_VULKAN_HEADERS=OFF \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    cd "Raven-$pkgver"

    local licenses="$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE NOTICE -t "$licenses"
    install -Dm644 third_party/wayland-protocols/COPYING -t "$pkgdir/usr/share/raven/licenses/wayland-protocols"
    install -Dm644 tools/designer/fonts/OFL-*.txt -t "$pkgdir/usr/share/raven/licenses/designer-fonts"
    ln -s /usr/share/raven/licenses "$licenses/third_party"
}
