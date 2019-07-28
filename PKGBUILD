# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=elpa
PkgName=ELPA
pkgver=2018.11.001
pkgrel=1
arch=('x86_64')
pkgdesc="Eigenvalue SoLvers for Petaflop-Applications"
url="https://elpa.mpcdf.mpg.de/html/Releases"
license=("LGPL3")
depends=('scalapack')
makedepends=('gcc-fortran' 'python')
provides=('elpa')
source=(https://gitlab.mpcdf.mpg.de/${pkgname}/${pkgname}/-/archive/${PkgName}_${pkgver}/${pkgname}-${PkgName}_${pkgver}.tar.bz2)
sha256sums=('333b5c684db03d4698b483462dd7f7a27172eb6617efcee943bd40a8728a8ac3')

prepare() {
    export CC=mpicc
    export FC=mpifort
    unset LDFLAGS
    mkdir $srcdir/${pkgname}-${PkgName}_${pkgver}/build
}

build() {
    cd $srcdir/${pkgname}-${PkgName}_${pkgver}/build
    ../autogen.sh
    ../configure --prefix=/usr                      \
                 --enable-openmp                    \
                 CFLAGS="$CFLAGS -march=native"     \
                 LIBS='-lblas -llapack -lscalapack'
    make clean
    make
}

package() {
    cd $srcdir/${pkgname}-${PkgName}_${pkgver}/build
    make DESTDIR=$pkgdir install
}
