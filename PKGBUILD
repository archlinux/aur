# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=libvdwxc
pkgver=0.5.0
pkgrel=1
pkgdesc="A library for vdW-DF exchange-correlation functionals"
arch=(x86_64 aarch64)
url="https://libvdwxc.materialsmodeling.org"
license=(GPL-3.0-or-later)
depends=(fftw-openmpi fftw)
makedepends=(gcc-fortran)
source=(https://gitlab.com/$pkgname/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('0c89c6b6f0c8b6926b679cb32b39757b656fcd771abb16c2239849ff5d3c1de2')

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
    LDFLAGS="-L/usr/lib -lmpi -lmpi_mpifh"
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
