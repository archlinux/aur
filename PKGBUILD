# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=fleur
pkgver=8.1
pkgrel=1
pkgdesc="A full-potential linearized augmented planewave code"
arch=(x86_64 aarch64)
url="https://www.flapw.de"
license=(MIT)
depends=(libxml2 elpa libxc fftw hdf5-openmpi)
makedepends=(cmake ninja gcc-fortran python vim)
checkdepends=(python-pytest python-py python-pytest-html)
source=(https://iffgit.fz-juelich.de/fleur/fleur/-/archive/MaX-R$pkgver/$pkgname-MaX-R$pkgver.tar.bz2
        libxc-f03.patch)
sha256sums=('6960e037c34e5b704cd79718ec34c7147ccbf06a16fef397c7e3316f47e99a39'
            'a69a6514d063fb928bf77c34481cd8c2ab5d2da3eaeb25f2b1367839f8875696')

prepare() {
  # Handling ELPA
  _elpaver=$( ls /usr/include | grep elpa | sed 's/elpa_openmp-//g' )

  cd "$pkgname-MaX-R$pkgver"
  patch -p1 -i ../libxc-f03.patch
}

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $pkgname-MaX-R$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_Fortran_COMPILER=mpifort \
    -D CMAKE_Fortran_FLAGS="-I/usr/include/elpa_openmp-$_elpaver/elpa -I/usr/include/elpa_openmp-$_elpaver/modules -I/usr/include -O2 -march=native" \
    -D CMAKE_C_FLAGS="-std=gnu89 -O2 -march=native" \
    -D CLI_FLEUR_USE_HDF5=ON \
    -D CLI_FLEUR_USE_ELPA="external" \
    -D CLI_ELPA_OPENMP=ON \
    -D CLI_FLEUR_USE_MPI=ON \
    -G Ninja \
    -W no-dev
  cmake --build build
}

check() {
  cd "$srcdir/build"
  export juDFT_MPI="mpirun --oversubscribe -np {mpi_procs} "
  export OMP_NUM_THREADS=1
  PYTEST_ADDOPTS="$srcdir/$pkgname-MaX-R$pkgver/testing --build_dir=$srcdir/build" \
    python -m pytest -p no:cacheprovider
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm755 "$srcdir/$pkgname-MaX-R$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
