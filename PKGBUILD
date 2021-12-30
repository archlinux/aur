pkgname=mingw-w64-tbb
pkgver=2021.5.0
pkgrel=1
pkgdesc='High level abstract threading library (mingw-w64)'
depends=('mingw-w64-crt')
replaces=('mingw-w64-intel-tbb')
conflicts=('mingw-w64-intel-tbb')
provides=('mingw-w64-intel-tbb')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
url='https://github.com/oneapi-src/oneTBB'
license=('APACHE')
source=(https://github.com/oneapi-src/oneTBB/archive/v$pkgver.tar.gz)
sha256sums=('e5b57537c741400cf6134b428fc1689a649d7d38d9bb9c1b6d64f092ea28178a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/oneTBB-${pkgver}
  curl -L https://github.com/oneapi-src/oneTBB/pull/608.patch | patch -p1
  curl -L https://github.com/oneapi-src/oneTBB/pull/609.patch | patch -p1
  curl -L https://github.com/oneapi-src/oneTBB/pull/618.patch | patch -p1
  curl -L https://github.com/oneapi-src/oneTBB/pull/679.patch | patch -p1
}

build() {
  cd "$srcdir"/oneTBB-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DTBB_TEST=OFF ..
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

