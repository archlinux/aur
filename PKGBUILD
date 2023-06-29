# Maintainer: pingplug < aur at pingplug dot me >

_pkgname=dlib
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-dlib
pkgver=19.24.2
pkgrel=1
pkgdesc="A general purpose cross-platform C++ library designed using contract programming and modern C++ techniques (mingw-w64)"
arch=('any')
url="http://dlib.net"
license=('custom')
depends=('mingw-w64-crt'
         'mingw-w64-cblas'
         'mingw-w64-lapack'
         'mingw-w64-libjpeg-turbo'
         'mingw-w64-libpng')
optdepends=('mingw-w64-ffmpeg: for FFmpeg support'
            'mingw-w64-giflib: for GIF support'
            'mingw-w64-libwebp: for WebP support'
            'mingw-w64-sqlite: for sqlite support')
makedepends=('mingw-w64-cmake')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://codeload.github.com/davisking/dlib/tar.gz/refs/tags/v${pkgver}")
sha256sums=('0f5c7e3de6316a513635052c5f0a16a84e1cef26a7d233bf00c21348462b6d6f')

build() {
  cd ${srcdir}
  for _arch in ${_architectures}; do
    # shared
    mkdir -p "${_pkgname}-build-${_arch}-shared" && pushd "${_pkgname}-build-${_arch}-shared"
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DUSE_AVX_INSTRUCTIONS=OFF \
      -DDLIB_USE_CUDA=OFF \
      "../${_pkgname}-${pkgver}"
    make
    popd
    # static
    mkdir -p "${_pkgname}-build-${_arch}-static" && pushd "${_pkgname}-build-${_arch}-static"
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS:BOOL=OFF \
      -DUSE_AVX_INSTRUCTIONS=OFF \
      -DDLIB_USE_CUDA=OFF \
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
