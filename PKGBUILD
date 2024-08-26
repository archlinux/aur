# Maintainer: Tarn W. Burton twburton [at] gmail [dot] com
# Maintainer: Vedran Miletic <vedran AT miletic DOT net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_majorver=22
_archivever="23_rc6"

pkgname=ambertools
pkgver=23.00
pkgrel=2
pkgdesc="Biomolecular simulation package (tools only)"
url="http://ambermd.org/"
license=(GPL LGPL)
arch=(x86_64)
depends=(blas boost bzip2 fftw lapack netcdf python-mpi4py
         python-scipy readline tk zlib gcc13-libs)
makedepends=(cmake cuda openmpi cython gcc13-fortran)
optdepends=('cuda: GPU acceleration support'
            'openmpi: MPI support')
options=(!buildflags)

source=("https://ambermd.org/downloads/AmberTools${_archivever}.tar.bz2"
        "0001-Include-internal-pycore-frame.patch"
        "0002-Allow-using-newer-CUDA.patch"
        "50-ambertools.conf")
sha256sums=('debb52e6ef2e1b4eaa917a8b4d4934bd2388659c660501a81ea044903bf9ee9d'
            'e9b5548061e836eda0bf4213c13fb31e7b20f20167524bf8014fa2c6c9e42f62'
            '3883d78b6d3b641395928ba4330d94f997c2d2c88035eca5bfea7bda568d2ef3'
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
  cd ${srcdir}/amber${_majorver}_src/AmberTools/src/pytraj

  python setup.py --cythonize
  patch -p1 -i ${srcdir}/0001-Include-internal-pycore-frame.patch

  cd ${srcdir}/amber${_majorver}_src

  patch -p1 -i ${srcdir}/0002-Allow-using-newer-CUDA.patch

  mkdir -p build
  cd build

  CC=gcc-13 CXX=g++-13 FC=gfortran-13 MPICH_CC=gcc-13 \
    MPICH_CXX=g++-13 MPICH_F90=gfortran-13 MPICH_FC=gfortran-13 \
    cmake .. -DCMAKE_INSTALL_PREFIX=/opt/amber \
    -DCOMPILER=MANUAL -DCUDA=TRUE -DMPI=TRUE \
    -DDOWNLOAD_MINICONDA=FALSE -DBUILD_GUI=TRUE \
    -DCHECK_UPDATES=FALSE -DTRUST_SYSTEM_LIBS=TRUE

  make
}

package() {
  cd ${srcdir}/amber${_majorver}_src/build

  make DESTDIR=${pkgdir} install

  install -Dm755 ${srcdir}/50-ambertools.conf ${pkgdir}/usr/local/lib/environment.d/50-ambertools.conf
}
