# Maintainer: Alexey Andreyev <aa13q@ya.ru>

_gitname=libqmatrixclient
pkgname=qt5-matrixclient-git
pkgver=r1286.02872ea
pkgrel=1
pkgdesc="A Qt5 library to write cross-platfrom clients for Matrix."
arch=(i686 x86_64 armv7 aarch64)
url="https://matrix.org/docs/projects/sdk/libqmatrixclient.html"
license=(LGPLv2.1)
depends=(qt5-base)
makedepends=(cmake git sed)
provides=(libqmatrixclient)
conflicts=(libqmatrixclient)
source=("git+https://github.com/QMatrixClient/$_gitname")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  sed -i 's/add_library(QMatrixClient \$/add_library(QMatrixClient SHARED \$/g' ../$_gitname/CMakeLists.txt
  cmake "../$_gitname" \
    -DCMAKE_INSTALL_INCLUDEDIR=include/$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
