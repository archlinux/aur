# Maintainer: Revincx <revincx233@gmail.com>

pkgname=yurigram
pkgver=7.0.1
pkgrel=1
pkgdesc='Yet another unofficial tdesktop client'
arch=('x86_64')
url="https://github.com/Revincx/Yurigram"
license=('GPL3')
provides=('yurigram')
replaces=('yukigram-rua' 'yukigram-rua-bin')
conflicts=('yukigram-rua' 'yukigram-rua-bin')
depends=(
    'abseil-cpp'
    'ada'
    'ffmpeg'
    'glib2'
    'hicolor-icon-theme'
    'hunspell'
    'kcoreaddons'
    'libavif'
    'libheif'
    'libjxl'
    'libstdc++'
    'libxcomposite'
    'libxdamage'
    'libxrandr'
    'libxtst'
    'lz4'
    'minizip'
    'zlib'
    'glibc'
    'libgcc'
    'openal'
    'openh264'
    'openssl'
    'pipewire'
    'protobuf'
    'qt6-imageformats'
    'qt6-svg'
    'qt6-wayland'
    'rnnoise'
    'xxhash'
)
makedepends=('cmake' 'boost' 'boost-libs' 'git' 'ninja' 'python' 'range-v3' 'microsoft-gsl' 'ccache'
             'libtg_owt' 'gobject-introspection' 'fmt' 'glib2-devel' 'gperf')
optdepends=('geoclue: geoinformation support'
            'geocode-glib-2: geocoding support'
            'webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')

_source="https://github.com/Revincx/Yurigram.git"

source=("$pkgname::git+$_source#tag=$pkgver-$pkgrel")

_source_tdlib() {
  _pkgsrc_tdlib="telegram-tdlib"
  source+=("$_pkgsrc_tdlib"::"git+https://github.com/tdlib/td.git")
  sha256sums+=('SKIP')
}

sha256sums=('SKIP')

_source_tdlib

prepare() {
    cd "$pkgname"
    git reset --hard $HEAD
    export __SOURCE_DIR=$_source_dir

    git submodule update --init --recursive --force
}

bail() {
    echo "$@"
    exit 1
}

validate_api() {

    # Use the default API_ID and API_HASH from Telegram snap builds
    # ref: https://gitlab.archlinux.org/archlinux/packaging/packages/telegram-desktop/-/blob/main/PKGBUILD#L98

    export API_ID=${API_ID:-"611335"}
    export API_HASH=${API_HASH:-"d524b414d21f4d37f08684c1df41ac9c"}

    [[ "$API_ID" =~ ^[1-9][0-9]*$ ]] || bail "API_ID must be a positive number"
    [[ "$API_HASH" =~ ^[0-9a-f]{32}$ ]] || bail "API_HASH must contain 32 hex digits [0-9a-f]"
}

build() {
    validate_api

    CXXFLAGS+=' -ffat-lto-objects'

    echo "Building tde2e..."

    cmake -B "build_tde2e" \
        -S "$_pkgsrc_tdlib" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DTD_E2E_ONLY=ON \
        -DBUILD_SHARED_LIBS=OFF \
        -DBUILD_TESTING=OFF \
        -Wno-dev

    cmake --build "build_tde2e"
    DESTDIR="$srcdir/deps" cmake --install "build_tde2e"

    echo "Building yurigram..."
    cmake -B build \
        -S $pkgname \
        -G Ninja \
        -D CMAKE_INSTALL_PREFIX="/usr" \
        -D CMAKE_PREFIX_PATH="$srcdir/deps/usr" \
        -D CMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF \
        -D CMAKE_EXE_LINKER_FLAGS="-Wl,--copy-dt-needed-entries" \
        -D TDESKTOP_API_ID="$API_ID" \
        -D TDESKTOP_API_HASH="$API_HASH" \
        -D DESKTOP_APP_DISABLE_AUTOUPDATE=ON \
        -Wno-dev
    
    cmake --build build --config Release --parallel
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

# Based on https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=telegram-desktop-userfonts (commit 9ce5fd07)
# fix-lzma.patch took from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=64gram-desktop (commit 2f6d1aeb)
