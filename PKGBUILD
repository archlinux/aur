# Maintainer: orumin <dev at orum.in>

pkgbase=lib32-lapack
_basename=lapack
pkgname=('lib32-lapack' 'lib32-blas' 'lib32-cblas' 'lib32-lapacke')
pkgver=3.7.0
pkgrel=1
url="http://www.netlib.org/lapack"
pkgdesc="Linear Algebra PACKage (32-bit)"
makedepends=('gcc-fortran-multilib' 'cmake' 'python')
arch=('x86_64')
license=("custom")
source=(http://www.netlib.org/${_basename}/${_basename}-${pkgver}.tgz)
sha1sums=('27dbd06bedc76619150f8e28de6412f7df0c649a')

build() {
  _pkg_basename=$(echo ${pkgname} | cut -d- -f2)
  install -d build
  cd build

  export FFLAGS='-m32'
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake ../${_pkg_basename}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DCMAKE_Fortran_COMPILER=gfortran \
    -DLAPACKE=ON \
    -DCBLAS=ON \
    -DBUILD_DEPRECATED=ON
  make
}

package_lib32-lapack() {
  depends=('lib32-blas' 'lapack')
  
  cd build
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/lib32/{libblas.*,libcblas.*,liblapacke.*}
  rm -r "$pkgdir"/usr/lib32/pkgconfig/{blas.*,cblas.*,lapacke.*}
  rm -r "$pkgdir"/usr/lib32/cmake/{cblas*,lapacke*}
  rm -r "$pkgdir"/usr/include
}

package_lib32-blas() {
  pkgdesc="Basic Linear Algebra Subprograms (32-bit)"
  depends=('gcc-libs-multilib' 'blas')

  cd build/BLAS
  make DESTDIR="$pkgdir" install
  
}

package_lib32-cblas() {
  pkgdesc="C interface to BLAS (32-bit)"
  depends=('lib32-blas' 'cblas')

  cd build/CBLAS
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/include
}

package_lib32-lapacke() {
  pkgdesc="C interface to LAPACK"
  depends=('lib32-lapack' 'lapacke')

  cd build/LAPACKE
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/include
}

