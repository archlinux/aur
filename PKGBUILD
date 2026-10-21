# Maintainer: Timothy Redaelli <timothy@fsfe.org>

# Based on telegram-desktop PKGBUILD
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

pkgname=mercurygram-desktop-git
pkgver=7.3.2.1.r0.g3b099de
pkgrel=1
pkgdesc='Privacy-focused Telegram Desktop fork'
arch=('x86_64')
url="https://mercurygram.org/"
license=('GPL-3.0-or-later WITH OpenSSL-exception')
depends=(
  'abseil-cpp'
  'ada'
  'cairo'
  'ffmpeg'
  'fontconfig'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'hunspell'
  'kcoreaddons'
  'libavif'
  'libfido2'
  'libgcc'
  'libheif'
  'libjpeg-turbo'
  'libjxl'
  'libpipewire'
  'libsrtp'
  'libstdc++'
  'libvpx'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxtst'
  'lz4'
  'minizip'
  'openal'
  'openh264'
  'openssl'
  'opus'
  'pango'
  'pipewire'
  'qt6-base'
  'qt6-declarative'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-wayland'
  'qt6-webchannel'
  'qt6-webengine'
  'rnnoise'
  'tlottie'
  'xxhash'
  'zlib'
)
makedepends=(
  'boost'
  'boost-libs'
  'cargo'
  'cmake'
  'git'
  'glib2-devel'
  'gobject-introspection'
  'just'
  'qt6-shadertools'
  'gperf'
  'libtg_owt'
  'microsoft-gsl'
  'ninja'
  'python'
  'range-v3'
  'tl-expected'
  'vulkan-headers'
)
optdepends=(
  'geoclue: geoinformation support'
  'crow-translate: translation provider'
  'xdg-desktop-portal: desktop integration'
)
source=(
  "${pkgname%-git}"::"git+https://github.com/Mercurygram/mdesktop.git"
  "${pkgname%-git}_tdlib"::"git+https://github.com/tdlib/td.git"
  # wallet-engine is vendored because tdesktop requires a massive patch against it.
  "${pkgname%-git}_wallet_engine"::"git+https://github.com/i582/wallet-engine.git"
  "${pkgname%-git}_patches"::"git+https://github.com/desktop-app/patches.git"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# tde2e, wallet-engine and desktop-app/patches pins from snap/snapcraft.yaml
_snap_commit() {
  awk -v part="  $1:" '$0 == part { f = 1; next }
    f && /^  [^ ]/ { exit }
    f && $1 == "source-commit:" { print $2; exit }' \
    "$srcdir/${pkgname%-git}/snap/snapcraft.yaml"
}

_checkout_pin() {
  local commit
  commit=$(_snap_commit "$2")
  git -C "$srcdir/$1" -c advice.detachedHead=false checkout -qf "${commit:?no $2 pin in snapcraft.yaml}"
  git -C "$srcdir/$1" clean -qfdx
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  git submodule update --init --recursive --depth=1

  _checkout_pin "${pkgname%-git}_tdlib" tde2e
  _checkout_pin "${pkgname%-git}_patches" patches
  _checkout_pin "${pkgname%-git}_wallet_engine" wallet-engine
  cd "$srcdir/${pkgname%-git}_wallet_engine"
  patch -Np1 -i "$srcdir/${pkgname%-git}_patches/wallet-engine.patch"
}

build() {
  cd "${pkgname%-git}_wallet_engine"
  just build
  just bindings-cpp
  install -Dm644 target/release/libwallet_engine.a -t install/lib/
  install -Dm644 bindings/cpp-experimental/* -t install/include/wallet_engine/
  cd ..

  cmake -S "$srcdir/${pkgname%-git}_tdlib" -B "${pkgname%-git}_tdlib/build" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="$PWD/${pkgname%-git}_tdlib/install" \
    -Wno-author \
    -DTD_E2E_ONLY=ON
  cmake --build "${pkgname%-git}_tdlib/build"
  cmake --install "${pkgname%-git}_tdlib/build"

  cmake -B build -S "$srcdir/${pkgname%-git}" -G Ninja \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Dtde2e_DIR="$PWD/${pkgname%-git}_tdlib/install/lib/cmake/tde2e" \
    -DCMAKE_PREFIX_PATH="$PWD/${pkgname%-git}_wallet_engine/install" \
    -DCMAKE_BUILD_TYPE=None \
    -DDESKTOP_APP_USE_QTWEBENGINE=ON \
    -DTDESKTOP_API_ID=575730 \
    -DTDESKTOP_API_HASH=723c7927097f8487d229438af766e329
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
