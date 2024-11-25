# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=spfft
_pkgname=SpFFT
pkgver=1.1.0
pkgrel=1
pkgdesc="Sparse 3D FFT library with MPI, OpenMP, CUDA and ROCm support"
arch=(x86_64 aarch64)
url="https://github.com/eth-cscs/SpFFT"
license=(BSD)
depends=(fftw)
makedepends=(cmake ninja gcc-fortran)
provides=(spfft)
conflicts=(spfft-cuda-git)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('d4673b3135aebfa1c440723226fe976d518ff881285b3d4787f1aa8210eac81e')

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $_pkgname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D MKLSequential_FFTW_INCLUDE_DIRS='' \
    -D MKLSequential_INCLUDE_DIRS='' \
    -D MKLSequential_FOUND=OFF \
    -D SPFFT_FORTRAN=ON \
    -D SPFFT_MPI=ON \
    -D SPFFT_OMP=ON \
    -D SPFFT_GPU_BACKEND=$_ACC \
    -G Ninja \
    -W no-dev
  cmake --build build
}

check() {
  cd "$srcdir/build"
  ctest
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm755 $_pkgname-$pkgver/LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
