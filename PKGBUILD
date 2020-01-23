pkgname=mingw-w64-laz-perf
pkgver=1.3.0
pkgrel=1
pkgdesc='Alternative LAZ implementation for C++ and JavaScript (mingw-w64)'
arch=('any')
url='https://github.com/hobu/laz-perf'
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/hobu/laz-perf/archive/${pkgver}.tar.gz")
sha512sums=('4e6e5197a90bf98fe6784a56e940070ad640ee2791443b9232960fd0f7639cc8d48d5c13df0cfc228e6be5fccd600afb1c171cb5e127bd874688e0ab231c25a8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/laz-perf-${pkgver}"
  # minwindef.h:131:15: error: conflicting declaration ‘typedef int BOOL’
  sed -i "s|typedef bool               BOOL|typedef int BOOL|g" laz-perf/common/types.hpp
}

build() {
  cd "${srcdir}/laz-perf-${pkgver}"
    for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DWITH_TESTS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/laz-perf-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  done
}
