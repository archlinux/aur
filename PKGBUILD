# Maintainer: Charles Vejnar <ce@vejnar.org>

pkgname=phast
pkgver=1.3
pkgrel=1
pkgdesc="Phylogenetic analysis with space/time models"
arch=("i686" "x86_64")
url="http://compgen.bscb.cornell.edu/phast"
license=("BSD")
makedepends=("cmake")
source=("http://www.netlib.org/clapack/clapack-3.2.1-CMAKE.tgz" "http://compgen.bscb.cornell.edu/phast/downloads/phast.v${pkgver//./_}.tgz")
sha1sums=("5ea1bcc4314e392bca8b9e5f61d44355cf9f4cc1" "2e5fcecb39e3efb822e30538739a159b864a7238")

build() {
    # Building CLAPACK
    cd "$srcdir/clapack-3.2.1-CMAKE"
    mkdir build
    cd build
    cmake ..
    make

    # Adding symbolic links
    ln -s ./BLAS/SRC/libblas.a blas.a
    ln -s ./SRC/liblapack.a lapack.a
    ln -s ./TESTING/MATGEN/libtmglib.a tmglib.a
    ln -s ./libf2c/libf2c.a F2CLIBS/libf2c.a
    cp -r ../INCLUDE .

    # Building Phast
    cd "$srcdir/phast-$pkgver/src"
    make CLAPACKPATH=$srcdir/clapack-3.2.1-CMAKE/build
}

package() {
    cd "$srcdir/phast-$pkgver/bin"
    for fname in $(ls -1); do
        install -Dm755 $fname "$pkgdir/usr/bin/$fname"
    done
    cd "$srcdir/phast-$pkgver/doc/man"
    for fname in $(ls -1); do
        install -Dm644 $fname "$pkgdir/usr/share/man/man1/$fname"
    done
}
