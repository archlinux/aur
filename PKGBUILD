# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=siesta
pkgver=5.0.0
pkgrel=1
pkgdesc="A first-principles materials simulation code using DFT"
arch=(x86_64 aarch64)
url="https://siesta-project.org/siesta/About/overview.html"
license=(GPL-3.0-only)
depends=(elpa metis fftw python libxc)
makedepends=(gcc-fortran ninja)
source=(https://gitlab.com/siesta-project/siesta/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('1ae1b6a50e6bad8503799bd55ce41de6851c243aacea48c3816d99ef996e9b0a')

prepare() {
  # Handling ELPA
  _elpaver=$( ls /usr/include | grep elpa | sed 's/elpa_openmp-//g' )
}

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $pkgname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_EXE_LINKER_FLAGS="-lelpa_openmp -lscalapack -lmpi" \
    -D SIESTA_WITH_ELPA=ON \
    -D SIESTA_WITH_OPENMP=ON \
    -D ELPA_INCLUDE_DIRS="/usr/include/elpa_openmp-$_elpaver/elpa;/usr/include/elpa_openmp-$_elpaver/modules" \
    -D ELPA_LINK_LIBRARIES="-lelpa_openmp" \
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
}
