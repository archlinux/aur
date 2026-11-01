# Maintainer: Blaadick <null>

pkgname="libraven"
pkgdesc="Lightweight multithreaded GUI library in C for editors and tools"
url="https://github.com/oscar-soirey/Raven"
license=("Apache-2.0" "OFL-1.1" "MIT OR Unlicense")
pkgver="0.2.0"
pkgrel=1
arch=("x86_64")
depends=(
    "glibc"
    "libx11"
    "vulkan-icd-loader"
)
optdepends=(
    "zenity: system file dialogs"
    "kdialog: system file dialogs"
    "dbus: accessibility through AT-SPI"
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
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=("54e27d1bfa7f195d477dc82a6f8abca39bad3bc14e0eb5fae04671875cd1756382288a5b6fc8ce1549b59dfaea4da1d627ebade1459fc0aa71f4617a4b77089f")

prepare() {
    cd "Raven-$pkgver"

    sed -i 's|${PROJECT_SOURCE_DIR}/include|/usr/include|' tools/CMakeLists.txt
}

build() {
    cd "Raven-$pkgver"

    cmake -B build -S . -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DRAVEN_BUILD_SHARED=ON \
        -DRAVEN_BUILD_TOOLS=ON \
        -DRAVEN_BUILD_TESTS=ON \
        -DRAVEN_BUILD_EXAMPLES=OFF \
        -DRAVEN_FETCH_VULKAN_HEADERS=OFF
    cmake --build build --parallel
}

check() {
    cd "Raven-$pkgver"

    mkdir -p build/share/raven
    ln -sfn "$PWD/bindings" build/share/raven/bindings
    ctest --test-dir build --output-on-failure
}

package() {
    cd "Raven-$pkgver"

    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /usr/share/raven/licenses "$pkgdir/usr/share/licenses/$pkgname/third_party"
}
