# Maintainer: xpt <user.xpt@gmail.com>
pkgname=lammps  
pkgver=15May15
pkgrel=1 
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator."
url="http://lammps.sandia.gov/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('fftw' 'openmpi')
makedepends=()
source=(http://lammps.sandia.gov/tars/lammps-stable.tar.gz
  fftw3.patch)
md5sums=('8029c9ad293e06db1bb293c03ea325fb'
         '995c3d49f0df9c28f287fca0a3ea0752')
build() {
  cd $srcdir/$pkgname-$pkgver/src
  patch -Np0 < ../../fftw3.patch
  # add whatever package you need in here.
  make yes-user-sph
  
  make mpi || return 1
}

package() {
  mkdir -p $pkgdir/usr/share/$pkgname
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/share/doc/$pkgname/bench
  mkdir -p $pkgdir/usr/share/doc/$pkgname/examples
  cd $srcdir/$pkgname-$pkgver
  install -Dm 755 src/lmp_mpi $pkgdir/usr/bin/lmp_mpi
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -dm 644 doc/ $pkgdir/usr/share/doc/$pkgname
  cp -r --no-preserve='ownership' doc/* $pkgdir/usr/share/doc/$pkgname
  install -dm 644 bench/ $pkgdir/usr/share/$pkgname/bench
  cp -r --no-preserve='ownership' bench/* $pkgdir/usr/share/doc/$pkgname/bench
  install -dm 644 examples/ $pkgdir/usr/share/$pkgname/examples
  cp -r --no-preserve='ownership' examples/* $pkgdir/usr/share/doc/$pkgname/examples
} 
