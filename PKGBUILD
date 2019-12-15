# Maintainer Anton Kudelin <kudelin at protonmail dot com>

pkgname=libxsmm
pkgver=1.14
pkgrel=2
arch=('x86_64')
pkgdesc="A library for small dense and small sparse matrix-matrix multiplications"
url="https://github.com/hfp/libxsmm"
license=('BSD')
depends=('gcc-libs')
makedepends=('gcc' 'gcc-fortran' 'python')
checkdepends=('blas' 'lapack')
conflicts=('libxsmm-git')
source=($url/archive/$pkgver.tar.gz)
sha256sums=('9c0af4509ea341d1ee2c6c19fc6f19289318c3bd4b17844efeb9e7f9691abf76')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  export PREFIX=/usr
  export DESTDIR=$pkgdir/usr
  export STATIC=0
  export OMP=1

  # Enabling CPU intrinsics is crucial for LIBXSMM performance
  export CTARGET="-O3 -march=native"
  
  # Set "1" if Intel MKL is needed to be tested with LIBXSMM
  export MKL=0
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

check() {
  cd $srcdir/$pkgname-$pkgver
  make tests
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install
  find $pkgdir -name "*pc" -print0 | xargs -0 sed -i "s#$pkgdir##g"
}
