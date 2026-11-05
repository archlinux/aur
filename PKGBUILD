pkgname=mingw-w64-lz4
pkgver=1.11.0
pkgrel=1
pkgdesc='Very fast lossless compression algorithm (mingw-w64)'
arch=('any')
url='http://lz4.github.io/lz4/'
license=(GPL2)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/lz4/lz4/archive/v${pkgver}.tar.gz")
sha256sums=('247e5fa64da5f7b75ee3dd3bed484076396c9ebe8254d9ccf693eb62800c5e26')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd lz4-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DLZ4_BUILD_CLI=OFF -DBUILD_SHARED_LIBS=OFF -B build-${_arch}-static build/cmake
    make -C build-${_arch}-static
    ${_arch}-cmake -DLZ4_BUILD_CLI=OFF -DBUILD_SHARED_LIBS=ON -B build-${_arch}-shared build/cmake
    make -C build-${_arch}-shared
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
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin"/*.dll
    ${_arch}-strip --strip-debug "${pkgdir}/usr/${_arch}/lib"/*.a
  done
}
