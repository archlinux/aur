# Maintainer Anton Kudelin <kudelin at proton dot me>

pkgname=libxsmm
pkgver=1.17
pkgrel=3
arch=(x86_64)
pkgdesc="A library for small dense and small sparse matrix-matrix multiplications"
url="https://github.com/libxsmm/libxsmm"
license=(BSD-3-Clause)
depends=(gcc-libs)
makedepends=(gcc-fortran python)
checkdepends=(blas lapack)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('8b642127880e92e8a75400125307724635ecdf4020ca4481e5efe7640451bb92')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make STATIC=0 OMP=1 CTARGET="-march=native" MKL=0
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
