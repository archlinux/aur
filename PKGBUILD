pkgname=mingw-w64-tbb
pkgver=2021.9.0
pkgrel=1
pkgdesc='High level abstract threading library (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='https://github.com/oneapi-src/oneTBB'
license=('APACHE')
source=(https://github.com/oneapi-src/oneTBB/archive/v$pkgver.tar.gz)
sha256sums=('1ce48f34dada7837f510735ff1172f6e2c261b09460e3bf773b49791d247d24e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/oneTBB-${pkgver}
}

build() {
  cd "$srcdir"/oneTBB-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DTBB_TEST=OFF -DTBB_STRICT=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/oneTBB-${pkgver}/build-${_arch}
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

