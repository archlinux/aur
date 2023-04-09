# Contributor: darkprof <darkprof83@gmail.com>
# Contributor: asuka minato
_pkgname=gtest
pkgname=lib32-${_pkgname}
pkgver=1.13.0
pkgrel=1
pkgdesc="Google Test - C++ testing utility based on the xUnit framework (like JUnit)"
arch=('x86_64')
url="https://github.com/google/googletest"
license=(custom:BSD3)
depends=("${_pkgname}" 'lib32-gcc-libs')
makedepends=('cmake')
options=(!buildflags staticlibs !strip)
source=("https://github.com/google/googletest/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('70c0cfb1b4147bdecb467ecb22ae5b5529eec0abc085763213a796b7cdbd81d1761d12b342060539b936fa54f345d33f060601544874d6213fdde79111fa813e')

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
}
