##Copied from official telegram-desktop PKGBUILD.
##If you spot any issues, please don't hesitate to email me.
##Email: pony at just-a-pony dot net
pkgname=yukigram-desktop
pkgver=6.8.2
pkgrel=2
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


_td_commit=49b3bcbb6bfebf2ed44dd9f25102d2e1a94a58c4
source=(
  "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
  "git+https://github.com/tdlib/td.git#tag=${_td_commit}"
  tdesktop-fix-minizip-includes.patch
  "https://github.com/yukigram/yukigram/archive/refs/tags/v${pkgver}.${pkgrel}.tar.gz"
)

sha512sums=(
  'a733992a12268ee4d429ed383f63182c12e3a5d61d78e0f31cbfc705a5a36cb872a2f2dfb6c76d50a22ed46d141b9c13f80da4ab94286fe35b339ca685d954e3'
  SKIP
  'd9765588e92f154d83b95dc2840207bf22b26b6ca37b4d5cdfdb5e27a00c9e1ebcc9cd475a96bbcc5b02c24f6892320e009f843aa6b172a1820814b952a772eb'
  '0087976e0f251023b03267e041a640c23cc967aa22a210202df59a56625f5eadef5d2a6b18068675dc9006c60ef281cb28cb8c9bae316998a5b3c6d7468ca786'
)


prepare() {
  cd tdesktop-$pkgver-full/
  patch -Np1 -d Telegram/lib_base -i "$srcdir"/tdesktop-fix-minizip-includes.patch

  for p in "$srcdir"/yukigram-${pkgver}.${pkgrel}/tdesktop/cur/*.patch;do
    patch -Np1 <"$p"
  done
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
