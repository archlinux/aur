##Copied from official telegram-desktop PKGBUILD.
##If you spot any issues, please don't hesitate to email me.
##Email: pony at just-a-pony dot net
pkgname=yukigram-desktop
pkgver=7.0.2.0
pkgrel=1
pkgdesc='A patch-based Telegram Desktop fork,with features from 64Gram'
arch=('x86_64')
url="https://github.com/yukigram/yukigram"
license=('GPL3')
depends=(
  'abseil-cpp'
  'ada'
  'cmark-gfm'
  'ffmpeg'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'hunspell'
  'kcoreaddons'
  'libavif'
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
  'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1 (gtk3)'
  'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (gtk4)'
  'xdg-desktop-portal: desktop integration'
)
install="yukigram-desktop.install"

_td_commit=51743dfd01dff6179e2d8f7095729caa4e2222e9
source=(
  "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver%.*}/tdesktop-${pkgver%.*}-full.tar.gz"
  "git+https://github.com/tdlib/td.git#tag=${_td_commit}"
  "https://github.com/yukigram/yukigram/archive/refs/tags/v${pkgver}.tar.gz"
  "0000-Fix-Pony-fix-lang-res-file-loc.patch"
)

sha512sums=(
  'e3a99396dc710fb08aa6709904a9558aeb6953a160c23ccc1df00e4df5e1a1592145667c780fab676abe092848a6ec517981a25c35711e765769940218dd2a89'
  'd622b8f3580ee49415546d025c4ba45f5b2de50b315fc379dc57c0427c5f815c7cc3820cca937c12182ee461641bb61f87ebc99b6c74a1a666cea9a08f0f41a0'
  '54d10d334ca63a0a724bf3b2121139767a0d01c0c4a7a5fb7f1c94f1577be112ca31e449f9cb74bea1d438e2079665cac36b315ba22594d11d19caeaedf30593'
  '392c4ca2a7b6dc276a49f5281949ec4f96707c881113441c1c717e5fd6cc689a85634a49bbd6f55150d09340be298cb25bf2b5d54b1a2fe87b5baa87f1c0ea72'
)


prepare() {
  cd tdesktop-${pkgver%.*}-full/
  for p in "$srcdir"/yukigram-${pkgver}/tdesktop/cur/*.patch;do
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


  cmake -B build -S tdesktop-${pkgver%.*}-full -G Ninja \
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
