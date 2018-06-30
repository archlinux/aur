# Maintainer: Charles Vejnar

pkgname=phast
pkgver=1.5
pkgrel=1
pkgdesc="Phylogenetic analysis with space/time models"
arch=("i686" "x86_64")
url="http://compgen.bscb.cornell.edu/phast"
license=("BSD")
makedepends=("cmake")
source=("http://www.netlib.org/clapack/clapack-3.2.1-CMAKE.tgz" "http://compgen.cshl.edu/phast/downloads/phast.v${pkgver//./_}.tgz")
sha1sums=("5ea1bcc4314e392bca8b9e5f61d44355cf9f4cc1" "064f409e8e3698484a18731d247e0576213b423b")

build() {
    # Build CLAPACK
    cd "$srcdir/clapack-3.2.1-CMAKE"
    mkdir build
    cd build
    cmake ..
    make

    # Add symbolic links
    ln -s ./BLAS/SRC/libblas.a blas.a
    ln -s ./SRC/liblapack.a lapack.a
    ln -s ./TESTING/MATGEN/libtmglib.a tmglib.a
    ln -s ./libf2c/libf2c.a F2CLIBS/libf2c.a
    cp -r ../INCLUDE .

    # Build Phast
    cd "$srcdir/phast/src"
    make CLAPACKPATH=$srcdir/clapack-3.2.1-CMAKE/build
}

package() {
    cd "$srcdir/phast/bin"
    for fname in $(ls -1); do
        install -Dm755 $fname "$pkgdir/usr/bin/$fname"
    done
    cd "$srcdir/phast/doc/man"
    for fname in $(ls -1); do
        install -Dm644 $fname "$pkgdir/usr/share/man/man1/$fname"
    done
}
