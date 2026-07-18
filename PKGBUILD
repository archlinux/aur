# Maintainer Anton Kudelin <kudelin at proton dot me>

pkgname=libxsmm
pkgver=2.0.0
pkgrel=1
arch=(x86_64 aarch64)
pkgdesc="A library for small dense and small sparse matrix-matrix multiplications"
url="https://github.com/libxsmm/libxsmm"
license=(BSD-3-Clause)
depends=(gcc-libs glibc)
makedepends=(gcc-fortran python)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
        fortran-pc-requires.patch)
sha256sums=('7e532dc5520f864ce6d7f44f3fd50365e3edb23da97dbdc54fd53845d86a290b'
            '4d0bb916c3f80b7ed372ea2e2703553afc5cbd757564380ec2f9957465336077')

prepare() {
  patch -d $pkgname-$pkgver -Np1 -i "$srcdir/fortran-pc-requires.patch"
}

build() {
  make \
    -C $pkgname-$pkgver \
    STATIC=0 \
    OMP=1 \
    MKL=0 \
    WERROR=0 \
    ABSLIBS=0 \
    CTARGET="-march=native"
}

package() {
  make install \
    -C $pkgname-$pkgver \
    STATIC=0 \
    OMP=1 \
    MKL=0 \
    WERROR=0 \
    ABSLIBS=0 \
    CTARGET="-march=native" \
    PREFIX=/usr \
    DESTDIR="$pkgdir" \
    PPKGDIR=lib/pkgconfig \
    PCMKDIR=lib/cmake/libxsmm

  find "$pkgdir" -xtype l -delete
  install -Dm644 $pkgname-$pkgver/LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
