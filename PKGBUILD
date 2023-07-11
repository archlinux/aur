# Maintainer: eDgar [edgar [is here] openmail {dot} cc>
# Contributor (creator): Bruno Pagani <archange@archlinux.org>

# I could not find a repo for this package. I don't even
# know how I have it. I am reposting it on AUR in the hope
# that it's useful. It is my wish that it remains free
# software (as in free speech). If you want to take over it,
# please let me know. I will add you as a co-maintainer, but
# will keep ownership to make sure that it remains free.

_pkgname=CGNS
pkgname=cgns-parallel
pkgver=4.4.0
pkgrel=1
pkgdesc="Standard for recording and recovering computer data associated with the numerical solution of fluid dynamics equations"
arch=(x86_64)
url="https://cgns.github.io/"
license=(custom)
depends=(tk hdf5 libxmu glu)
makedepends=(gcc-fortran cmake)
options=(!makeflags staticlibs)
source=(https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('3b0615d1e6b566aa8772616ba5fd9ca4eca1a600720e36eadd914be348925fe2')
provides=(cgns)
conflicts=(cgns)


build() {
    CONFOPTS=(
      -D CGNS_BUILD_CGNSTOOLS=ON
      -D CGNS_BUILD_SHARED=ON
      -D CGNS_ENABLE_64BIT=ON
      -D CGNS_ENABLE_FORTRAN=ON
      -D CGNS_ENABLE_HDF5=ON
      -D CGNS_ENABLE_LEGACY=ON
      -D CGNS_ENABLE_SCOPING=OFF
      -D CGNS_ENABLE_PARALLEL=ON
      -D CMAKE_C_COMPILER=mpicc
      -D CMAKE_Fortran_COMPILER=mpif90
      -D MPIEXEC=mpiexec
      # Needed in HDF5:
      #   -DHDF5_ENABLE_Z_LIB_SUPPORT=ON
      #   -DHDF5_ENABLE_SZIP_SUPPORT=ON
      #   -DHDF5_ENABLE_SZIP_ENCODING=ON
      -D HDF5_NEED_MPI=ON
      -D HDF5_NEED_SZIP=ON
      -D HDF5_NEED_ZLIB=ON
      -D CGNS_ENABLE_TESTS=ON
      -D CMAKE_BUILD_TYPE="Release"
      -D CMAKE_INSTALL_PREFIX=/usr
      -D CMAKE_SKIP_RPATH=ON
    )
    cmake -B build -S ${_pkgname}-${pkgver} ${CONFOPTS[@]}
    make -C build
}

check() {
    LD_LIBRARY_PATH="${srcdir}"/build/src/ make -C build test
}

package() {
    make -C build DESTDIR="${pkgdir}" install
    install -Dm644 ${_pkgname}-${pkgver}/license.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
