# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=jdftx
pkgver=1.6.0
pkgrel=1
pkgdesc="Software for joint density functional theory"
arch=('x86_64')
url="http://jdftx.org"
license=('GPL')
depends=('gsl' 'fftw' 'libxc' 'scalapack' 'hdf5-openmpi' 'python')
makedepends=('cmake')
optdepends=('cuda: NVIDIA GPU support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shankar1729/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5f65a09235927fe18b547734d3de5f623561ddef795321df088e224a737ea817')

prepare() {
  mkdir "$srcdir/$pkgname-$pkgver/build"
  export LIBXC_PATH=/usr
  export JDFTX_LAUNCH="mpirun -np 2"
  
  # Enable CUDA if nvcc is in $PATH
  if [ $( echo -n $( which nvcc) | tail -c 4 ) == nvcc ]
  then
    export ACC=ON
    export JDFTX_SUFFIX="_gpu"
  else
    export ACC=OFF
  fi
}

build() {
  cd "$srcdir/$pkgname-$pkgver/build"
  LIBXC_PATH=/usr \
  cmake ../$pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DEnableScaLAPACK=ON \
        -DEnableHDF5=ON \
        -DEnableLibXC=ON \
        -DCompileNative=ON \
        -DLinkTimeOptimization=ON \
        -DEnableCUDA=$ACC \
        -DEnableCuSolver=$ACC \
        -DCUDA_NVCC_FLAGS="-O3 -ccbin /opt/cuda/bin"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
