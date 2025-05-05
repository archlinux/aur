# Maintainer: Tarn W. Burton twburton [at] gmail [dot] com
# Maintainer: Vedran Miletic <vedran AT miletic DOT net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_majorver=25
_archivedir="ambertools"
_archivever="25_rc7"

pkgname=ambertools
pkgver=25.00
pkgrel=1
pkgdesc="Biomolecular simulation package (tools only)"
url="http://ambermd.org/"
license=('GPL-3.0-or-later AND LGPL-3.0-or-later AND BSD-3-Clause AND MIT')
arch=(x86_64)
depends=(blas boost bzip2 fftw lapack netcdf python-matplotlib
         python-scipy readline tk zlib gcc14-libs)
makedepends=(cmake cython gcc14-fortran)
optdepends=('cuda: GPU acceleration support'
            'openmpi: MPI support'
            'mpich: MPI support'
            'python-mpi4py: MPI support (Python tools)')
options=(!buildflags)

source=("https://ambermd.org/downloads/ambertools${_archivever}.tar.bz2"
        "0001-Use-cxx14-for-Boost.patch"
        "0002-NumPy-2-compatibility.patch"
        "50-ambertools.conf")
sha256sums=('ac009b2adeb25ccd2191db28905b867df49240e038dc590f423edf0d84f8a13b'
            '216de362c73dce1b214be2c12f8f31913f83bb22863ae15311dc3336c70b2bd8'
            '4104d0dc4c381930c100b11a198bb1b16c89d1f6b5071e4e6be542d2f1492e8e'
            '38835459f9710fc33bf2a96f4dfa26aef08d21754aec2e297032c214c4e781ef')

prepare() {
  cd ${srcdir}/${_archivedir}${_majorver}_src
  ./update_amber --update
}

pkgver() {
  cd ${srcdir}/${_archivedir}${_majorver}_src
  ./update_amber --version | grep -oE '[0-9]+\.[0-9]+'
}

build() {
  cd ${srcdir}/${_archivedir}${_majorver}_src/AmberTools/src/pytraj

  python setup.py --cythonize

  cd ${srcdir}/${_archivedir}${_majorver}_src

  patch -p1 -i ${srcdir}/0001-Use-cxx14-for-Boost.patch
  patch -p1 -i ${srcdir}/0002-NumPy-2-compatibility.patch

  mkdir -p build
  cd build

  CC=gcc-14 CXX=g++-14 FC=gfortran-14 MPICH_CC=gcc-14 \
    MPICH_CXX=g++-14 MPICH_F90=gfortran-14 MPICH_FC=gfortran-14 \
    cmake .. -DCMAKE_INSTALL_PREFIX=/opt/amber \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCOMPILER=MANUAL -DOPENMP=TRUE \
    -DDOWNLOAD_MINICONDA=FALSE -DBUILD_GUI=TRUE \
    -DCHECK_UPDATES=FALSE -DTRUST_SYSTEM_LIBS=TRUE \
    #-DMPI=TRUE -DCUDA=TRUE
# Uncommment and modify the line above to enable MPI and/or CUDA support

  make
}

package() {
  cd ${srcdir}/${_archivedir}${_majorver}_src/build

  make DESTDIR=${pkgdir} install

  install -Dm755 ${srcdir}/50-ambertools.conf ${pkgdir}/usr/local/lib/environment.d/50-ambertools.conf
}
