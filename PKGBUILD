# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=namd
pkgver=2.12
pkgrel=1
pkgdesc="Scalable molecular dynamic engine"
url="http://www.ks.uiuc.edu/Research/namd/"
license=('custom')
arch=('x86_64')
depends=('openmpi' 'cuda-8.0' 'plumed' 'plumed-namd' 'fftw-static' 'tcl85-static' 'fakeroot' 'gsl' 'zlib' 'lapack' 'blas' 'gcc-libs')
makedepends=('make' 'gcc')
md5sums=('2a1191909b1ab03bf0205971ad4d8ee9'
         'cdec864324573d6a16a09d6503ae3f3e'
         'a1291b5f794008ce5b1912c9b806739c')
options=('staticlibs')

# You should download the source package from the VMD site and put it in the PKGBUILD folder
source=("local://NAMD_${pkgver}_Source.tar.gz"
        "charm++.patch"
        "namd.patch")

prepare() {
  cd ${srcdir}/NAMD_2.12_Source

  # patch NAMD
  patch -Np0 -i "${srcdir}/namd.patch"

  # patch and build Charm++
  tar -xf charm-6.7.1.tar
  cd charm-6.7.1

  patch -Np0 -i "${srcdir}/charm++.patch"

  MPICXX=mpicxx
  ./build charm++ mpi-linux-x86_64 --with-production

  # little test
  cd mpi-linux-x86_64/tests/charm++/megatest
  make pgm
  mpirun -n 2 ./pgm
}

build() {
  cd ${srcdir}/NAMD_2.12_Source

  # configure build and apply Plumed patch
  ./config Linux-x86_64-g++ --charm-arch mpi-linux-x86_64 --with-fftw3 --with-cuda
  plumed patch -p -e namd-2.12

  cd Linux-x86_64-g++
  make
}

package() {
  cd ${srcdir}/NAMD_2.12_Source/Linux-x86_64-g++

  make release

  mkdir ${pkgdir}/opt
  cp -ar NAMD_2.12_Linux-x86_64-MPI-CUDA ${pkgdir}/opt/namd

  # install license
  install -Dm644 NAMD_2.12_Linux-x86_64-MPI-CUDA/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

