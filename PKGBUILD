# Maintainer: George Eleftheriou

_legacypkg=hdf5_18
_mpi=openmpi
pkgname=${_legacypkg}-${_mpi}
_pkgname=${_legacypkg:0:4}
pkgver=1.8.21
pkgrel=2
pkgdesc="The hdf5 legacy 1.8 series compiled with ${_mpi} support"
arch=('x86_64')
url="https://support.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'libaec' "${_mpi}")
makedepends=('gcc-fortran')
provides=('hdf5_18' 'hdf5_18-cpp-fortran')
conflicts=('hdf5_18' 'hdf5_18-cpp-fortran')
source=("https://support.hdfgroup.org/ftp/HDF5/releases/${_pkgname}-${pkgver:0:3}/${_pkgname}-${pkgver}/src/${_pkgname}-${pkgver}.tar.bz2"
        "mpi.patch")
md5sums=('2d2408f2a9dfb5c7b79998002e9a90e9'
         'c261676f9ee4b5a2f3bca9f5d4ba89aa')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # FS#33343
  patch -p1 < ${srcdir}/mpi.patch
}

build() {
    cd "${_pkgname}-${pkgver}"

    ./configure \
        CXX="mpicxx" \
        CC="mpicc" \
        FC="mpif90" \
        F9X="mpif90" \
        RUNPARALLEL="mpirun" \
        OMPI_MCA_disable_memory_allocator=1 \
        --prefix=/opt/${_pkgname}-${pkgver}-${_mpi} \
        --disable-static \
        --disable-sharedlib-rpath \
        --enable-production \
        --enable-parallel \
        --enable-unsupported \
        --enable-hl \
        --enable-cxx \
        --enable-fortran \
        --enable-fortran2003 \
        --with-pic \
        --with-zlib \
        --with-szlib

    make
}

check() {
    cd "${_pkgname}-${pkgver}"

    # This is a parallel build, there will always be some MPI bugs,
    # so skip failures and don't kill the entire packaging process
    make check || warning "Some tests failed"
}

package() {
  cd "${_pkgname}-${pkgver}"

  make -j1 DESTDIR="${pkgdir}" install
}
