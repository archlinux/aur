pkgname=mingw-w64-lz4
pkgver=1.9.4
pkgrel=1
pkgdesc='Very fast lossless compression algorithm (mingw-w64)'
arch=('any')
url='http://lz4.github.io/lz4/'
license=(GPL2)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/lz4/lz4/archive/v${pkgver}.tar.gz")
sha256sums=('0b0e3aa07c8c063ddf40b082bdf7e37a1562bda40a0ff5272957f3e987e0e54b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd lz4-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
        -DLIB_INSTALL_DIR=lib \
        -DBUILD_SHARED_LIBS=OFF \
        ../build/cmake
    make
    popd

    mkdir -p build-${_arch}-shared && pushd build-${_arch}-shared
    ${_arch}-cmake \
        -DLIB_INSTALL_DIR=lib \
        -DBUILD_SHARED_LIBS=ON \
        ../build/cmake
    make
    popd
  done
}

package() {
  cd lz4-${pkgver}
  for _arch in ${_architectures}; do
    for _type in static shared; do
      pushd build-${_arch}-${_type}
      make install DESTDIR="${pkgdir}"
      popd
    done
    rm -r "${pkgdir}"/usr/${_arch}/share
    rm -r "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin"/*.dll
    ${_arch}-strip --strip-debug "${pkgdir}/usr/${_arch}/lib"/*.a
  done
}
