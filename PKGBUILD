# Maintainer: Timothy Redaelli <timothy@fsfe.org>

# Based on telegram-desktop PKGBUILD
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

pkgname=mercurygram-desktop
pkgver=7.3.2.1
# tde2e, wallet-engine and desktop-app/patches pins from snap/snapcraft.yaml
# at the v${pkgver} tag.
_td_commit=51743dfd01dff6179e2d8f7095729caa4e2222e9
_wallet_engine_commit=e59e0d89d7ee90c388bf36e3334c5b276f396697
_patches_commit=fe957833b84525e634a8d776a7f834ed536d9a21
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
  "https://github.com/Mercurygram/mdesktop/releases/download/v${pkgver}/Mercurygram-${pkgver}-source-full.tar.gz"
  "git+https://github.com/tdlib/td.git#commit=${_td_commit}"
  # wallet-engine is vendored because tdesktop requires a massive patch against it.
  "wallet-engine-${_wallet_engine_commit}.tar.gz::https://github.com/i582/wallet-engine/archive/${_wallet_engine_commit}.tar.gz"
  "wallet-engine-${_patches_commit}.patch::https://github.com/desktop-app/patches/raw/${_patches_commit}/wallet-engine.patch"
)
sha512sums=('05108dced96a481492f4caeb62ff2d1777675b76efc304794043f49c96a0ecf90c6e0b9b88fd0f587a25858afd75b96448c1dcba9c9ef6abf5405fd8b3ddb82f'
            'd622b8f3580ee49415546d025c4ba45f5b2de50b315fc379dc57c0427c5f815c7cc3820cca937c12182ee461641bb61f87ebc99b6c74a1a666cea9a08f0f41a0'
            '750a03d429e838b80068c8f608cf7ce3d6550a914b33fd4e1300b6d3eb1e4be7dbcc798b1a998f41930c45efbab147938eb9e257694b19e495f9642838151686'
            '79460145f706d3eb244335700a30be2e6862db2bcda042244cf45ec5227956130a366c54a4240167327e33fde4c9fa671305a7f942acedd17e994d24e0612a2b')

prepare() {
  cd wallet-engine-${_wallet_engine_commit}
  patch -Np1 -i "$srcdir"/wallet-engine-${_patches_commit}.patch
}

build() {
  cd wallet-engine-${_wallet_engine_commit}
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

  cmake -B build -S tdesktop-$pkgver-full -G Ninja \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Dtde2e_DIR="$PWD/td/install/lib/cmake/tde2e" \
    -DCMAKE_PREFIX_PATH="$PWD/wallet-engine-${_wallet_engine_commit}/install" \
    -DCMAKE_BUILD_TYPE=None \
    -DDESKTOP_APP_USE_QTWEBENGINE=ON \
    -DTDESKTOP_API_ID=575730 \
    -DTDESKTOP_API_HASH=723c7927097f8487d229438af766e329
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
