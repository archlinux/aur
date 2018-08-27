# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=lapack-git
pkgname=('lapack-git' 'blas-git' 'lapacke-git')
pkgver=3.8.0.r70.g9fb29d8e
pkgrel=2
pkgdesc="Linear Algebra PACKage"
arch=('i686' 'x86_64')
url="https://www.netlib.org/lapack/"
license=('custom')
makedepends=('git' 'gcc-fortran' 'cmake' 'python' 'doxygen')
source=("git+https://github.com/Reference-LAPACK/lapack.git")
sha256sums=('SKIP')


pkgver() {
  cd "lapack"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

  mkdir -p "$srcdir/_build"
}

build() {
  cd "lapack"

  doxygen "DOCS/Doxyfile_man"

  cd "$srcdir/_build"
  cmake \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_Fortran_COMPILER=gfortran \
    -DCBLAS=ON \
    -DLAPACKE_WITH_TMG=ON \
    -DBUILD_DEPRECATED=ON \
    ../lapack
  make
}

package_lapack-git() {
  depends=('gcc-libs' 'blas')
  provides=('lapack' 'lapack-manpages')
  conflicts=('lapack' 'lapack-manpages')

  cd "$srcdir/_build"
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/include"
  rm -r "$pkgdir/usr/lib"/{libblas.*,libcblas.*,liblapacke.*}
  rm -r "$pkgdir/usr/lib/cmake"/{cblas*,lapacke*}
  rm -r "$pkgdir/usr/lib/pkgconfig"/{blas.*,cblas.*,lapacke.*}

  mkdir -p "$pkgdir/usr/share"
  cp -r "$srcdir/lapack/DOCS/man" "$pkgdir/usr/share"

  install -Dm644 "$srcdir/lapack/LICENSE" "$pkgdir/usr/share/licenses/lapack/LICENSE"
}

package_blas-git() {
  pkgdesc="Basic linear algebra subprograms"
  url="https://www.netlib.org/blas/"
  provides=('cblas' 'blas')
  conflicts=('cblas' 'blas')

  cd "$srcdir/_build/BLAS"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/_build/CBLAS"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/lapack/LICENSE" "$pkgdir/usr/share/licenses/blas/LICENSE"
}

package_lapacke-git() {
  pkgdesc="C Interface to LAPACK"
  url="https://www.netlib.org/lapack/lapacke.html"
  depends=('glibc' 'lapack')
  provides=('lapacke')
  conflicts=('lapacke')

  cd "$srcdir/_build/LAPACKE"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/lapack/LICENSE" "$pkgdir/usr/share/licenses/lapacke/LICENSE"
}
