# Maintainer Anton Kudelin <kudelin at protonmail dot com>

pkgname=libxsmm
pkgver=1.17
pkgrel=2
arch=('x86_64')
pkgdesc="A library for small dense and small sparse matrix-matrix multiplications"
url="https://github.com/hfp/libxsmm"
license=('BSD')
depends=('gcc-libs')
makedepends=('gcc-fortran' 'python')
checkdepends=('blas' 'lapack')
conflicts=('libxsmm-git')
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('8b642127880e92e8a75400125307724635ecdf4020ca4481e5efe7640451bb92')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export STATIC=0
  export OMP=1

  # Enabling CPU intrinsics is crucial for LIBXSMM performance
  export CTARGET="-march=native"
  
  # Set "1" if Intel MKL is needed to be tested with LIBXSMM
  export MKL=0
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  # Install the core of the library
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install

  # The license file
  cd "$pkgdir/usr"
  install -Dm755 share/libxsmm/LICENSE.md share/licenses/libxsmm/LICENSE.md

  # Fixing pkg-config
  find . -name "*.pc" -exec sed -i "/prefix=/c prefix=\/usr" {} \;

  # Removing references to $srcdir
  find lib -name "libxsmm" -exec sed -i "s@$srcdir/$pkgname-$pkgver@/usr@g" {} \;
  install -dm755 lib/pkgconfig
  mv lib/*.pc lib/pkgconfig
}
