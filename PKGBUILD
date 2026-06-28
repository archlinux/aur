# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=cp2k
pkgver=2026.1
pkgrel=1
pkgdesc="A quantum chemistry and solid state physics software package"
arch=(x86_64 aarch64)
url="https://www.cp2k.org"
license=(GPL-2.0-only)
depends=(dbcsr fftw-openmpi elpa spglib cosma spla libxc libint2 sirius hdf5)
makedepends=(gcc-fortran python cmake ninja fypp)
checkdepends=(numactl)
source=("$pkgname-$pkgver.tar.gz::https://github.com/cp2k/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('4364c74bcffaa474bc234e11686b09550e4d06932acf2147a341e4f7679dd88e')
options=(!lto)

prepare() {
  # adopt the upstream-relaxed N2 tolerance
  sed -i '/"N2.inp"/s/tol=1.0E-9/tol=5.0E-8/' \
    "$pkgname-$pkgver/tests/SIRIUS/regtest-1/TEST_FILES.toml"
}

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $pkgname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_Fortran_FLAGS="-O2 -march=native -g" \
    -D CP2K_ENABLE_REGTESTS=ON \
    -D CP2K_USE_MPI=ON \
    -D CP2K_USE_MPI_F08=ON \
    -D CP2K_USE_LIBINT2=ON \
    -D CP2K_USE_ELPA=ON \
    -D CP2K_USE_LIBXC=ON \
    -D CP2K_USE_SPGLIB=ON \
    -D CP2K_USE_COSMA=ON \
    -D CP2K_USE_SPLA=ON \
    -D CP2K_USE_SIRIUS=ON \
    -D CP2K_USE_FFTW3=ON \
    -D CP2K_USE_HDF5=ON \
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
