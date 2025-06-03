# Maintainer: Benjamin Valdez <b.valdez.0509+aur<at>gmail.com>
# Contributor: Bruce Zhang <zttt183525594<at>gmail.com>
pkgname=input-actions
pkgver=0.6.1
pkgrel=1
pkgdesc="Mouse and touchpad gestures for Plasma 6 Wayland"
arch=('x86_64')
url="https://github.com/taj-ny/InputActions"
license=('GPL-3.0-or-later')
depends=('kwin' 'yaml-cpp' 'kcmutils' 'gcc-libs' 'qt6-base' 'glibc' 'kcoreaddons' 'ki18n')
checkdepends=('gtest' 'cmake')
makedepends=('extra-cmake-modules' 'cmake')
source=("$pkgname-$pkgver.src.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('458871ca8e597b261426e77f38830bed503cfc45727e1d284e02d53d1c62f0f5')

build() {
  local cmake_options=(
    -B build
    -S "InputActions-$pkgver"
    -W no-dev
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D BUILD_TESTS=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  local ctest_flags=(
    --test-dir build
    # show the stdout and stderr when the test fails
    --output-on-failure
    # execute tests in parallel
    --parallel $(nproc)
  )
  ctest "${ctest_flags[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
