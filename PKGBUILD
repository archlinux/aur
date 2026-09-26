# Maintainer: killerwolf <aur26 at killerwolf dott de>

pkgname=shadevk-git
_name=shadevk
pkgver=v0.0.1.r9.g5b006dc
pkgrel=1
pkgdesc='A cross-platform pixel shader viewer for Vulkan, written in C23'
arch=('x86_64' 'aarch64')
url='https://codeberg.org/literallylara/ShadeVk'
license=('GPL-3.0-only')
depends=(
  'glfw'
  'glslang'
  'shader-slang'
  'directx-shader-compiler'
  'vulkan-icd-loader'
  'vulkan-validation-layers'
  'hicolor-icon-theme'
)
makedepends=(
  'cmake' 'git' 'ninja' 'clang'
  'vulkan-headers' 'vulkan-utility-libraries'
)
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=(
  'git+https://codeberg.org/literallylara/ShadeVk.git'
  'shadevk.desktop'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/ShadeVk/"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/ShadeVk/"

  git submodule update --init --recursive -- ./third_party/cwalk
  git submodule update --init --recursive -- ./third_party/dmon
  git submodule update --init --recursive -- ./third_party/log.c
  git submodule update --init --recursive -- ./third_party/whereami

  cmake -G Ninja -B build \
    -D CMAKE_C_COMPILER=clang \
    -D CMAKE_CXX_COMPILER=clang++ \
    -D SVK_LIB_DEFAULT=system
  find . -type f -exec sed -i 's,#include <slang/,#include <shader-slang/,g' {} +
  cmake --build build --target shadevk
}

package() {
  install -Dm644 shadevk.desktop "$pkgdir/usr/share/applications/shadevk.desktop"
  cd "$srcdir/ShadeVk/"
  DESTDIR="$pkgdir" cmake --install build --prefix /usr
  install -Dm644 assets/logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/shadevk.png"
}
