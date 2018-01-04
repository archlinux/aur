# Maintainer: George Eleftheriou

pkgname=hdf5_18-openmpi
_pkgname=hdf5
pkgver=1.8.20
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
sha512sums=('288e4772a946d406de9096843c92dd6874a0753ed6fbe859aaadf565aa0509fc612ebdb00c301b7955bc0dc63e45f3a224c6b2638f480fe6738ee0c96a993c6e'
            '57a0a0cadf30642facb46b88f248f336df92d9e444354e848a34e96fd958d4f332e683ab63491e3c141fe81dc0612313df32c4a9c6edd96b9b967f5334a59dc9')

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
  --disable-static \
  --disable-sharedlib-rpath \
  --with-zlib

  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make -j1 DESTDIR="${pkgdir}" install
}
