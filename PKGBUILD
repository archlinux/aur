# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: darkprof <darkprof83@gmail.com>
# Contributor: asuka minato

pkgname=lib32-gtest
pkgver=1.15.2
pkgrel=1
pkgdesc="Google Test - C++ testing utility based on the xUnit framework (like JUnit)"
arch=(x86_64)
url="https://github.com/google/googletest"
license=(BSD)
depends=(gtest lib32-glibc lib32-gcc-libs)
makedepends=(cmake)
options=(!buildflags staticlibs !strip)
source=("gtest-${pkgver}.tar.gz::https://github.com/google/googletest/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('9046841044a2bf7edfd96854ad9c44ffae4fcb9fb59a075b367507c0762a98eb32cb6968d46663228272e26321e96f4dd287c95baa22c6af9bad902b8b6ede4e')

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
