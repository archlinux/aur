# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Jean-Francis Roy <jeanfrancisroy _AT_ gmail _DOT_ com>
# Contributor: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>

pkgbase=openblas-git
pkgname=('openblas-git' 'openblas64-git' 'blas-openblas-git' 'blas64-openblas-git')
pkgver=0.3.30.r3.g4e6da5ed3
pkgrel=1
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD"
arch=('i686' 'x86_64')
url="https://www.openmathlib.org/OpenBLAS/"
license=('BSD-3-Clause')
depends=('gcc-libs')
makedepends=('git' 'cmake' 'gcc-fortran' 'perl')
provides=("openblas=$pkgver")
conflicts=('openblas')
source=("git+https://github.com/OpenMathLib/OpenBLAS.git")
sha256sums=('SKIP')


pkgver() {
  cd "OpenBLAS"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "OpenBLAS"

  # Setting FC manually to avoid picking up f95 and breaking the cmake build
  # https://github.com/xianyi/OpenBLAS/issues/4072#issuecomment-1576388332

  # Setting ASM flags for CET support.  Setting FFLAGS for CET support.
  # Remove ` -Wformat -Werror=format-security` not supported by gcc-fortran.

  ASMFLAGS="$CFLAGS" \
  FFLAGS="${CFLAGS/ -Wformat -Werror=format-security/}" \
  FC="gfortran" \
  cmake -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF \
    -DDYNAMIC_ARCH=ON \
    -DNUM_THREADS=64 \
    -DTARGET=CORE2 \
    -DUSE_OPENMP=1
  cmake --build "_build"

  ASMFLAGS="$CFLAGS" \
  FFLAGS="${CFLAGS/ -Wformat -Werror=format-security/}" \
  FC="gfortran" \
  cmake -B "_build64" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF \
    -DDYNAMIC_ARCH=ON \
    -DINTERFACE64=1 \
    -DNUM_THREADS=64 \
    -DTARGET=CORE2 \
    -DUSE_OPENMP=1
  cmake --build "_build64"
}

check() {
  cd "OpenBLAS"

  #cmake --build "_build" --target test
  #cmake --build "_build64" --target test
}

package_openblas-git() {
  cd "OpenBLAS"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/openblas"
}

package_openblas64-git() {
  pkgdesc+=" (64-bit integers)"

  cd "OpenBLAS"

  DESTDIR="$pkgdir" cmake --install "_build64"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/openblas64"

  cd "$pkgdir/usr/lib"
  ln -s "libopenblas_64.so" "libopenblas64_.so"  # Needed by julia
}

package_blas-openblas-git() {
  pkgdesc+=" (Provides BLAS/CBLAS/LAPACK/LAPACKE system-wide)"
  depends=('openblas-git')
  provides=('blas' 'cblas' 'lapack' 'lapacke' "openblas-lapack=$pkgver")
  conflicts=('blas' 'cblas' 'lapack' 'lapacke' 'openblas-lapack')
  replaces=('openblas-lapack')

  mkdir -p "$pkgdir/usr/lib/pkgconfig"
  cd "$pkgdir/usr/lib"
  for _lib in blas cblas lapack lapacke; do
    ln -s "libopenblas.so" "lib${_lib}.so"
    ln -s "libopenblas.so" "lib${_lib}.so.3"
    ln -s "openblas.pc" "$pkgdir/usr/lib/pkgconfig/${_lib}.pc"
  done
}

package_blas64-openblas-git() {
  pkgdesc+=" (64-bit integers, provides BLAS/CBLAS/LAPACK/LAPACKE system-wide)"
  depends=('openblas64-git')
  provides=('blas64' 'cblas64' 'lapack64' 'lapacke64')
  conflicts=('blas64' 'cblas64' 'lapack64' 'lapacke64')

  mkdir -p "$pkgdir/usr/lib/pkgconfig"
  cd "$pkgdir/usr/lib"
  for _lib in blas64 cblas64 lapack64 lapacke64; do
    ln -s "libopenblas_64.so" "lib${_lib}.so"
    ln -s "libopenblas_64.so" "lib${_lib}.so.3"
    ln -s "openblas64.pc" "$pkgdir/usr/lib/pkgconfig/${_lib}.pc"
  done
}
