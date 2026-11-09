# Maintainer: Roshless <pkg@roshless.com>

pkgbase=lagrange
pkgname=(lagrange lagrange-common clagrange)
pkgrel=2
pkgver=2.0.2
pkgdesc='Beautiful Gemini Client'
url="https://git.skyjake.fi/skyjake/lagrange"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=("MIT")
install="${pkgbase}.install"
source=(
    "https://git.skyjake.fi/skyjake/${pkgname[0]}/releases/download/v$pkgver/lagrange-$pkgver.tar.gz"
)
depends=(
    "hicolor-icon-theme"
    "libunistring"
    "openssl"
    "pcre2"
    "zlib"
)
makedepends=(
    "cmake"
    "fribidi"
    "harfbuzz"
    "mpg123"
    "ncurses"
    "sdl3"
    "zip"
)
optdepends=(
    "libwebp: Webp decode support"
    "libjxl: JPEG XL image decoding"
)

build() {
    cmake -B build -S "${pkgbase}-$pkgver" \
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
    arch=('any')
    depends=()

    install -Dm644 "lagrange-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/lagrange/LICENSE"

    cd build
    DESTDIR="$pkgdir" cmake --install . --prefix /usr --component resources
}

package_lagrange() {
    depends+=(
        "freetype2"
        "fribidi"
        "harfbuzz"
        "libx11"
        "sdl3"
        "mpg123"
        "lagrange-common"
    )

    cd build
    DESTDIR="$pkgdir" cmake --install . --prefix /usr --component app
    DESTDIR="$pkgdir" cmake --install . --prefix /usr --component gmget
}

package_clagrange() {
    depends+=(
        "ncurses"
        "lagrange-common"
    )

    cd build
    DESTDIR="$pkgdir" cmake --install . --prefix /usr --component tui
}

sha256sums=('7994b41daa6000dfe479a8f5328c36010dba53c873f2399274a029763a77a7a7')
