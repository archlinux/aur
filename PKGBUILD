# Maintainer Anton Kudelin <kudelin at protonmail dot com>

pkgname=libxsmm
pkgver=1.13
pkgrel=1
arch=('x86_64')
pkgdesc="A library for small dense and small sparse matrix-matrix multiplications"
url="https://github.com/hfp/libxsmm"
license=('BSD')
depends=('gcc-libs')
makedepends=('gcc' 'gcc-fortran')
checkdepends=('blas' 'lapack')
conflicts=('libxsmm-git')
source=($url/archive/$pkgver.tar.gz
	0001-Issue-340-fix-an-issue-where-realloc-return-a-differ.patch)
sha256sums=('47c034e169820a9633770eece0e0fdd8d4a744e09b81da2af8c2608a4625811e'
            '2d6d7effd499c98aa873a784be8cea27f98cd0afb055123fb20be9cf67221466')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < $srcdir/0001-Issue-340-fix-an-issue-where-realloc-return-a-differ.patch
  export CTARGET="$CFLAGS"
  export STATIC=0
  export OMP=1
  export MKL=0
  export PREFIX=/usr
  export DESTDIR=$pkgdir/usr
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
