# Maintainer: George Eleftheriou

pkgname=hdf5_18-openmpi
_pkgname=hdf5
pkgver=1.8.19
pkgrel=1
pkgdesc="The hdf5 legacy 1.8 series compiled with openmpi support"
arch=('i686' 'x86_64')
url="https://support.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'openmpi')
makedepends=('gcc-fortran')
provides=('hdf5_18' 'hdf5_18-cpp-fortran')
conflicts=('hdf5_18' 'hdf5_18-cpp-fortran')
source=("https://support.hdfgroup.org/ftp/HDF5/releases/${_pkgname}-${pkgver:0:3}/${_pkgname}-${pkgver}/src/${_pkgname}-${pkgver}.tar.bz2"
        "mpi.patch")
md5sums=('6f0353ee33e99089c110a1c8d2dd1b22'
         'b7165950c96ba4a2540984d07886accf')

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
  --prefix=/opt/${_pkgname}-${pkgver}-openmpi \
  --enable-production \
  --enable-parallel \
  --enable-unsupported \
  --enable-using-memchecker --enable-clear-file-buffers \
  --enable-hl \
  --enable-cxx \
  --enable-fortran \
  --enable-fortran2003 \
  --with-pic \
  --docdir=/opt/share/doc/hdf5 \
  --disable-static \
  --disable-sharedlib-rpath \
  --with-zlib

  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make -j1 DESTDIR="${pkgdir}" install
}
