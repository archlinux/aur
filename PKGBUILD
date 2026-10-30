##Copied from official telegram-desktop PKGBUILD.
##If you spot any issues, please don't hesitate to email me.
##Email: pony at just-a-pony dot net
pkgname=yukigram-desktop
pkgver=7.3.3.1
pkgrel=1
pkgdesc='A patch-based Telegram Desktop fork, minus the bullshit, plus the features'
arch=('x86_64')
url="https://github.com/yukigram/yukigram"
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
  'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1 (gtk3)'
  'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (gtk4)'
  'xdg-desktop-portal: desktop integration'
)

_td_commit=c15d3f5a5de6e3ba5839822c451152e5e18bb700
_wallet_engine_ver=0.0.7
source=(
  "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver%.*}/tdesktop-${pkgver%.*}-full.tar.gz"
  "git+https://github.com/tdlib/td.git#tag=${_td_commit}"
  wallet-engine-${_wallet_engine_ver}.tar.gz::https://github.com/i582/wallet-engine/archive/refs/tags/v${_wallet_engine_ver}.tar.gz
  "https://github.com/yukigram/yukigram/archive/refs/tags/v${pkgver}.tar.gz"
  https://github.com/desktop-app/patches/raw/refs/heads/master/wallet-engine.patch
  "0000-Fix-Pony-fix-lang-res-file-loc.patch"
)

sha512sums=('3e76971f5ac1c8b4f29c867cf2a6e52f5eb71e479533daaaef26ba8bf53c10c6dd0abc09bb99ec213582546a50fa5306b2bcad023e85024979ebf04603c48540'
            'dd4741b3621c5e76ba7c9eee44ffd41b1e6b6c24fdb19988efd780d307aff79a9dcfd710be9ad63db6857cbbd71c273c54d82be524a5326fc22f1233d9eb6ca2'
            'f1a38de20459c5b780c98aaab037fdf34357980e7f3b93c4b523636d016ca4ffc9d9679c2ee4a246b138ef0474b8190d2db1874b204c006b0f30b3c950c62ff6'
            'bc0f209f205fcfb08b0867f93b55f7896d67f014cf00b9fa2bf53b6c9892ac1f26d92293eaf6ddbb2fc0ff87e9c7826812e0f83f764dabe502a2a3c9d004e232'
            '79460145f706d3eb244335700a30be2e6862db2bcda042244cf45ec5227956130a366c54a4240167327e33fde4c9fa671305a7f942acedd17e994d24e0612a2b'
            '392c4ca2a7b6dc276a49f5281949ec4f96707c881113441c1c717e5fd6cc689a85634a49bbd6f55150d09340be298cb25bf2b5d54b1a2fe87b5baa87f1c0ea72')


prepare() {
  cd "$srcdir"/tdesktop-${pkgver%.*}-full/
  for p in "$srcdir"/yukigram-${pkgver}/tdesktop/cur/*.patch;do
    patch -Np1 <"$p"
  done
  patch -Np1 < "$srcdir"/0000-Fix-Pony-fix-lang-res-file-loc.patch
  
  cd "$srcdir"/wallet-engine-${_wallet_engine_ver}
  patch -Np1 -i "$srcdir"/wallet-engine.patch
}

build() {
  export CMAKE_BUILD_PARALLEL_LEVEL=${MAKEFLAGS#-j}
  
  cd wallet-engine-${_wallet_engine_ver}
  just build
  just bindings-cpp
  install -Dm644 target/release/libwallet_engine.a -t install/lib/
  install -Dm644 bindings/cpp-experimental/* -t install/include/wallet_engine/
  cd ..

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
    -DCMAKE_PREFIX_PATH="$PWD/wallet-engine-${_wallet_engine_ver}/install" \
    -DCMAKE_BUILD_TYPE=Release \
    -DTDESKTOP_API_ID=611335 \
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
