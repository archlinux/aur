# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=lapack-git
pkgname=('lapack-git' 'blas-git' 'lapacke-git')
pkgver=3.9.0.r106.g122506cd8
pkgrel=1
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
  make -C "_build"
}

package_lapack-git() {
  depends=('gcc-libs' 'blas')
  provides=('lapack' 'lapack-manpages')
  conflicts=('lapack' 'lapack-manpages')

  cd "lapack"
  make -C "_build" DESTDIR="$pkgdir" install

  rm -r "$pkgdir/usr/include"
  rm -r "$pkgdir/usr/lib"/{libblas.*,libcblas.*,liblapacke.*}
  rm -r "$pkgdir/usr/lib/cmake"/{cblas*,lapacke*}
  rm -r "$pkgdir/usr/lib/pkgconfig"/{blas.*,cblas.*,lapacke.*}

  mkdir -p "$pkgdir/usr/share"
  cp -r "DOCS/man" "$pkgdir/usr/share"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/lapack"
}

package_blas-git() {
  pkgdesc="Basic linear algebra subprograms"
  url="https://www.netlib.org/blas/"
  depends=('gcc-libs')
  provides=('cblas' 'blas')
  conflicts=('cblas' 'blas')

  cd "lapack"

  make -C "_build/BLAS" DESTDIR="$pkgdir" install
  make -C "_build/CBLAS" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/blas"
}

package_lapacke-git() {
  pkgdesc="C Interface to LAPACK"
  url="https://www.netlib.org/lapack/lapacke.html"
  depends=('glibc' 'lapack')
  provides=('lapacke')
  conflicts=('lapacke')

  cd "lapack"

  make -C "_build/LAPACKE"  DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/lapacke"
}
