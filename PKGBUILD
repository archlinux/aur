# Maintainer: omansh-krishn <omanshkrishn@duck.com>
# Previous Maintainer: westpain <homicide@disroot.org>

pkgname=materialgram-git
_name=materialgram
pkgver=5.15.2.1.r7.g231569ff70
pkgrel=1
pkgdesc='Telegram Desktop based messenger with Material Design and additional features'
arch=('x86_64' 'aarch64')
url="https://github.com/kukuruzka165/materialgram"
license=('GPL3.0-or-later WITH OpenSSL-exception')
depends=(
  'abseil-cpp'
  'ada'
  'ffmpeg'
  'glib2'
  'hicolor-icon-theme'
  'hunspell'
  'kcoreaddons'
  'libavif'
  'libdispatch'
  'libheif'
  'libjxl'
  'libxcomposite'
  'libxdamage'
  'libxrandr'
  'libxtst'
  'lz4'
  'minizip'
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
makedepends=(
  'boost'
  'cmake'
  'git'
  'glib2-devel'
  'gobject-introspection'
  'gperf'
  'libtg_owt'
  'microsoft-gsl'
  'ninja'
  'python'
  'range-v3'
  'tl-expected'
)
optdepends=(
  'geoclue: geoinformation support'
  'geocode-glib-2: geocoding support'
  'geocode-glib: geocoding support'
  'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
  'webkit2gtk: embedded browser features provided by webkit2gtk'
  'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
  'xdg-desktop-portal: desktop integration'
)
provides=('materialgram' 'materialgram=${pkgver}')
conflicts=('materialgram' 'materialgram-bin')
options=(!debug)

source=("${_name}::git+https://github.com/kukuruzka165/${_name}.git"
        "td::git+https://github.com/tdlib/td.git#branch=master")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
    git -C "${srcdir}/materialgram" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    _tdlib_commit=$(awk 'BEGIN{RS=""; FS="\n"} /git remote add origin https:\/\/github.com\/tdlib\/td.git/ {for(i=1;i<=NF;i++) if(match($i,/[0-9a-f]{40}/,a)) {print a[0]; exit}}' "${srcdir}/materialgram/Telegram/build/docker/centos_env/Dockerfile")
    git -C "${srcdir}/td" checkout ${_tdlib_commit}
    git -C "${srcdir}/materialgram" submodule update --init --recursive
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'

    cmake -S td -B td/build \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX="$PWD/td/install" \
      -Wno-dev \
      -DTD_E2E_ONLY=ON
    cmake --build td/build
    cmake --install td/build

    cmake -B build -S materialgram -G Ninja \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -Dtde2e_DIR="$PWD/td/install/lib/cmake/tde2e" \
      -DCMAKE_BUILD_TYPE=Release \
      -DTDESKTOP_API_ID=2040 \
      -DTDESKTOP_API_HASH=b18441a1ff607e10a989891a5462e627
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
