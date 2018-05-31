# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Jiaxi Hu <sftrytry@gmail.com>

_pkgname=OpenBLAS
_lapackver=3.8.0
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
BUILDFLAG="USE_OPENMP=1 USE_THREAD=1 MAJOR_VERSION=3 NO_LAPACK=0 BUILD_LAPACK_DEPRECATED=1 CROSS=1 HOSTCC=gcc"

pkgname=mingw-w64-openblas-lapack
pkgver=0.3.0
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
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/xianyi/${_pkgname}/archive/v${pkgver}.tar.gz"
        'fix.patch')
sha256sums=('cf51543709abe364d8ecfb5c09a2b533d2b725ea1a66f203509b21a8e9d8f1a1'
            'bddaf0280f43a73ad60d092dd377e575360392e1a607702d0df3041af7cbd3ac')

prepare() {
  cd ${srcdir}

  # fix a build error on mingw-w64-headers-git
  patch -Np0 -i fix.patch
}

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

check() {
  cd ${srcdir}
  for _arch in ${_architectures}; do
    pushd "${_pkgname}-build-${_arch}"
    # this is actually build tests only, not execute test
    make ${BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran tests
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
