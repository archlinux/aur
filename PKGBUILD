# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=fleur
pkgver=7.1
pkgrel=1
pkgdesc="A full-potential linearized augmented planewave code"
arch=(x86_64 aarch64)
url="https://www.flapw.de"
license=(MIT)
depends=(libxml2 elpa libxc fftw)
makedepends=(cmake ninja gcc-fortran python vim)
source=(https://iffgit.fz-juelich.de/fleur/fleur/-/archive/MaX-R$pkgver/$pkgname-MaX-R$pkgver.tar.bz2)
sha256sums=('e501bf146ca01889cd07234faf0e8b4deb78035d1a7783ea658a3a9ccc4bf781')

prepare() {
  # Handling ELPA
  _elpaver=$( ls /usr/include | grep elpa | sed 's/elpa_openmp-//g' )
}

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $pkgname-MaX-R$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_Fortran_COMPILER=mpifort \
    -D CMAKE_Fortran_FLAGS="-I/usr/include/elpa_openmp-$_elpaver/elpa -I/usr/include/elpa_openmp-$_elpaver/modules -O2 -march=native" \
    -D CMAKE_C_FLAGS="-std=gnu89 -O2 -march=native" \
    -D FLEUR_USE_HDF5=OFF \
    -D CLI_FLEUR_USE_HDF5=OFF \
    -D CLI_FLEUR_USE_ELPA="external" \
    -D CLI_ELPA_OPENMP=ON \
    -D CLI_FLEUR_USE_MPI=ON \
    -G Ninja \
    -W no-dev
  cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm755 "$srcdir/$pkgname-MaX-R$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
