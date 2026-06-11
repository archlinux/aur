##Copied from official telegram-desktop PKGBUILD.
##If you spot any issues, please don't hesitate to email me.
##Email: pony at just-a-pony dot net
pkgname=yukigram-desktop
pkgver=6.9.1
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
  'qt6-shadertools'
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
install="yukigram-desktop.install"

_td_commit=49b3bcbb6bfebf2ed44dd9f25102d2e1a94a58c4
source=(
  "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
  "git+https://github.com/tdlib/td.git#tag=${_td_commit}"
  "https://github.com/yukigram/yukigram/archive/refs/tags/v${pkgver}.${pkgrel}.tar.gz"
  "0000-Fix-Pony-fix-lang-res-file-loc.patch"
)

sha512sums=(
  'e9f7d4d0db3ea11a34595afd37c3a17dced20c37c5ce0f37ed9996f053cbbfa183245f09c6e7980255a0961394f3e6e198b1f06eb74ef1ce4561c22aa1fb4ed8'
  SKIP
  'a7b70cac362353053de18f45737f51da340b37222aebf289cc2339df46f0b90b12cf3454e77014eabc2984c1229071d802127abfe18f0656b178016f5de541b0'
  '392c4ca2a7b6dc276a49f5281949ec4f96707c881113441c1c717e5fd6cc689a85634a49bbd6f55150d09340be298cb25bf2b5d54b1a2fe87b5baa87f1c0ea72'
)


prepare() {
  cd tdesktop-$pkgver-full/
  for p in "$srcdir"/yukigram-${pkgver}.${pkgrel}/tdesktop/cur/*.patch;do
    patch -Np1 <"$p"
  done
  patch -Np1 < "$srcdir"/0000-Fix-Pony-fix-lang-res-file-loc.patch
}

build() {
  echo $PWD
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
  ln -s "$pkgdir"/usr/bin/io.github.yukigram "$pkgdir"/usr/bin/yukigram
}
