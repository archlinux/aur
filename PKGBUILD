# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Scott Tincman <sctincman at gmail dot com>

pkgname=octopus
pkgver=9.1
pkgrel=1
pkgdesc="Real-space Time-Dependent Density Functional Theory code"
arch=('x86_64')
url="https://octopus-code.org"
license=('LGPL')
depends=('scalapack' 'gd' 'gsl' 'libxc' 'libvdwxc' 'perl')
makedepends=('gcc-fortran' 'sed')
checkdepends=('procps-ng')
source=("https://gitlab.com/octopus-code/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('2d3322855d38ec417418b7293df87469c7c85a428f2de46238008f0d1c07ee32')

prepare() {
    cd $srcdir/$pkgname-$pkgver
    autoreconf -if
}

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure \
                --prefix=/usr \
                --enable-mpi \
                --with-scalapack="-lscalapack" \
                --with-blacs="-lscalapack"
    make
}

check() {
    cd $srcdir/$pkgname-$pkgver
    for t in testsuite/photo_electron/*.test
    do
      sed -i "s/Yes/No/g" $t
    done
    sed -i "s/Yes/No/g" testsuite/finite_systems_3d/14-fullerene_unpacked.test
    make check
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
