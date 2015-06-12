# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Jiaxi Hu <sftrytry@gmail.com>

pkgname=mingw-w64-openblas-lapack
_pkgname=OpenBLAS
pkgver=0.2.13
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
source=(${_pkgname}-v${pkgver}.tar.gz::http://github.com/xianyi/OpenBLAS/archive/v${pkgver}.tar.gz)
md5sums=('bba7b37b5a5b6674fda91dcb2faab145')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

NCORE=`grep "^processor" /proc/cpuinfo | wc -l`

BUILDFLAG="USE_OPENMP=1 NO_LAPACK=0 NUM_THREADS=${NCORE} \
          MAJOR_VERSION=3 NO_AFFINITY=1 HOSTCC=gcc"

build() {
    for _arch in ${_architectures}; do
        cp -a "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkgname}-build-${_arch}"
        cd "${srcdir}/${_pkgname}-build-${_arch}"

        make ${BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran libs
        make ${BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran netlib
        make ${BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran shared
    done
}

package() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/${_pkgname}-build-${_arch}"
        make ${BUILDFLAG} PREFIX="${pkgdir}/usr/${_arch}" install
        install -Dm644 libopenblas.dll.a "${pkgdir}/usr/${_arch}/lib"

        ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
        ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a

        cd "${pkgdir}/usr/${_arch}/lib/"
        ln -s libopenblas.dll.a libblas.dll.a
        ln -s libopenblas.a libblas.a
        ln -s libopenblas.dll.a libcblas.dll.a
        ln -s libopenblas.a libcblas.a
        ln -s libopenblas.dll.a libf77blas.dll.a
        ln -s libopenblas.a libf77blas.a
        ln -s libopenblas.dll.a liblapack.dll.a
        ln -s libopenblas.a liblapack.a
        ln -s libopenblas.dll.a liblapacke.dll.a
        ln -s libopenblas.a liblapacke.a

        mv "../cmake" ./
        cd cmake
        sed -i "s%${pkgdir}%%g" *.cmake
    done
    
    cd "${srcdir}/${_pkgname}-${pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
