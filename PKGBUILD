# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tom K <tomk@runbox.com>
# Contributor: Aaron Ali <t0nedef@causal.ca>
# Contributor: McNoggins <gagnon88 AT gmail DOT com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mpb
pkgver=1.11.1
pkgrel=1
pkgdesc="A program for computing the band structures and electromagnetic modes"
arch=('i686' 'x86_64')
url="https://mpb.readthedocs.io"
license=('GPL')
depends=('lapack' 'hdf5' 'fftw' 'libctl' 'guile')
makedepends=('gcc-fortran')
source=(https://github.com/NanoComp/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('dc55b081c56079727dac92d309f8e4ea84ca6eea9122ec24b7955f8c258608e1')

prepare() {
  cp -r $pkgname-$pkgver $pkgname-inv
  cp -r $pkgname-$pkgver $pkgname-mpi
  cp -r $pkgname-$pkgver $pkgname-inv-mpi
}

build() {
  # configure includes two options for working with GNU Fortran and HDF5 v1.8.x
  cd "$pkgname-$pkgver"
  ./configure \
    F77="gfortran" \
    CPPFLAGS="-DH5_USE_16_API=1" \
    --prefix=/usr \
    --enable-shared \
    --mandir=/usr/share/man
  make
  
  # configure inversion symmetry binaries (run at least 2x as fast)
  cd ../$pkgname-inv
  ./configure \
    F77="gfortran" \
    CPPFLAGS="-DH5_USE_16_API=1" \
    --prefix=/usr \
    --enable-shared \
    --with-inv-symmetry \
    --mandir=/usr/share/man
  make
  
  # configure parallel computation
  cd ../$pkgname-mpi
  ./configure \
    F77="gfortran" \
    CPPFLAGS="-DH5_USE_16_API=1" \
    --prefix=/usr \
    --enable-shared \
    --with-mpi \
    --mandir=/usr/share/man
  make
  
  # configure parallel computation
  cd ../$pkgname-inv-mpi
  ./configure \
    F77="gfortran" \
    CPPFLAGS="-DH5_USE_16_API=1" \
    --prefix=/usr \
    --enable-shared \
    --with-inv-symmetry \
    --with-mpi \
    --mandir=/usr/share/man
  make
}

package() { 
  cd $pkgname-$pkgver
  make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install 
  
  cd "$srcdir"/$pkgname-inv
  make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install 
  
  cd "$srcdir"/$pkgname-mpi
  make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install 
  
  cd "$srcdir"/$pkgname-inv-mpi
  make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install 
}
