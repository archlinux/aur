# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=libvdwxc
pkgver=0.4.0
pkgrel=5
pkgdesc="A library for vdW-DF exchange-correlation functionals"
arch=(x86_64 aarch64)
url="https://libvdwxc.materialsmodeling.org"
license=(GPL-3.0-or-later)
depends=(fftw-openmpi)
makedepends=(gcc-fortran)
source=(https://gitlab.com/$pkgname/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('5fcd37253489931b94ce865bb4e6942250665e269057a50bd532c8697ac19dc7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -if
  autoupdate
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --with-fftw3 \
    FC=gfortran \
    MPICC=mpicc \
    MPIFC=mpifort \
    CFLAGS="-Wno-error=incompatible-pointer-types $CFLAGS" \
    FCFLAGS="-I/usr/lib -O3" \
    LDFLAGS="-L/usr/lib -lmpi"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
