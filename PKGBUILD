# Maintainer: pingplug <pingplug@foxmail.com>

_pkgname=dlib
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-dlib
pkgver=19.16
pkgrel=1
pkgdesc="A general purpose cross-platform C++ library designed using contract programming and modern C++ techniques (mingw-w64)"
arch=('any')
url="http://www.dlib.net"
license=('custom')
depends=('mingw-w64-crt')
optdepends=('mingw-w64-giflib: for GIF support'
            'mingw-w64-lapack: for BLAS and LAPACK support'
            'mingw-w64-libjpeg: for JPEG support'
            'mingw-w64-libpng: for PNG support'
            'mingw-w64-sqlite: for sqlite support')
makedepends=('mingw-w64-cmake')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('37308406c2b1459a70f21ec2fd7bdc922277659534c708323cb28d6e8e4764a8')

build() {
  cd ${srcdir}
  for _arch in ${_architectures}; do
    # shared
    mkdir -p "${_pkgname}-build-${_arch}-shared" && pushd "${_pkgname}-build-${_arch}-shared"
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DUSE_AVX_INSTRUCTIONS:BOOL=ON \
      -DUSE_SSE2_INSTRUCTIONS:BOOL=ON \
      -DUSE_SSE4_INSTRUCTIONS:BOOL=ON \
      "../${_pkgname}-${pkgver}"
    make
    popd
    # static
    mkdir -p "${_pkgname}-build-${_arch}-static" && pushd "${_pkgname}-build-${_arch}-static"
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS:BOOL=OFF \
      -DUSE_AVX_INSTRUCTIONS:BOOL=ON \
      -DUSE_SSE2_INSTRUCTIONS:BOOL=ON \
      -DUSE_SSE4_INSTRUCTIONS:BOOL=ON \
      "../${_pkgname}-${pkgver}"
    make
    popd
  done
}

package() {
  cd ${srcdir}
  for _arch in ${_architectures}; do
    pushd "${_pkgname}-build-${_arch}-shared"
    make DESTDIR=${pkgdir} install
    popd
    mv "${pkgdir}/usr/${_arch}/lib/cmake/dlib/"{dlib,dlib-shared}.cmake
    pushd "${_pkgname}-build-${_arch}-static"
    make DESTDIR=${pkgdir} install
    popd
    mv "${pkgdir}/usr/${_arch}/lib/cmake/dlib/"{dlib,dlib-static}.cmake
    pushd "${pkgdir}/usr/${_arch}/lib/cmake/dlib/"
    ln -s dlib-static.cmake dlib.cmake
    popd
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
  install -Dm644 "${_pkgname}-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
