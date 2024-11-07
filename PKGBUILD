# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=cp2k
pkgver=2024.3
pkgrel=2
pkgdesc="A quantum chemistry and solid state physics software package"
arch=(x86_64)
url="https://www.cp2k.org"
license=(GPL-2.0-only)
depends=(dbcsr fftw-openmpi elpa)
makedepends=(gcc-fortran python cmake ninja fypp)
checkdepends=(numactl)
source=("$pkgname-$pkgver.tar.gz::https://github.com/cp2k/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('a6eeee773b6b1fb417def576e4049a89a08a0ed5feffcd7f0b33c7d7b48f19ba')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s@DBCSR 2.6@DBCSR@" CMakeLists.txt
}

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $pkgname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CP2K_USE_MPI_F08=ON \
    -D CP2K_USE_ELPA=ON \
    -D CP2K_USE_LIBXC=OFF \
    -D CP2K_USE_LIBXSMM=ON \
    -G Ninja \
    -W no-dev
  cmake --build build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
}
