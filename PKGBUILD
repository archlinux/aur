# Maintainer: pingplug <pingplug@foxmail.com>

pkgname=mingw-w64-dlib
_pkgname=dlib
pkgver=19.8
pkgrel=2
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques. (mingw-w64)"
arch=('any')
url="http://www.dlib.net/"
license=('Boost Software License')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
optdepends=('mingw-w64-giflib: for GIF support'
            'mingw-w64-lapack: for BLAS and LAPACK support'
            'mingw-w64-libjpeg: for JPEG support'
            'mingw-w64-libpng: for PNG support'
            'mingw-w64-sqlite: for sqlite support')
options=('!buildflags' '!strip' 'staticlibs')
source=(https://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2
        dlib.patch)
sha512sums=('13d354e2e35c93c1b84bbc680e38cfe043199a18cb362426f21962a3d2eb116c86dd83af4eacd131e3749d3a4eadcf58a9db28133ec508de0c2a4cb3eb87dbf1'
            'c0951d8915c4d45bf9dec355a54fbe4b7e82db36cc7009c6ac2a145a5ba4a1f5ca7aedfadd5e478ab17ddf037a9460a5f18891b793f76f4f8274d0fb14ed5faa')

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
        ${_arch}-cmake "../${_pkgname}-${pkgver}/${_pkgname}"
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
}
