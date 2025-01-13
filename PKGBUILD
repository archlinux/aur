# Maintainer: envolution
# Contributor: David Garfias <dgarfiasme at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=libaemu
_pkgname=aemu
pkgdesc="This is an utility library for common functions used in the Android Emulator."
license=("Apache-2.0")
pkgver=0.1.2
pkgrel=5
arch=("x86_64")
url="https://android.googlesource.com/platform/hardware/google/aemu/"
source=("git+https://android.googlesource.com/platform/hardware/google/aemu#tag=v${pkgver}-aemu-release")
sha256sums=('a971602ce7397fa13587a0c9d9cc38e4c0725110881d4a8520bed48f014da019')
makedepends=(
  cmake
  git
  clang
  gcc-libs
  glibc)

prepare() {
  cd "$_pkgname"
  mkdir build
}

build() {
  cd "$_pkgname"
  cmake -B build \
    -DCMAKE_C_COMPILER=/usr/bin/clang \
    -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DAEMU_COMMON_GEN_PKGCONFIG=ON \
    -DAEMU_COMMON_BUILD_CONFIG=gfxstream \
    -DENABLE_VKCEREAL_TESTS=OFF \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build -j
}
package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
# vim:set ts=2 sw=2 et:
