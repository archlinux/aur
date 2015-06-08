# Contributor: jellysheep <max.mail@dameweb.de>

pkgname=mingw-w64-eigen
pkgver=3.2.4
pkgrel=1
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra. (mingw-w64)"
arch=('any')
url='http://eigen.tuxfamily.org'
license=('MPL2')
makedepends=('mingw-w64-cmake' 'mingw-w64-pkg-config')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://bitbucket.org/eigen/eigen/get/${pkgver}.tar.bz2"
        'eigen-3.1.2_osversion.patch'
        'eigen-3.2_gcc58087.patch'
        'TryRunResults.cmake')
sha1sums=('64ea809acc449adbd8fe616def7d48ff4f0776a8'
          '498f6f9889962e51c92b03970dc483103dc6590c'
          '1930d287bf60afb8d2900dbab2e21d7e1dd9f0f7'
          '9af853e136f36ec364dd814942a542ea5cbdcd39')
provides=('mingw-w64-eigen3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"/eigen-eigen-*
  patch -p2 -i "$srcdir"/eigen-3.1.2_osversion.patch
  patch -p1 -i "$srcdir"/eigen-3.2_gcc58087.patch
}

build() {
  cd "$srcdir"/eigen-eigen-*
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -C "$srcdir"/TryRunResults.cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/eigen-eigen-*/build-${_arch}
    make install DESTDIR="$pkgdir"
  done
}

