# Maintainer: Thomas Mijieux <tom,tix?hotmail,fr>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Jason Taylor <jftaylor21@gmail.com>

pkgbase=lapack-tmg
pkgname=('lapack-tmg' 'blas-tmg' 'cblas-tmg' 'lapacke-tmg')
pkgver=3.7.0
pkgrel=1
url="http://www.netlib.org/lapack"
pkgdesc="Linear Algebra PACKage with TMG lib"
makedepends=('gcc-fortran' 'cmake' 'python')
arch=('i686' 'x86_64')
license=("custom")
source=(http://www.netlib.org/lapack/lapack-${pkgver}.tgz LICENSE.blas)
sha1sums=('27dbd06bedc76619150f8e28de6412f7df0c649a'
          '2491a151a37f0162b25fc4e4e9a8ac444b574a76')

build() {
  install -d build
  cd build
  cmake ../lapack-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_Fortran_COMPILER=gfortran \
    -DLAPACKE=ON \
    -DLAPACKE_WITH_TMG=ON \
    -DCBLAS=ON \
    -DBUILD_DEPRECATED=ON
  make
}

package_lapack-tmg() {
  depends=("blas-tmg")
  conflicts=("lapack")
  provides=("lapack")
  
  cd build
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/lib/{libblas.*,libcblas.*,liblapacke.*}
  rm -r "$pkgdir"/usr/lib/pkgconfig/{blas.*,cblas.*,lapacke.*}
  rm -r "$pkgdir"/usr/lib/cmake/{cblas*,lapacke*}
  rm -r "$pkgdir"/usr/include
}

package_blas-tmg() {
  pkgdesc="Basic Linear Algebra Subprograms"
  depends=('gcc-libs')
  conflicts=("blas")
  provides=("blas")

  cd build/BLAS
  make DESTDIR="$pkgdir" install
  
  install -m755 -d "${pkgdir}/usr/share/licenses/blas"
  install -m644 "${srcdir}/LICENSE.blas" \
    "${pkgdir}/usr/share/licenses/blas/"
}

package_cblas-tmg() {
  pkgdesc="C interface to BLAS"
  depends=("blas-tmg")
  conflicts=("cblas")
  provides=("cblas")

  cd build/CBLAS
  make DESTDIR="$pkgdir" install
}

package_lapacke-tmg() {
  pkgdesc="C interface to LAPACK with TMG lib"
  depends=("lapack-tmg")
  conflicts=("lapacke")
  provides=("lapacke")

  cd build/LAPACKE
  make DESTDIR="$pkgdir" install
}

