# Maintainer: Tarn W. Burton twburton [at] gmail [dot] com
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_majorver=22
_patchver="jlmrcc"

pkgname=ambertools
pkgver=22.03
pkgrel=1
pkgdesc="Biomolecular simulation package (tools only)"
url="http://ambermd.org/"
license=(GPL LGPL)
arch=(x86_64)
depends=(blas boost bzip2 fftw gcc11-fortran lapack netcdf
         python-scipy readline tk zlib)
makedepends=(cmake cuda openmpi)
optdepends=('cuda: GPU acceleration support'
            'openmpi: MPI support')
options=(!buildflags)

source=("https://ambermd.org/downloads/AmberTools${_majorver}${_patchver}.tar.bz2"
        "50-ambertools.conf")
sha256sums=('1571d4e0f7d45b2a71dce5999fa875aea8c90ee219eb218d7916bf30ea229121'
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

  mkdir -p build
  cd build

  CC=gcc-11 CXX=g++-11 FC=gfortran-11 MPICH_CC=gcc-11 \
    MPICH_CXX=g++-11 MPICH_F90=gfortran-11 MPICH_FC=gfortran-11 \
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
