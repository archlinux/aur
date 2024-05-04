# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=displaz-git
pkgdesc='A hackable LIDAR viewer (Git version)'
pkgver=0.4.0.r107.g91ecf30
pkgrel=1
url='http://c42f.github.io/displaz/'
license=('BSD')
arch=('x86_64')

depends=('glew' 'libLASlib.so' 'libglvnd' 'qt5-base')
makedepends=('cmake' 'git' 'imath' 'python-docutils')

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
  cd displaz/src/render
  sed -i '/#include <string>/a #include <vector>' FrameRate.h
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
