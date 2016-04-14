# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Jiaxi Hu <sftrytry@gmail.com>

pkgname=mingw-w64-openblas-lapack
_pkgname=OpenBLAS
pkgver=0.2.18
pkgrel=1
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD, providing optimized blas, lapack, and cblas. (mingw-w64)"
arch=('any')
url="http://xianyi.github.com/OpenBLAS/"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('perl' 'mingw-w64-gcc')
provides=('mingw-w64-openblas' 'mingw-w64-blas' 'mingw-w64-lapack' 'mingw-w64-cblas')
conflicts=('mingw-w64-openblas' 'mingw-w64-blas' 'mingw-w64-lapack' 'mingw-w64-cblas')
options=('!buildflags' '!makeflags' '!strip' 'staticlibs')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/xianyi/${_pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('805e7f660877d588ea7e3792cda2ee65')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

BUILDFLAG="USE_OPENMP=1 USE_THREAD=1 MAJOR_VERSION=3 NO_LAPACK=0 HOSTCC=gcc BUILD_LAPACK_DEPRECATED=1"

build() {
    cd ${srcdir}
    for _arch in ${_architectures}; do
        cp -a "${_pkgname}-${pkgver}" "${_pkgname}-build-${_arch}"
        pushd "${_pkgname}-build-${_arch}"

        make ${BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran libs
        make ${BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran netlib
        make ${BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran shared
        popd
    done
}

#check() {
#    cd ${srcdir}
#    for _arch in ${_architectures}; do
#        pushd "${_pkgname}-build-${_arch}"
#        make ${BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran tests
#        popd
#    done
#}

package() {
    cd ${srcdir}
    for _arch in ${_architectures}; do
        pushd "${_pkgname}-build-${_arch}"
        make ${BUILDFLAG} PREFIX="/usr/${_arch}" DESTDIR="${pkgdir}" install
        install -Dm644 libopenblas.dll.a "${pkgdir}/usr/${_arch}/lib"

        ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
        ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a

        cd "${pkgdir}/usr/${_arch}/lib/"
        ln -sf libopenblas.dll.a libblas.dll.a
        ln -sf libopenblas.a libblas.a
        ln -sf libopenblas.dll.a libcblas.dll.a
        ln -sf libopenblas.a libcblas.a
        ln -sf libopenblas.dll.a libf77blas.dll.a
        ln -sf libopenblas.a libf77blas.a
        ln -sf libopenblas.dll.a liblapack.dll.a
        ln -sf libopenblas.a liblapack.a
        ln -sf libopenblas.dll.a liblapacke.dll.a
        ln -sf libopenblas.a liblapacke.a

        popd
    done
    
    cd "${_pkgname}-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
