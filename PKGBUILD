##Copied from official telegram-desktop PKGBUILD.
##If you spot any issues, please don't hesitate to email me.
##Email: pony at just-a-pony dot net
pkgname=yukigram-desktop
pkgver=7.0.6.0
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

sha512sums=('dff323953fe6c07dbd3f5fcbf942e8311625ddc3c57593b41412bc8ab7d7c8ac0706b34402cf07ace899103ff1ba3fe6048c913f985632f6011befee3c50aa07'
            'd622b8f3580ee49415546d025c4ba45f5b2de50b315fc379dc57c0427c5f815c7cc3820cca937c12182ee461641bb61f87ebc99b6c74a1a666cea9a08f0f41a0'
            '14e5844c8e342397cff3c495038921dc534b09becd9ffc55dd759c3aa548207c3c157a45e8487e35feed79a58fd1aeb4d4f5ab71a0d25f4b880d2ef0a581d036'
            '392c4ca2a7b6dc276a49f5281949ec4f96707c881113441c1c717e5fd6cc689a85634a49bbd6f55150d09340be298cb25bf2b5d54b1a2fe87b5baa87f1c0ea72')


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
