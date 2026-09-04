# Maintainer: Timothy Redaelli <timothy@fsfe.org>

# Based on telegram-desktop PKGBUILD
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

pkgname=mercurygram-desktop
pkgver=7.1.5.1
_td_commit=bc9c263e2bfee06aaab41e82db51a103376030bc
pkgrel=1
pkgdesc='Privacy-focused Telegram Desktop fork'
arch=('x86_64')
url="https://mercurygram.org/"
license=('GPL-3.0-or-later WITH OpenSSL-exception')
depends=(
  'abseil-cpp'
  'ada'
  'ffmpeg'
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
  'pipewire'
  'qt6-base'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-wayland'
  'rnnoise'
  'xxhash'
  'zlib'
)
makedepends=(
  'boost'
  'boost-libs'
  'cmake'
  'git'
  'glib2-devel'
  'gobject-introspection'
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
  'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1 (gtk3)'
  'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (gtk4)'
  'xdg-desktop-portal: desktop integration'
)
source=(
  "https://github.com/Mercurygram/mdesktop/releases/download/v${pkgver}/Mercurygram-${pkgver}-source-full.tar.gz"
  "git+https://github.com/tdlib/td.git#commit=${_td_commit}"
)
sha512sums=('9ee64f75c4261afebe30317eaaeb63e66cac0b7cf16973a621a16444596e50ae9f4427af6951f0bb7c4ff2fcb7ed713406a1019a6cb7c198714ff514b88091b9'
            '12d3b77dbb2a7b7deaef0e173626b9d16acfbdde5b1df4bd58a70a7541a5d8032f25ecbc14604b0e47aa3d6d76704c56409d432717412c6046efebd0ab6180f1')

build() {
  cmake -S td -B td/build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="$PWD/td/install" \
    -Wno-dev \
    -DTD_E2E_ONLY=ON
  cmake --build td/build
  cmake --install td/build

  cmake -B build -S tdesktop-$pkgver-full -G Ninja \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Dtde2e_DIR="$PWD/td/install/lib/cmake/tde2e" \
    -DCMAKE_BUILD_TYPE=Release \
    -DTDESKTOP_API_ID=575730 \
    -DTDESKTOP_API_HASH=723c7927097f8487d229438af766e329
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
