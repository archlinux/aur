# Maintainer: pingplug < aur at pingplug dot me >

_pkgname=dlib
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-dlib
pkgver=19.19
pkgrel=1
pkgdesc="A general purpose cross-platform C++ library designed using contract programming and modern C++ techniques (mingw-w64)"
arch=('any')
url="http://www.dlib.net"
license=('custom')
depends=('mingw-w64-crt'
         'mingw-w64-cblas'
         'mingw-w64-lapack'
         'mingw-w64-libjpeg-turbo'
         'mingw-w64-libpng')
makedepends=('mingw-w64-cmake')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('1decfe883635ce51acd72869cebe870ab9b85eb094d417adc8f48aa7b8c60cd7')

build() {
  cd ${srcdir}
  for _arch in ${_architectures}; do
    # shared
    mkdir -p "${_pkgname}-build-${_arch}-shared" && pushd "${_pkgname}-build-${_arch}-shared"
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      "../${_pkgname}-${pkgver}"
    make
    popd
    # static
    mkdir -p "${_pkgname}-build-${_arch}-static" && pushd "${_pkgname}-build-${_arch}-static"
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS:BOOL=OFF \
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
