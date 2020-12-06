# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=lsdalton
pkgver=2020.0
pkgrel=1
pkgdesc="A linear-scaling HF and DFT code suitable for large molecular systems"
arch=("x86_64")
url="https://daltonprogram.org"
license=('LGPL2.1')
depends=('scalapack' 'python-cffi' 'hdf5')
makedepends=('cmake' 'gcc-fortran')
conflicts=("$pkgname-git")
source=("https://gitlab.com/dalton/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha256sums=('9ecc0087be030c462c7ca6c0666de4223d43ef90866b1b6defc388a608ed5896')

prepare() {
  cd "$srcdir/$pkgname-v$pkgver"
  mkdir -p ../build
  _MPI_FLAGS=$( mpifort -show | sed 's/.*-L/-L/' )
  _MPI_INCLUDE="-I/usr/include -pthread -I/usr/lib/openmpi"
  
  # Fixing ScaLAPACK
  sed -i 's/mkl_scalapack${_lib_suffix}/scalapack/g' cmake/math/MathLibs.cmake
  sed -i 's/mkl_blacs_openmpi${_lib_suffix}/scalapack/g' cmake/math/MathLibs.cmake
  
  # Fixing CUDA
  sed -i '/VAR_PGI/d' src/cuda/BlockedDgemm.F90
  sed -i '/:: acc_get_cuda_stream/{n;d}' src/cuda/BlockedDgemm.F90
  
  # Checking if nvcc is in the PATH variable
  if [ $( echo -n $( which nvcc ) | tail -c 4 ) == nvcc ]
  then
      export _ACC=ON
      echo "GPU is enabled"
  else
      export _ACC=OFF
      echo "GPU is disabled"
  fi
}

build() {
  cd "$srcdir/build"
  cmake ../$pkgname-v$pkgver \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_Fortran_FLAGS="$_MPI_INCLUDE $FCFLAGS -fallow-argument-mismatch" \
          -DCMAKE_EXE_LINKER_FLAGS="$_MPI_FLAGS -lscalapack -lhdf5 -lgomp" \
          -DBUILD_SHARED_LIBS=ON \
          -DENABLE_OPENMP=ON \
          -DENABLE_OMP=ON \
          -DENABLE_MPI=ON \
          -DENABLE_OPENACC=ON \
          -DENABLE_PYTHON_INTERFACE=ON \
          -DXCFUN_PYTHON_INTERFACE=ON \
          -DENABLE_SCALAPACK=ON \
          -DBLACS_IMPLEMENTATION=openmpi \
          -DQCMATRIX_ENABLE_HDF5=ON \
          -DHDF5_ROOT=/usr \
          -DENABLE_GPU=$_ACC \
          -DENABLE_CUDA=$_ACC \
          -DENABLE_CUBLAS=$_ACC
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  cd "$pkgdir/usr"
  install -dm755 include/openrsp
  mv openrsp/include/* include/openrsp
  rm -rf openrsp
  chmod 644 lib/liblsdalton.a
}
