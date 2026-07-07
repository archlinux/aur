# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=displaz-git
pkgdesc='A hackable LIDAR viewer (Git version)'
pkgver=0.4.0.r144.gc767a06
pkgrel=1
url='http://c42f.github.io/displaz/'
license=('BSD-3-Clause')
arch=('x86_64')

depends=(
  bash
  glew
  glibc
  libgcc
  libglvnd
  libLASlib.so
  libstdc++
  qt5-base
)
makedepends=(
  cmake
  git
  imath
)

source=(
  'git+https://github.com/c42f/displaz.git'
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd displaz
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -i -e 's/Imath-3_1/Imath-3_2/' displaz/cmake/FindImath.cmake
}

build() {
  cmake -B build -S displaz \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
		-DLASLIB_INCLUDE_DIRS=/usr/include/LASlib \
        -DDISPLAZ_EMBED_GLEW=False \
        -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd displaz
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
