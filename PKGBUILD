# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: darkprof <darkprof83@gmail.com>
# Contributor: asuka minato

pkgname=lib32-gtest
pkgver=1.14.0
pkgrel=1
pkgdesc="Google Test - C++ testing utility based on the xUnit framework (like JUnit)"
arch=(x86_64)
url="https://github.com/google/googletest"
license=(BSD)
depends=(gtest lib32-glibc lib32-gcc-libs)
makedepends=(cmake)
options=(!buildflags staticlibs !strip)
source=("gtest-${pkgver}.tar.gz::https://github.com/google/googletest/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('765c326ccc1b87a01027385e69238266e356361cd4ee3e18e3c9d137a5d11fa5d657c164d02dd1be8fe693c8e10f2b580588dbfa57d27f070e2750f50d3e662c')

build() {
  cd "googletest-${pkgver}"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_SKIP_RPATH=ON \
    -Dgtest_disable_pthreads=ON \
    -DCMAKE_CXX_FLAGS=-m32 \
    -DCMAKE_SHARED_LINKER_FLAGS=-m32 \
    -DBUILD_GMOCK=ON \
    .
  cmake --build .
}

package() {
  cd "googletest-${pkgver}"

  mkdir -pm 0755 "${pkgdir}/usr/lib32"
  install -m 644 lib/libgmock{,_main}.so "${pkgdir}"/usr/lib32
  install -m 644 lib/libgtest{,_main}.so "${pkgdir}"/usr/lib32
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
