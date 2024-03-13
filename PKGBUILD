# Maintainer: pingplug < aur at pingplug dot me >

_pkgname=dlib
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-dlib
pkgver=19.24.3
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
sha256sums=('4b1f28e76020775334e67cc348ceb26a4f5161df6659848be0d3b300406400a3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    # shared
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS:BOOL=ON \
      -DUSE_AVX_INSTRUCTIONS=OFF \
      -DDLIB_USE_CUDA=OFF \
      -B build-${_arch}-shared -S .
    make -C build-${_arch}-shared
    # static
    ${_arch}-cmake \
      -DBUILD_SHARED_LIBS:BOOL=OFF \
      -DUSE_AVX_INSTRUCTIONS=OFF \
      -DDLIB_USE_CUDA=OFF \
      -B build-${_arch}-static -S .
    make -C build-${_arch}-static
  done
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    make DESTDIR=${pkgdir} install -C build-${_arch}-static
    make DESTDIR=${pkgdir} install -C build-${_arch}-shared
    mv "${pkgdir}/usr/${_arch}/lib/cmake/dlib/"{dlib,dlib-static}.cmake
    pushd "${pkgdir}/usr/${_arch}/lib/cmake/dlib/"
    ln -s dlib-static.cmake dlib.cmake
    popd
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
  install -Dm644 dlib/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
