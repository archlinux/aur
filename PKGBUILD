# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Xentec <xentec@aix0.eu>
# Contributor: Scott Linder <scott.linder18@gmail.com>

pkgname=entityx
pkgver=1.3.0
pkgrel=4
pkgdesc='Fast, type-safe C++ Entity-Component system'
arch=(x86_64)
url='https://github.com/alecthomas/entityx'
license=(MIT)
makedepends=(cmake git ninja catch2-v2)
source=("git+$url#commit=6389b1f91598c99d85e56356fb57d9f4683071d8") # tag: 1.3.0
b2sums=(SKIP)

prepare() {
  cd $pkgname
  git cherry-pick -n 015ae4ffb08d870d879b4ec5b71fdb261398b170

  # Unbundle catch2 to fix build with glibc 2.35
  rm entityx/3rdparty/catch.hpp
  ln -s /usr/include/catch2/catch.hpp entityx/3rdparty/
}

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_CXX_STANDARD=11 \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D ENTITYX_BUILD_SHARED=1 \
    -D ENTITYX_BUILD_TESTING=1 \
    -G Ninja \
    -S $pkgname \
    -W no-dev
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 $pkgname/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 $pkgname/cmake/FindEntityX.cmake \
    "$pkgdir/usr/share/cmake-3.3/Modules/FindEntityX.cmake"
}
