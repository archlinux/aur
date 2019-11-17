pkgname=mingw-w64-assimp
pkgver=5.0.0
pkgrel=1
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner (mingw-w64)"
arch=('any')
license=('BSD')
depends=('mingw-w64-zlib' 'mingw-w64-boost')
makedepends=('mingw-w64-cmake')
url='http://www.assimp.org/'
source=("https://github.com/assimp/assimp/archive/v${pkgver}.tar.gz")
options=('!strip' '!buildflags' 'staticlibs')
sha256sums=('b0110a91650d6bb4000e3d5c2185bf77b0ff0a2e7a284bc2c4af81b33988b63c')

_basename=assimp
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cd "${srcdir}"/assimp-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
            -DASSIMP_BUILD_ASSIMP_TOOLS=OFF \
            -DASSIMP_BUILD_TESTS=OFF -DASSIMP_ENABLE_BOOST_WORKAROUND=OFF ..
    make
    popd
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/assimp-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
