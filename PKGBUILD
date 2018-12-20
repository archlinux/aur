# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Jiaxi Hu <sftrytry@gmail.com>

_pkgname=OpenBLAS
_lapackver=3.8.0
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
BUILDFLAG="USE_OPENMP=1 USE_THREAD=1 MAJOR_VERSION=3 NO_LAPACK=0 BUILD_LAPACK_DEPRECATED=1 CROSS=1 HOSTCC=gcc"

pkgname=mingw-w64-openblas-lapack
pkgver=0.3.4
pkgrel=1
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD, providing optimized blas, lapack, and cblas (mingw-w64)"
arch=('any')
url="https://www.openblas.net"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('perl'
             'mingw-w64-gcc')
provides=('mingw-w64-openblas'
          "mingw-w64-blas=$_lapackver"
          "mingw-w64-cblas=$_lapackver"
          "mingw-w64-lapack=$_lapackver"
          "mingw-w64-lapacke=$_lapackver")
conflicts=('mingw-w64-openblas'
           'mingw-w64-blas'
           'mingw-w64-cblas'
           'mingw-w64-lapack'
           'mingw-w64-lapacke')
options=('!strip' 'staticlibs' '!buildflags')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/xianyi/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4b4b4453251e9edb5f57465bf2b3cf67b19d811d50c8588cdf2ea1f201bb834f')

prepare() {
  cd ${srcdir}
}

build() {
  cd ${srcdir}
  for _arch in ${_architectures}; do
    cp -a "${_pkgname}-${pkgver}" "${_pkgname}-build-${_arch}"
    pushd "${_pkgname}-build-${_arch}"

    if [ "${_arch}" = "i686-w64-mingw32" ]
    then
      _BUILDFLAG="${BUILDFLAG} BINARY=32"
    else
      _BUILDFLAG="${BUILDFLAG} BINARY=64"
    fi

    make ${_BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran libs
    make ${_BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran netlib
    make ${_BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran shared
    popd
  done
}

check() {
  cd ${srcdir}
  for _arch in ${_architectures}; do
    pushd "${_pkgname}-build-${_arch}"

    if [ "${_arch}" = "i686-w64-mingw32" ]
    then
      _BUILDFLAG="${BUILDFLAG} BINARY=32"
    else
      _BUILDFLAG="${BUILDFLAG} BINARY=64"
    fi

    # this is actually build tests only, not execute test
    make ${_BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran tests
    popd
  done
}

package() {
  cd ${srcdir}
  for _arch in ${_architectures}; do
    pushd "${_pkgname}-build-${_arch}"
    make ${BUILDFLAG} PREFIX="/usr/${_arch}" DESTDIR="${pkgdir}" install
    install -Dm644 libopenblas.dll.a "${pkgdir}/usr/${_arch}/lib"

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a

    cd "${pkgdir}/usr/${_arch}/bin/"
    ln -sf libopenblas.dll libblas.dll
    ln -sf libopenblas.dll libcblas.dll
    ln -sf libopenblas.dll libf77blas.dll
    ln -sf libopenblas.dll liblapack.dll
    ln -sf libopenblas.dll liblapacke.dll

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
