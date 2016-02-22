pkgname=mingw-w64-assimp
pkgver=3.2
pkgrel=1
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner (mingw-w64)"
arch=('any')
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-boost')
url='http://www.assimp.org/'
source=("https://github.com/assimp/assimp/archive/v${pkgver}.tar.gz")
options=('!strip' '!buildflags' 'staticlibs')
md5sums=('bb0cfa1513c4e11cf7ba14ba66548072')

_basename=assimp
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cd "${srcdir}"/assimp-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
            -DASSIMP_BUILD_ASSIMP_TOOLS=OFF -DBUILD_SHARED_LIBS=ON \
            -DASSIMP_BUILD_TESTS=OFF -DCMAKE_BUILD_TYPE=RELEASE -DASSIMP_ENABLE_BOOST_WORKAROUND=OFF ..
    make
    popd
  done

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
            -DASSIMP_BUILD_ASSIMP_TOOLS=OFF -DBUILD_SHARED_LIBS=OFF \
            -DASSIMP_BUILD_TESTS=OFF -DCMAKE_BUILD_TYPE=RELEASE -DASSIMP_ENABLE_BOOST_WORKAROUND=OFF ..
    make
    popd
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/assimp-${pkgver}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    cd "${srcdir}/assimp-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
  install -Dm644 "${srcdir}/${_basename}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
