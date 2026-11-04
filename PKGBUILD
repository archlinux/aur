# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: AntiApple4life <antiapple at antiapple dot net>

pkgname=eglantine-git
pkgver=0.r29964.g55cb315
pkgrel=1
pkgdesc='Nintendo Switch emulator (development branch)'
arch=('x86_64')
url='https://github.com/Djihads80/Eglantine'
license=('GPL-3.0-or-later')
depends=(
  'enet'
  'ffmpeg'
  'libusb'
  'opus'
  'openssl'
  'qt6-base'
  'qt6-charts'
  'sdl3'
  'vulkan-icd-loader'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'glslang'
  'libzip'
  'lz4'
  'ninja'
  'nlohmann-json'
  'opus'
  'qt6-base'
  'qt6-charts'
  'spirv-headers'
  'spirv-tools'
  'vulkan-headers'
  'vulkan-utility-libraries'
  'xbyak'
  'zlib'
  'zstd'
)
optdepends=(
  'qt6-wayland: native Wayland support'
)
provides=('eglantine')
conflicts=('eglantine')
source=("eglantine::git+https://github.com/Djihads80/Eglantine.git#branch=nx2")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/eglantine"
  printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -S "$srcdir/eglantine" -B "$srcdir/build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_QT=ON \
    -DENABLE_UPDATE_CHECKER=OFF \
    -DYUZU_CMD=ON \
    -DYUZU_ROOM=OFF \
    -DYUZU_USE_BUNDLED_QT=OFF \
    -DYUZU_USE_BUNDLED_SDL3=OFF \
    -DYUZU_USE_BUNDLED_FFMPEG=OFF \
    -DYUZU_TESTS=OFF \
    -DBUILD_TESTING=OFF
  cmake --build "$srcdir/build" --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"

  # The desktop entry uses the Eglantine icon name; the upstream install uses
  # the older Eden filename, so install an alias that matches the desktop file.
  install -Dm644 "$srcdir/eglantine/dist/dev.eden_emu.eden.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.eglantine.eglantine.svg"
}
