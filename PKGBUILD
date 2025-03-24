# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=cp2k
pkgver=2025.1
pkgrel=2
pkgdesc="A quantum chemistry and solid state physics software package"
arch=(x86_64)
url="https://www.cp2k.org"
license=(GPL-2.0-only)
depends=(dbcsr fftw-openmpi elpa spglib cosma spla libxc libint2)
makedepends=(gcc-fortran python cmake ninja fypp)
checkdepends=(numactl)
source=("$pkgname-$pkgver.tar.gz::https://github.com/cp2k/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('65c8ad5488897b0f995919b9fa77f2aba4b61677ba1e3c19bb093d5c08a8ce1d')
options=(!lto)

prepare() {
  sed -i "s@DBCSR 2.6@DBCSR@" "$srcdir/$pkgname-$pkgver/CMakeLists.txt"
}

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $pkgname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_Fortran_FLAGS="-O2 -march=native -g" \
    -D CP2K_ENABLE_REGTESTS=ON \
    -D CP2K_USE_MPI_F08=ON \
    -D CP2K_USE_LIBINT2=ON \
    -D CP2K_USE_ELPA=ON \
    -D CP2K_USE_LIBXC=ON \
    -D CP2K_USE_LIBXSMM=ON \
    -D CP2K_USE_SPGLIB=ON \
    -D CP2K_USE_COSMA=ON \
    -D CP2K_USE_SPLA=ON \
    -G Ninja \
    -W no-dev
  cmake --build build
}

check() {
  export CP2K_DATA_DIR="$srcdir/$pkgname-$pkgver/data/"
  export _corenumber=$( grep -c ^processor /proc/cpuinfo )

  cd "$srcdir/$pkgname-$pkgver"
  ./tests/do_regtest.py "$srcdir/build/bin" psmp \
    --mpiranks 2 \
    --ompthreads 1 \
    --maxtasks $(( $_corenumber/2 ))
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
}
