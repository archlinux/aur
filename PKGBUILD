##Copied from official telegram-desktop PKGBUILD.
##If you spot any issues, please don't hesitate to email me.
##Email: pony at just-a-pony dot net
pkgname=yukigram-desktop
pkgver=6.7.8
pkgrel=0
pkgdesc='A patch-based Telegram Desktop fork,with features from 64Gram'
arch=('x86_64')
url="https://github.com/yukigram/yukigram"
license=('GPL3')
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
  'libdispatch'
  'libgcc'
  'libheif'
  'libjxl'
  'libstdc++'
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
  'zlib'
)
makedepends=(
  'boost'
  'boost-libs'
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
  'crow-translate: translation provider'
  'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
  'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
  'xdg-desktop-portal: desktop integration'
)


_td_commit=6d74326c5ce53aeb52496f157f0080d9b8515970
source=(
  "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
  "git+https://github.com/tdlib/td.git#tag=${_td_commit}"
  tdesktop-fix-minizip-includes.patch
  #"https://github.com/yukigram/yukigram/archive/refs/tags/v${pkgver}.${pkgrel}.tar.gz"
  "https://github.com/yukigram/yukigram/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=(
  '19a9f5076597217d96acd566a5dbff5004ee128b69c7616ae6e593da3bc8ee813daed5566540602f108fad22edefa5c3f6ad782d196f86255333f50677e6b050'
  SKIP
  'd9765588e92f154d83b95dc2840207bf22b26b6ca37b4d5cdfdb5e27a00c9e1ebcc9cd475a96bbcc5b02c24f6892320e009f843aa6b172a1820814b952a772eb'
  'fce0be1a9d332e16dc4c704234a9773c8a3102e3c746edc52ddd156bac534fc68f999a99ed41cc306708417957f9ed0cdbbd31734f3ba4385522055cc44ec82e'
)


prepare() {
  cd tdesktop-$pkgver-full/
  patch -Np1 -d Telegram/lib_base -i "$srcdir"/tdesktop-fix-minizip-includes.patch
  #cat "$srcdir"/yukigram-${pkgver}.${pkgrel}/tdesktop/cur/*.patch | patch -Np1
  cat "$srcdir"/yukigram-${pkgver}/tdesktop/cur/*.patch | patch -Np1
}

build() {
  export CMAKE_BUILD_PARALLEL_LEVEL=${MAKEFLAGS#-j}
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
    -DTDESKTOP_API_ID=611335 \
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
