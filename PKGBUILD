# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=cosma
_PkgName=COSMA
pkgver=2.6.6
pkgrel=1
pkgdesc="Distributed Communication-Optimal Matrix-Matrix Multiplication Algorithm"
arch=(x86_64)
url="https://github.com/eth-cscs/COSMA"
license=(BSD-3-Clause)
depends=(cblas costa)
makedepends=(cmake ninja cxxopts gcc-fortran)
source=($pkgname-$pkgver.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1604be101e77192fbcc5551236bc87888d336e402f5409bbdd9dea900401cc37')
options=(!buildflags)

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $_PkgName-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_SHARED_LIBS=ON \
    -D COSMA_BLAS=CUSTOM \
    -D COSMA_OPENBLAS_LINK_LIBRARIES="/usr/lib/libcblas.so" \
    -D COSMA_SCALAPACK=CUSTOM \
    -D COSMA_WITH_TESTS=ON \
    -D COSMA_WITH_APPS=OFF \
    -D COSMA_WITH_BENCHMARKS=OFF \
    -G Ninja \
    -W no-dev
  cmake --build build
}

check() {
  cd "$srcdir/build"
  ctest
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build

  install -Dm755 $_PkgName-$pkgver/LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf "$pkgdir/usr/bin"
}
