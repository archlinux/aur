# Maintainer: darkprof <darkprof83@gmail.com>

_pkgname=gtest
pkgname=lib32-${_pkgname}
pkgver=1.10.0
pkgrel=1
pkgdesc="Google Test - C++ testing utility based on the xUnit framework (like JUnit)"
arch=('x86_64')
url="https://github.com/google/googletest"
license=(custom:BSD3)
depends=("${_pkgname}" 'lib32-gcc-libs')
makedepends=('cmake')
options=(!buildflags staticlibs !strip)
source=("https://github.com/google/googletest/archive/release-${pkgver}.tar.gz")
sha512sums=('bd52abe938c3722adc2347afad52ea3a17ecc76730d8d16b065e165bc7477d762bce0997a427131866a89f1001e3f3315198204ffa5d643a9355f1f4d0d7b1a9')

build() {
  cd "googletest-release-${pkgver}"
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
  cd "googletest-release-${pkgver}"
  
  mkdir -pm 0755 "${pkgdir}/usr/lib32"
  install -m 644 lib/libgmock{,_main}.so "${pkgdir}"/usr/lib32
  install -m 644 lib/libgtest{,_main}.so "${pkgdir}"/usr/lib32
}
