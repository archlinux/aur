pkgname=lfortran-git
pkgver=r14057.5305b8043
pkgrel=1
pkgdesc="Modern interactive LLVM-based Fortran compiler"
arch=('x86_64')
url="https://${pkgname}.org"
license=('custom:BSD-3-clause')
depends=(clang zlib ncurses xeus-zmq)
makedepends=(llvm cmake cppzmq git re2c)
source=(git+https://github.com/lfortran/lfortran.git)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/lfortran"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd lfortran
  sed -i "/StaticZSTD/d" CMakeLists.txt
}

build() {
  cmake \
    -S lfortran \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=TRUE \
    -DWITH_LLVM=yes \
    -DWITH_RUNTIME_LIBRARY=yes \
    -DWITH_XEUS=yes \
    -DWITH_ZLIB=yes \
    -DLFORTRAN_BUILD_ALL=ON

  cmake --build build --target all
}

check() {
  ctest --verbose --output-on-failure --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
}
