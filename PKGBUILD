pkgname=('mingw-w64-symengine')
pkgver=0.14.0
pkgrel=1
pkgdesc='Fast symbolic manipulation library, written in C++ (mingw-w64)'
url='http://sympy.org/'
arch=('any')
license=('MIT')
makedepends=('mingw-w64-cmake' 'mingw-w64-boost')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-libmpc' 'mingw-w64-primesieve' 'mingw-w64-llvm' 'mingw-w64-flint')
source=("https://github.com/symengine/symengine/releases/download/v$pkgver/symengine-$pkgver.tar.gz")
sha256sums=('11c5f64e9eec998152437f288b8429ec001168277d55f3f5f1df78e3cf129707')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd symengine-$pkgver
  # install cmake config into lib/cmake
  sed -i "s|if(WIN32 AND NOT CYGWIN)|if(0)|g" CMakeLists.txt
}

build() {
  cd symengine-$pkgver
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DWITH_PTHREAD=ON -DWITH_SYMENGINE_THREAD_SAFE=ON -DINTEGER_CLASS=flint -DWITH_LLVM=ON -DWITH_MPFR=ON -DWITH_MPC=ON -DWITH_PRIMESIEVE=ON  -DWITH_BOOST=ON -DBUILD_BENCHMARKS=OFF -DBUILD_TESTS=OFF -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/symengine-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    #${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
