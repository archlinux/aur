# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=jdftx
pkgver=1.7.0
pkgrel=1
pkgdesc="Software for joint density functional theory"
arch=('x86_64')
url="http://jdftx.org"
license=('GPL')
depends=('gsl' 'fftw' 'libxc' 'scalapack' 'hdf5-openmpi' 'python')
makedepends=('cmake')
optdepends=('cuda: NVIDIA GPU support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shankar1729/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('876374efbf785d02fdf547f7cf64deedc6f5618f5449e775a4c20b28f1696e3d')

prepare() {
  mkdir "$srcdir/$pkgname-$pkgver/build"
  export LIBXC_PATH=/usr
  export JDFTX_LAUNCH="mpirun -np 2"
  
  # Enable CUDA if nvcc is available
  if command -v nvcc &> /dev/null
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
        -DForceScaLAPACK=ON \
        -DEnableHDF5=ON \
        -DEnableLibXC=ON \
        -DEnableMKL=OFF \
        -DForceFFTW=ON \
        -DCompileNative=ON \
        -DLinkTimeOptimization=ON \
        -DEnableCUDA=$ACC \
        -DEnableCuSolver=$ACC \
        -DCudaAwareMPI=$ACC
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
