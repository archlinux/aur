# Maintainer: Tarn W. Burton twburton [at] gmail [dot] com
# Maintainer: Vedran Miletic <vedran AT miletic DOT net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_majorver=24
_archivever="24_rc5"

pkgname=ambertools
pkgver=24.00
pkgrel=2
pkgdesc="Biomolecular simulation package (tools only)"
url="http://ambermd.org/"
license=('GPL-3.0-or-later AND LGPL-3.0-or-later AND BSD-3-Clause AND MIT')
arch=(x86_64)
depends=(blas boost bzip2 fftw lapack netcdf python-matplotlib
         python-scipy readline tk zlib gcc13-libs)
makedepends=(cmake cython gcc13-fortran)
optdepends=('cuda: GPU acceleration support'
            'openmpi: MPI support'
            'mpich: MPI support'
            'python-mpi4py: MPI support (Python tools)')
options=(!buildflags)

source=("https://ambermd.org/downloads/AmberTools${_archivever}.tar.bz2"
        "0001-Allow-using-newer-CUDA.patch"
        "50-ambertools.conf")
sha256sums=('52fb4fb3370a89b7ce738a2dc3e513c2fc1943fde4b4381846d9e75cc48d840f'
            'e5da8dd8bc22a98142e36dcf336d8d008378070b4aa4389d8aa75a25a2041f9a'
            '38835459f9710fc33bf2a96f4dfa26aef08d21754aec2e297032c214c4e781ef')

prepare() {
  cd ${srcdir}/amber${_majorver}_src
  ./update_amber --update
}

pkgver() {
  cd ${srcdir}/amber${_majorver}_src
  ./update_amber --version | grep -oE '[0-9]+\.[0-9]+'
}

build() {
  cd ${srcdir}/amber${_majorver}_src

  patch -p1 -i ${srcdir}/0001-Allow-using-newer-CUDA.patch

  mkdir -p build
  cd build

  CC=gcc-13 CXX=g++-13 FC=gfortran-13 MPICH_CC=gcc-13 \
    MPICH_CXX=g++-13 MPICH_F90=gfortran-13 MPICH_FC=gfortran-13 \
    cmake .. -DCMAKE_INSTALL_PREFIX=/opt/amber \
    -DCOMPILER=MANUAL -DOPENMP=TRUE \
    -DDOWNLOAD_MINICONDA=FALSE -DBUILD_GUI=TRUE \
    -DCHECK_UPDATES=FALSE -DTRUST_SYSTEM_LIBS=TRUE \
    #-DMPI=TRUE -DCUDA=TRUE
# Uncommment and modify the line above to enable MPI and/or CUDA support

  make
}

package() {
  cd ${srcdir}/amber${_majorver}_src/build

  make DESTDIR=${pkgdir} install

  install -Dm755 ${srcdir}/50-ambertools.conf ${pkgdir}/usr/local/lib/environment.d/50-ambertools.conf
}
