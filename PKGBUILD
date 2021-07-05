# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=spfft
_pkgname=SpFFT
pkgver=1.0.4
pkgrel=1
pkgdesc="Sparse 3D FFT library with MPI, OpenMP, CUDA and ROCm support"
arch=("x86_64")
url="https://github.com/eth-cscs/SpFFT"
license=('BSD')
depends=('fftw')
makedepends=('cmake' 'gcc-fortran')
optdepends=('cuda: GPU support')
provides=('spfft')
conflicts=('spfft-cuda-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7f04c0cff7dad825ec666c3a42b27583e65b6bcb8592245ecf06f96cc5a4938e')

prepare() {
  mkdir "$srcdir/build"
  
  # Checking if nvcc is in PATH
  if [ $( echo -n $( which nvcc) | tail -c 4 ) == nvcc ]
  then
      export _ACC=CUDA
      export LDFLAGS="$LDFLAGS -L/opt/cuda/lib64"
      echo "GPU is enabled"
  else
      export _ACC=OFF
      echo "GPU is disabled"
  fi
}

build() {
  cd "$srcdir/build"
  cmake ../$_pkgname-$pkgver \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DMKLSequential_FFTW_INCLUDE_DIRS='' \
          -DMKLSequential_INCLUDE_DIRS='' \
          -DSPFFT_FORTRAN=ON \
          -DSPFFT_MPI=ON \
          -DSPFFT_OMP=ON \
          -DSPFFT_GPU_BACKEND=$_ACC \
          -DMKLSequential_FOUND=OFF
  make CUDA_FLAGS="-O3 -Xcompiler=-fPIC"
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install ../$_pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname
}
