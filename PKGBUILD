# Maintainer: darkprof <darkprof83@gmail.com>

_pkgname=gtest
pkgname=lib32-${_pkgname}
pkgver=1.8.1
pkgrel=1
pkgdesc="Google Test - C++ testing utility based on the xUnit framework (like JUnit)"
arch=('x86_64')
url="https://github.com/google/googletest"
license=(custom:BSD3)
depends=("${_pkgname}" 'lib32-gcc-libs')
makedepends = cmake
options=(!buildflags staticlibs !strip)
source=("https://github.com/google/googletest/archive/release-${pkgver}.tar.gz")
sha512sums=('e6283c667558e1fd6e49fa96e52af0e415a3c8037afe1d28b7ff1ec4c2ef8f49beb70a9327b7fc77eb4052a58c4ccad8b5260ec90e4bceeac7a46ff59c4369d7')

build() {
  cd "googletest-release-${pkgver}"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_SKIP_RPATH=ON \
    -Dgtest_disable_pthreads=ON \
    -DCMAKE_CXX_FLAGS=-m32 \
    -DCMAKE_SHARED_LINKER_FLAGS=-m32 \
    .
  cmake --build .
}

package() {
  cd "googletest-release-${pkgver}"
  
  mkdir -pm 0755 "${pkgdir}/usr/lib32"
  install -m 644 googlemock/libgmock{,_main}.so "${pkgdir}"/usr/lib32
  install -m 644 googletest/libgtest{,_main}.so "${pkgdir}"/usr/lib32
}
