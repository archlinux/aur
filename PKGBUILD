# Maintainer Anton Kudelin <kudelin at protonmail dot com>

pkgname=libxsmm
pkgver=1.15
pkgrel=1
arch=('x86_64')
pkgdesc="A library for small dense and small sparse matrix-matrix multiplications"
url="https://github.com/hfp/libxsmm"
license=('BSD')
depends=('gcc-libs')
makedepends=('gcc-fortran' 'python')
checkdepends=('blas' 'lapack')
conflicts=('libxsmm-git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('499e5adfbf90cd3673309243c2b56b237d54f86db2437e1ac06c8746b55ab91c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export STATIC=0
  export OMP=1

  # Enabling CPU intrinsics is crucial for LIBXSMM performance
  export CTARGET="-O3 -march=native"
  
  # Set "1" if Intel MKL is needed to be tested with LIBXSMM
  export MKL=0
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -dm755 "$pkgdir/usr/share/licenses/libxsmm"
  ln -sf "$pkgdir/usr/share/libxsmm/LICENSE.md" \
    "$pkgdir/usr/share/licenses/libxsmm"
  find "$pkgdir" -name "*.pc" -exec sed -i "/prefix=/c prefix=\/usr" {} \;
  find "$pkgdir/usr/lib" -name "libxsmm" -exec \
    sed -i "s#$srcdir/$pkgname-$pkgver#/usr#g" {} \;
}
