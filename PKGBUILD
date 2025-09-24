pkgname=eigen-git
_pkgname=eigen
pkgver=3.4.r1426.gdbd25f6
pkgrel=1
pkgdesc='Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra'
arch=(x86_64)
url='https://eigen.tuxfamily.org'
license=(MPL-2.0 Apache-2.0
         BSD-3-Clause Minpack
         'LGPL-2.1-only OR LGPL-2.1-or-later')
depends=(gcc-libs
         glibc)
makedepends=(cmake
             fftw
             freeglut
             gcc-fortran
             git
             suitesparse)
source=(git+https://gitlab.com/libeigen/eigen)
sha1sums=('SKIP')
provides=('eigen')
conflicts=('eigen')

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "$(git describe --long --tags --abbrev=7 --exclude=nightly | sed 's/^before-//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # install custom licenses
  install -Dm644 $_pkgname/COPYING.* -t "$pkgdir/usr/share/licenses/$_pkgname"
}
