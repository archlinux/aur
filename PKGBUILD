# Maintainer: Dominic Hamon <dma at hey dot com>
# Contributor: Erik Zenker <erikzenker at posteo dot de>
pkgname=benchmark-git
pkgver=1.9.1
pkgrel=1
pkgdesc="A microbenchmark support library, by Google"
arch=('i686' 'x86_64')
url="https://github.com/google/benchmark"
license=('Apache')
depends=(gcc-libs gtest gmock)
makedepends=('cmake')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/benchmark/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/benchmark-${pkgver}"

  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib \
           -DBUILD_SHARED_LIBS=ON \
           -DBENCHMARK_ENABLE_LTO=ON \
           -DBENCHMARK_USE_BUNDLED_GTEST=OFF \
           -DBENCHMARK_ENABLE_ASSEMBLY_TESTS=OFF
}

build() {
  cd "${srcdir}/benchmark-${pkgver}/build"
  make -j
}

check() {
  cd "${srcdir}/benchmark-${pkgver}/build"
  make -j test
}

package() {
  cd "${srcdir}/benchmark-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}
