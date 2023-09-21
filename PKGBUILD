# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Jiaxi Hu < sftrytry at gmail dot com >

_pkgname=OpenBLAS
_blasver=3.11.0
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
BUILDFLAG="USE_OPENMP=1 USE_THREAD=1 USE_TLS=1 DYNAMIC_ARCH=1 CROSS=1 HOSTCC=gcc"

pkgname=mingw-w64-openblas-lapack
pkgver=0.3.24
pkgrel=1
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD (mingw-w64)"
arch=('any')
url="https://www.openblas.net/"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('perl'
             'mingw-w64-gcc')
provides=('mingw-w64-openblas'
          "mingw-w64-blas=$_blasver"
          "mingw-w64-cblas=$_blasver"
          "mingw-w64-lapack=$_blasver"
          "mingw-w64-lapacke=$_blasver")
conflicts=('mingw-w64-openblas'
           'mingw-w64-blas'
           'mingw-w64-cblas'
           'mingw-w64-lapack'
           'mingw-w64-lapacke')
options=('!strip' 'staticlibs' '!buildflags')
source=("${_pkgname}-v${pkgver}.tar.gz::https://github.com/xianyi/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ceadc5065da97bd92404cac7254da66cc6eb192679cf1002098688978d4d5132')

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

    LANG=C make ${_BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran shared
    popd
  done
}

package() {
  cd ${srcdir}
  for _arch in ${_architectures}; do
    pushd "${_pkgname}-build-${_arch}"

    if [ "${_arch}" = "i686-w64-mingw32" ]
    then
      _BUILDFLAG="${BUILDFLAG} BINARY=32"
    else
      _BUILDFLAG="${BUILDFLAG} BINARY=64"
    fi

    LANG=C make -j 1 ${_BUILDFLAG} CC=${_arch}-gcc FC=${_arch}-gfortran PREFIX="/usr/${_arch}" DESTDIR="${pkgdir}" install
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

    cd "${pkgdir}/usr/${_arch}/lib/pkgconfig/"
    ln -sf openblas.pc blas.pc
    ln -sf openblas.pc cblas.pc
    ln -sf openblas.pc lapack.pc
    ln -sf openblas.pc lapacke.pc

    popd
  done

  cd "${_pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
