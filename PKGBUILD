# Use environment variable MAKEPKG_AYUGRAM_API_ID and MAKEPKG_AYUGRAM_API_HASH to override default values

pkgname=ayugram-desktop
pkgver=4.12.2
pkgrel=1
pkgdesc="Desktop Telegram client with good customization and Ghost mode."
arch=("x86_64")
url="https://github.com/AyuGram/AyuGramDesktop"
license=("GPL3")
depends=(
    "hunspell" "ffmpeg" "hicolor-icon-theme" "lz4" "minizip" "openal" "ttf-opensans"
    "qt6-imageformats" "qt6-svg" "qt6-wayland" "xxhash" "rnnoise" "pipewire" "libxtst"
    "libxrandr" "libxcomposite" "jemalloc" "abseil-cpp" "libdispatch" "openssl" "protobuf"
    "glib2" "libsigc++-3.0" "glibmm-2.68"
)
makedepends=(
    "cmake" "git" "ninja" "python" "range-v3" "tl-expected" "microsoft-gsl" "meson"
    "extra-cmake-modules" "wayland-protocols" "plasma-wayland-protocols" "libtg_owt"
    "gobject-introspection" "boost" "fmt" "mm-common" "perl-xml-parser" "libsigc++-3.0"
)
optdepends=(
    "webkit2gtk: embedded browser features"
    "xdg-desktop-portal: desktop integration"
)
source=(
    "git+$url.git#tag=v$pkgver"
)
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/AyuGramDesktop"
    git submodule update --init --recursive
}
build() {
    CXXFLAGS+=' -ffat-lto-objects'
    # https://github.com/AyuGram/AyuGramDesktop/blob/dev/docs/building-linux.md#building-the-project
    # for API_ID and API_HASH
    cmake -B build -S AyuGramDesktop -G Ninja \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID="${MAKEPKG_AYUGRAM_API_ID:-2040}" \
        -DTDESKTOP_API_HASH="${MAKEPKG_AYUGRAM_API_HASH:-b18441a1ff607e10a989891a5462e627}" \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=True
    cmake --build build
}
package() {
    DESTDIR="$pkgdir" cmake --install build
    # Some fixups
    sed -i s/Icon=telegram/Icon=ayugram/ "$pkgdir/usr/share/applications/ayugram.desktop.desktop"
    [[ -f "$pkgdir/usr/share/icons/hicolor/symbolic/apps/telegram-symbolic.svg" ]] && \
        mv "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"{telegram,ayugram}-symbolic.svg
}