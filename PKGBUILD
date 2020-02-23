# Maintainer: Michał Janiszewski <janisozaur+aur@gmail.com>
# Contributor: Philipp Claßen <philipp.classen@posteo.de>

pkgname=lib32-benchmark
pkgver=1.5.0
pkgrel=1
pkgdesc="A microbenchmark support library, by Google (32-bit)"
arch=('x86_64')
url="https://github.com/google/benchmark"
license=('Apache')
depends=('gcc-libs-multilib')
makedepends=('cmake')

source=("https://github.com/google/benchmark/archive/v${pkgver}.tar.gz")
sha256sums=('3c6a165b6ecc948967a1ead710d4a181d7b0fbcaa183ef7ea84604994966221a')

prepare() {
  cd "${srcdir}/benchmark-${pkgver}"

  mkdir -p build && cd build

  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib32 \
           -DBUILD_SHARED_LIBS=ON \
           -DBENCHMARK_ENABLE_LTO=ON \
           -DBENCHMARK_ENABLE_INSTALL=ON \
           -DBENCHMARK_ENABLE_GTEST_TESTS=OFF
}

build() {
  cd "${srcdir}/benchmark-${pkgver}/build"
  make
}

package() {
  cd "${srcdir}/benchmark-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir"/usr/{include,lib,share}
}
