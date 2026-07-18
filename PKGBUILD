# Maintainer Anton Kudelin <kudelin at proton dot me>

pkgname=libxsmm
pkgver=2.0.0
pkgrel=2
arch=(x86_64 aarch64)
pkgdesc="A library for small dense and small sparse matrix-matrix multiplications"
url="https://github.com/libxsmm/libxsmm"
license=(BSD-3-Clause)
depends=(gcc-libs glibc)
makedepends=(gcc-fortran python)
checkdepends=(time)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
        fortran.patch
        gcc16.patch
        eltwise.patch)
sha256sums=('7e532dc5520f864ce6d7f44f3fd50365e3edb23da97dbdc54fd53845d86a290b'
            '4d0bb916c3f80b7ed372ea2e2703553afc5cbd757564380ec2f9957465336077'
            '025131293bd25aefed83448bd5f25ef1948d58d8d736524d552f15caa475ee67'
            '21a107584397d736dfc9da4c762e0061c27d0232aa9fc4dd284caa83cf892528')

prepare() {
  patch -d $pkgname-$pkgver -Np1 -i "$srcdir/fortran.patch"
  patch -d $pkgname-$pkgver -Np1 -i "$srcdir/gcc16.patch"
  patch -d $pkgname-$pkgver -Np1 -i "$srcdir/eltwise.patch"

  export _buildoptions="STATIC=0 OMP=1 MKL=0 WERROR=0 ABSLIBS=0 BLAS=0"
}

build() {
  make \
    -C "$pkgname-$pkgver" \
    $_buildoptions \
    CTARGET="-march=native"
}

check() {
  export LD_LIBRARY_PATH="$srcdir/$pkgname-$pkgver/lib"
  make tests \
    -C "$pkgname-$pkgver" \
    $_buildoptions
}

package() {
  make install \
    -C "$pkgname-$pkgver" \
    $_buildoptions \
    CTARGET="-march=native" \
    PREFIX=/usr \
    DESTDIR="$pkgdir" \
    PPKGDIR=lib/pkgconfig \
    PCMKDIR=lib/cmake/libxsmm

  find "$pkgdir" -xtype l -delete
  install -Dm644 $pkgname-$pkgver/LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
