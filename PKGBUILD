# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=dalton
pkgver=2018.2
_branch=2018
pkgrel=2
pkgdesc="A tool for a wide range of molecular properties at different levels of theory"
arch=("x86_64")
url="https://daltonprogram.org"
license=('LGPL2.1')
depends=('scalapack')
makedepends=('git' 'cmake' 'sed' 'awk' 'python')
conflicts=("$pkgname-git")
source=("git+https://gitlab.com/dalton/$pkgname.git#branch=release/$_branch")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    cat VERSION | sed 's/Dalton*//' | awk '{print $1}'
}

prepare() {
    cd $pkgname
    git submodule update --init --recursive
    mkdir $srcdir/$pkgname/bld
    _mpi_flags=$( mpifort -show | sed 's/.*-L/-L/' )
}

build() {
    cd $pkgname/bld
    cmake .. \
            -DCMAKE_INSTALL_PREFIX=/usr/lib \
            -DCMAKE_EXE_LINKER_FLAGS="$_mpi_flags" \
            -DENABLE_OPENMP=ON \
            -DENABLE_MPI=ON \
            -DENABLE_SCALAPACK=ON \
            -DBLACS_IMPLEMENTATION=openmpi
    make
}

package() {
    cd $pkgname/bld
    make DESTDIR=$pkgdir install
    install -dm755 $pkgdir/usr/bin
    ln -sf $pkgdir/usr/lib/$pkgname/$pkgname $pkgdir/usr/bin
}
