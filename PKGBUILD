##Copied from official telegram-desktop PKGBUILD.
##If you spot any issues, please don't hesitate to email me.
##Email: pony at just-a-pony dot net
pkgname=yukigram-desktop
pkgver=6.7.5
pkgrel=2
pkgdesc='A Fork of 64Gram,A Telegram Desktop fork'
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
  "https://github.com/yukigram/yukigram/archive/refs/tags/v6.7.5.2.tar.gz"
)

sha512sums=(
  '1072ae1d527cc0b894cbb06b4700a886e8907b222fc5960efe9d016fe73c08f22e4d3cddd42c51284d2c70b64151542020f6dafdd0f1b81d670ca6560bf79cc3'
  SKIP
  'd9765588e92f154d83b95dc2840207bf22b26b6ca37b4d5cdfdb5e27a00c9e1ebcc9cd475a96bbcc5b02c24f6892320e009f843aa6b172a1820814b952a772eb'
  '106fe2a89e331d3feda12c3d5b03f001e6d0935ad618fdca2acedd509c6949be6bc59734402e2372d2580e67796a022bbc4005a99a16e40613a099d38efec062'
)


prepare() {
  cd tdesktop-$pkgver-full/
  patch -Np1 -d Telegram/lib_base -i "$srcdir"/tdesktop-fix-minizip-includes.patch
  cat "$srcdir"/yukigram-6.7.5.2/tdesktop/cur/*.patch | patch -Np1
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
