# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=scorep
pkgver=6.0
pkgrel=2
pkgdesc="Highly scalable and easy-to-use tool suite for profiling, event tracing, and online analysis of HPC applications."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('cubew' 'cubelib' 'openmpi' 'otf2' 'opari2')
source=(https://www.vi-hps.org/cms/upload/packages/$pkgname/$pkgname-$pkgver.tar.gz
        scorep-gcc-10.patch
        scorep-binutils-2.34.patch)
sha256sums=('5dc1023eb766ba5407f0b5e0845ec786e0021f1da757da737db1fb71fc4236b8'
            'd8afa9a5bff784786054e217aef431363e9fba70fab12897352b2e5e3b088135'
            '735476b6e5f120ab23beb48ac3aa0b754177028c1acbe9f22bc7cfd79341e1f3')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/scorep-gcc-10.patch"
    patch --forward --strip=1 --input="${srcdir}/scorep-binutils-2.34.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-mpi=openmpi --with-shmem=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
