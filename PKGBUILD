# Maintainer: Roshless <pkg@roshless.com>

pkgname=(lagrange lagrange-common clagrange)
pkgrel=2
pkgver=2.0.1
pkgdesc='Beautiful Gemini Client'
url="https://git.skyjake.fi/skyjake/lagrange"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=("MIT")
install="${pkgname[0]}.install"
source=(
    "https://git.skyjake.fi/skyjake/${pkgname[0]}/releases/download/v$pkgver/lagrange-$pkgver.tar.gz"
)
makedepends=(
    "cmake"
    "zip"
)
optdepends=(
    "libwebp: Webp decode support"
    "libjxl: JPEG XL image decoding"
)

build() {
    cmake -B build -S "${pkgname[0]}-$pkgver" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DENABLE_GUI=ON \
        -DENABLE_TUI=ON \
        -DENABLE_KERNING=OFF \
        -DTFDN_ENABLE_WARN_ERROR=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -Wno-dev
    make -C build
}

package_lagrange-common() {
    depends=(
        "fribidi"
        "harfbuzz"
        "libunistring"
        "openssl"
        "pcre"
        "zlib"
    )

    install -Dm644 "lagrange-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/lagrange/LICENSE"

    cd build
    DESTDIR="$pkgdir" cmake --install . --prefix /usr --component resources
}

package_lagrange() {
    depends=(
        "fribidi"
        "harfbuzz"
        "hicolor-icon-theme"
        "libunistring"
        "openssl"
        "pcre"
        "sdl3"
        "zlib"
        "mpg123"
        "lagrange-common"
    )

    cd build
    DESTDIR="$pkgdir" cmake --install . --prefix /usr --component app
    DESTDIR="$pkgdir" cmake --install . --prefix /usr --component gmget
}

package_clagrange() {
    depends=(
        "ncurses"
        "fribidi"
        "harfbuzz"
        "libunistring"
        "openssl"
        "pcre"
        "zlib"
        "lagrange-common"
    )

    cd build
    DESTDIR="$pkgdir" cmake --install . --prefix /usr --component tui
}

sha256sums=('abac39d4aff9716c9d4b3b10f85e83d762f8896ad83c1ffda74c7ed4b6521cfd')
