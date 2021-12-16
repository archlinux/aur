pkgname=mingw-w64-laz-perf
pkgver=3.0.0
pkgrel=1
pkgdesc='Alternative LAZ implementation for C++ and JavaScript (mingw-w64)'
arch=('any')
url='https://github.com/hobu/laz-perf'
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/hobu/laz-perf/archive/${pkgver}.tar.gz")
sha512sums=('57fcbf661c306b01f86254c4471de68f7359d050cc562ff549ab3560f54f9a4455624740335009d2dfd6d9b3298c4742198106886ba1b0c97d4dfdeddeb180c0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/laz-perf-${pkgver}"
  curl -L https://github.com/hobu/laz-perf/pull/110.patch | patch -p1
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
