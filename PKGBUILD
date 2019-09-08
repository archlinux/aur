# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=elpa
PkgName=ELPA
pkgver=2019.05.001
pkgrel=1
arch=('x86_64')
pkgdesc="Eigenvalue SoLvers for Petaflop-Applications"
url="https://elpa.mpcdf.mpg.de/html/Releases"
license=("LGPL3")
depends=('scalapack')
makedepends=('gcc-fortran' 'python')
optdepends=('cuda: GPU support')
provides=('elpa')
source=("$url/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('772c03dab8713ba3891b17757a0b8429b3c4bec4b261dd337ed4b34311f6b221')

prepare() {
    export CC=mpicc
    export FC=mpifort
    unset LDFLAGS
   
   # Enable CUDA if nvcc is in PATH
   if [ $( echo -n $( which nvcc) | tail -c 4 ) == nvcc ]
   then
     export ACC=enable
     export LDFLAGS="$LDFLAGS -L/opt/cuda/lib64"
   else
     export ACC=disable
   fi
}

build() {
    cd $srcdir/$pkgname-$pkgver
     ./configure --prefix=/usr                      \
                 --enable-openmp                    \
                 --$ACC-gpu                         \
                 CFLAGS="$CFLAGS -march=native"     \
                 LIBS='-lblas -llapack -lscalapack'
    make -j1
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
