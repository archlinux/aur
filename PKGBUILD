pkgname=('mingw-w64-symengine')
pkgver=0.15.0
pkgrel=1
pkgdesc='Fast symbolic manipulation library, written in C++ (mingw-w64)'
url='http://sympy.org/'
arch=('any')
license=('MIT')
makedepends=('mingw-w64-cmake' 'mingw-w64-boost')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-libmpc' 'mingw-w64-primesieve' 'mingw-w64-llvm' 'mingw-w64-flint')
source=("https://github.com/symengine/symengine/releases/download/v$pkgver/symengine-$pkgver.tar.gz")
sha256sums=('9f75f0367221abd88b9b60ef7b104b4aa1e34e99d3152c3df2bb2467bad2f04f')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd symengine-$pkgver
}

build() {
  cd symengine-$pkgver
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_UNITY_BUILD=ON -DWITH_PTHREAD=ON -DWITH_SYMENGINE_THREAD_SAFE=ON -DINTEGER_CLASS=flint -DWITH_LLVM=ON -DWITH_MPFR=ON -DWITH_MPC=ON -DWITH_PRIMESIEVE=ON -DWITH_BOOST=ON -DBUILD_BENCHMARKS=OFF -DBUILD_TESTS=OFF -DINSTALL_CMAKE_DIR=lib/cmake/symengine -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "${srcdir}"/symengine-$pkgver
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --build build-${_arch} --target install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
