# Maintainer: pingplug <pingplug@foxmail.com>

pkgname=mingw-w64-dlib
_pkgname=dlib
pkgver=19.9
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
source=(https://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2
        dlib.patch)
sha512sums=('3cbd2b7d2cad2e494a14e9f19469e6ab33263ad87aa32e6f65de689ebfb395277fd5d5c3fd4a510cc16d3a8768d9685652c8378fcde0ceec5234363ab492b473'
            'd9ffa19acf700bddef82cf02902887351036a17d9b9e840c0553a676e3fff021e5ec05aa1cca284fa74b81bea7916974c476d98575d0ae649f7478618ae89e63')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd ${srcdir}

    # fix a linking error while build a static binary with libpng
    patch -Np0 -i dlib.patch
}

build() {
    cd ${srcdir}
    for _arch in ${_architectures}; do
        mkdir -p "${_pkgname}-build-${_arch}" && pushd "${_pkgname}-build-${_arch}"
        ${_arch}-cmake \
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
        pushd "${_pkgname}-build-${_arch}"
        make DESTDIR=${pkgdir} install
        ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
        popd
    done
    install -Dm644 "${_pkgname}-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
