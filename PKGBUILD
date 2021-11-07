# Maintainer Anton Kudelin <kudelin at protonmail dot com>

pkgname=libxsmm
pkgver=1.16.3
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
sha256sums=('e491ccadebc5cdcd1fc08b5b4509a0aba4e2c096f53d7880062a66b82a0baf84')

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
  cd "$pkgdir/usr"
  install -dm755 share/licenses/libxsmm
  ln -sf share/libxsmm/LICENSE.md share/licenses/libxsmm
  find . -name "*.pc" -exec sed -i "/prefix=/c prefix=\/usr" {} \;
  find lib -name "libxsmm" -exec sed -i "s@$srcdir/$pkgname-$pkgver@/usr@g" {} \;
  install -dm755 lib/pkgconfig
  mv lib/*.pc lib/pkgconfig
}
