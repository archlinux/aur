# Maintainer: Dmitry Valter <`echo ZHZhbHRlciA8YXQ+IHByb3Rvbm1haWwgPGRvdD4gY29tCg== | base64 -d`>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

# Based on official PKGBUILD from Arch Linux with an annoying bug reverted
pkgname=telegram-desktop-kdefix
pkgver=7.3.1
_td_commit=c15d3f5a5de6e3ba5839822c451152e5e18bb700
_wallet_engine_ver=0.0.7
pkgrel=1
pkgdesc='Telegram Desktop client with KDE unread counter bug reverted'
arch=('x86_64')
url="https://desktop.telegram.org/"
conflicts=('telegram-desktop')
provides=('telegram-desktop')
options=('!debug')
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
source=(
  "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
  "git+https://github.com/tdlib/td.git#commit=${_td_commit}"
  # We're vendoring wallet-engine because tdesktop requires a massive patch against it.
  wallet-engine-${_wallet_engine_ver}.tar.gz::https://github.com/i582/wallet-engine/archive/refs/tags/v${_wallet_engine_ver}.tar.gz
  https://github.com/desktop-app/patches/raw/refs/heads/master/wallet-engine.patch
  0001-kde-theme-injection-fix.patch
)
sha512sums=('da4d47678692a01acf8b84ce66a8530897853b2b94c9e77b40a3d179fd1657a08b9fd6cfc6999490cf77f0dbb9bae39e774374b391d0a85cf3318429bcd2a0bb'
            'dd4741b3621c5e76ba7c9eee44ffd41b1e6b6c24fdb19988efd780d307aff79a9dcfd710be9ad63db6857cbbd71c273c54d82be524a5326fc22f1233d9eb6ca2'
            'f1a38de20459c5b780c98aaab037fdf34357980e7f3b93c4b523636d016ca4ffc9d9679c2ee4a246b138ef0474b8190d2db1874b204c006b0f30b3c950c62ff6'
            '79460145f706d3eb244335700a30be2e6862db2bcda042244cf45ec5227956130a366c54a4240167327e33fde4c9fa671305a7f942acedd17e994d24e0612a2b'
            '6544086fd4946384509c053edd447a59e9ae405af65f9a7fa632ae5734099ef57b7211b7dbebf7a0c38665e05dd7c4d2414fa5d2cb5c6ee718cc5e824f5f509a')

prepare() {
  # Fix tray unread counter in KDE
  patch -d "tdesktop-$pkgver-full" -Np1 -i ../0001-kde-theme-injection-fix.patch

  cd wallet-engine-${_wallet_engine_ver}
  patch -Np1 -i "$srcdir"/wallet-engine.patch
}

build() {
  # Build wallet-engine
  cd wallet-engine-${_wallet_engine_ver}
  just build
  just bindings-cpp
  install -Dm644 target/release/libwallet_engine.a -t install/lib/
  install -Dm644 bindings/cpp-experimental/* -t install/include/wallet_engine/
  cd ..

  # Build td
  cmake -S td -B td/build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="$PWD/td/install" \
    -Wno-dev \
    -DTD_E2E_ONLY=ON
  cmake --build td/build
  cmake --install td/build

  # Build tdesktop

  # Turns out we're allowed to use the official API key that telegram uses for
  # their snap builds:
  # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
  # Thanks @primeos!
  cmake -B build -S tdesktop-$pkgver-full -G Ninja \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Dtde2e_DIR="$PWD/td/install/lib/cmake/tde2e" \
    -DCMAKE_PREFIX_PATH="$PWD/wallet-engine-${_wallet_engine_ver}/install" \
    -DCMAKE_BUILD_TYPE=None \
    -DTDESKTOP_API_ID=611335 \
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
