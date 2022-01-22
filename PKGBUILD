# Maintainer: Michał Janiszewski <janisozaur+aur@gmail.com>
# Contributor: Philipp Claßen <philipp.classen@posteo.de>

pkgname=lib32-benchmark
pkgver=1.6.1
pkgrel=1
pkgdesc="A microbenchmark support library (32-bit)"
arch=('x86_64')
url="https://github.com/google/benchmark"
license=('Apache')
depends=('lib32-gcc-libs')
makedepends=('cmake' 'gcc-multilib')

source=("https://github.com/google/benchmark/archive/v$pkgver/benchmark-$pkgver.tar.gz")
sha256sums=('6132883bc8c9b0df5375b16ab520fac1a85dc9e4cf5be59480448ece74b278d4')

prepare() {
  cd "$srcdir/benchmark-$pkgver"
  mkdir -p build
}

build() {
  cd "$srcdir/benchmark-$pkgver/build"

  cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -m32 -DNDEBUG" \
    -DCMAKE_C_FLAGS="${CFLAGS} -m32 -DNDEBUG" \
    -DCMAKE_LD_FLAGS="${LDFLAGS} -m32" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DBUILD_SHARED_LIBS=ON \
    -DBENCHMARK_ENABLE_LTO=ON \
    -DBENCHMARK_ENABLE_GTEST_TESTS=OFF \
    ..

  make
}

package() {
  cd "$srcdir/benchmark-$pkgver/build"
  make DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir"/usr/{include,lib,share}
}
