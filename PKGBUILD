# vim:set ts=2 sw
# Maintainer: Simon Pintarelli <simon.pintarelli@cscs.ch>
pkgname=spfft-cuda-git
_pkgname=spfft
pkgver=r31.69e08b7
pkgrel=1
pkgdesc="3D FFT used in plane-wave DFT codes."
arch=('i686' 'x86_64')
url="https://github.com/eth-cscs/spFFT"
license=('GPL')
depends=(fftw cuda openmpi)
makedepends=(cmake)
provides=('spFFT')
options=('staticlibs')
source=("${_pkgname}::git+https://github.com/eth-cscs/spFFT.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_pkgname}"
  mkdir -p build
  cd build
  cmake -DSPFFT_OMP=On \
        -DSPFFT_MPI=On \
        -DSPFFT_GPU_BACKEND=CUDA \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ../
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  cd build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
