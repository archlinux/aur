# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=lichii-git
pkgver=0.r30442.g0ab7736
pkgrel=1
pkgdesc='VERY experimental Nintendo Switch 2 emulator'
arch=('x86_64')
url='https://github.com/zortos293/Lichii'
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
provides=('lichii')
conflicts=('lichii')
source=("lichii::git+https://github.com/zortos293/Lichii.git#branch=nx2")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/lichii"
  printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -S "$srcdir/lichii" -B "$srcdir/build" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_QT=ON \
    -DENABLE_UPDATE_CHECKER=OFF \
    -DYUZU_CMD=OFF \
    -DYUZU_ROOM=OFF \
    -DYUZU_USE_BUNDLED_QT=OFF \
    -DYUZU_USE_BUNDLED_SDL3=OFF \
    -DYUZU_USE_BUNDLED_FFMPEG=OFF \
    -DYUZU_TESTS=OFF \
    -DBUILD_TESTING=OFF \
    -DENABLE_WERROR=OFF
  cmake --build "$srcdir/build" --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
