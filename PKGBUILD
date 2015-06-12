# Maintainer: pingplug <pingplug@foxmail.com>

pkgname=mingw-w64-dlib
_pkgname=dlib
pkgver=18.15
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques. (mingw-w64 with pre-build library)"
arch=('any')
url="http://www.dlib.net/"
license=('Boost Software License')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
optdepends=('mingw-w64-cblas: for BLAS support'
            'mingw-w64-lapack: for LAPACK support'
            'mingw-w64-libjpeg: for JPEG support'
            'mingw-w64-libpng: for PNG support'
            'mingw-w64-sqlite: for sqlite support')
options=('!buildflags' '!strip' 'staticlibs')
source=(http://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2
        dlib-${pkgver}.patch
        cmake)
md5sums=('55922b2138913100634c42e36730dac7'
         'f2a50bc7df3361c71b34b44641f3a52a'
         'c0c067d75d28a623e2036c793bc58ea2')
install=${pkgname}.install

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd ${srcdir}

    # fix the windres flag
    # fix can't find blas and lapack
    # fix a linking error while build a static binary with libpng
    patch -Np0 -i dlib-${pkgver}.patch
}

build() {
    for _arch in ${_architectures}; do
        mkdir -p "${srcdir}/${_pkgname}-build-${_arch}"
        cd "${srcdir}/${_pkgname}-build-${_arch}"

        ${_arch}-cmake "../${_pkgname}-${pkgver}/${_pkgname}"
        make
    done
}

package() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/${_pkgname}-${pkgver}"

        mv ${_pkgname}/cmake ${_pkgname}/cmake.orig
        install -Dm644 ../cmake ${_pkgname}

        install -Dm755 -d "${pkgdir}/usr/${_arch}/include"
	    cp -a ${_pkgname} "${pkgdir}/usr/${_arch}/include"

        cd "${srcdir}/${_pkgname}-build-${_arch}"
        install -Dm755 -d "${pkgdir}/usr/${_arch}/lib"
        install -Dm644 libdlib.a "${pkgdir}/usr/${_arch}/lib"
        ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    done
}
