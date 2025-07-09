# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=lapack-git
pkgname=('lapack-git' 'blas-git' 'lapacke-git')
pkgver=3.12.1.r53.gefbd2fdf4
pkgrel=1
pkgdesc="Linear Algebra PACKage"
arch=('i686' 'x86_64')
url="https://www.netlib.org/lapack/"
license=('LicenseRef-lapack')
makedepends=('git' 'gcc-fortran' 'cmake' 'python' 'doxygen')
source=("git+https://github.com/Reference-LAPACK/lapack.git")
sha256sums=('SKIP')


pkgver() {
  cd "lapack"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "lapack"

  doxygen "DOCS/Doxyfile_man"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_Fortran_COMPILER=gfortran \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_DEPRECATED=ON \
    -DCBLAS=ON \
    -DLAPACKE_WITH_TMG=ON \
    ./
  cmake --build "_build"
}

package_lapack-git() {
  depends=('gcc-libs' 'blas')
  provides=("lapack=$pkgver" 'lapack-manpages')
  conflicts=('lapack' 'lapack-manpages')

  cd "lapack"
  DESTDIR="$pkgdir" cmake --install "_build"

  rm -r "$pkgdir/usr/include"
  rm -r "$pkgdir/usr/lib"/{libblas.*,libcblas.*,liblapacke.*}
  rm -r "$pkgdir/usr/lib/cmake"/{cblas*,lapacke*}
  rm -r "$pkgdir/usr/lib/pkgconfig"/{blas.*,cblas.*,lapacke.*}

  install -dm755 "$pkgdir/usr/share"
  cp -r "DOCS/man" "$pkgdir/usr/share"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/lapack"
}

package_blas-git() {
  pkgdesc="Basic linear algebra subprograms"
  url="https://www.netlib.org/blas/"
  depends=('gcc-libs')
  provides=("blas=$pkgver" "cblas=$pkgver")
  conflicts=('blas' 'cblas')

  cd "lapack"

  DESTDIR="$pkgdir" cmake --install "_build/BLAS"
  DESTDIR="$pkgdir" cmake --install "_build/CBLAS"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/blas"
}

package_lapacke-git() {
  pkgdesc="C Interface to LAPACK"
  url="https://www.netlib.org/lapack/lapacke.html"
  depends=('glibc' 'lapack')
  provides=("lapacke=$pkgver")
  conflicts=('lapacke')

  cd "lapack"

  DESTDIR="$pkgdir" cmake --install "_build/LAPACKE"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/lapacke"
}
