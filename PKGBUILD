# Maintainer: pingplug <pingplug@foxmail.com>

pkgname=mingw-w64-dlib
_pkgname=dlib
pkgver=19.10
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques. (mingw-w64)"
arch=('any')
url="http://www.dlib.net/"
license=('Boost Software License')
makedepends=('mingw-w64-cmake')
optdepends=('mingw-w64-giflib: for GIF support'
            'mingw-w64-lapack: for BLAS and LAPACK support'
            'mingw-w64-libjpeg: for JPEG support'
            'mingw-w64-libpng: for PNG support'
            'mingw-w64-sqlite: for sqlite support')
options=('!buildflags' '!strip' 'staticlibs')
source=(https://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
sha512sums=('04b1513f09bf43677ad5b59d76fe7aa9cd96c6d7d1aac2fb0f431a555ccc670996a30660a8bf50eea082842f623b68f1ac019058b351750c0d86f8f0b355891b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd ${srcdir}
}

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
        pushd "${_pkgname}-build-${_arch}-static"
        make DESTDIR=${pkgdir} install
        popd
        ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
        ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    done
    install -Dm644 "${_pkgname}-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
