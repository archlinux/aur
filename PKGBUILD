# Maintainer: Anton Kudelin <kudelin___AT___protonmail___DOT___com>
# Contributor: Giuseppe Borzi <gborzi___AT___ieee___DOT___org>
# Contributor: mickele <mimocciola___AT___yahoo___DOT___ com>
# Contributor: iztok pizorn <pizorn___AT___gmail___DOT___com>
# Contributor: olivier medoc <o_medoc___AT___yahoo___DOT___fr>

pkgname=atlas-lapack
pkgver=3.10.3
_lapackver=3.9.0
pkgrel=5
pkgdesc="Automatically Tuned Linear Algebra Software"
url="http://math-atlas.sourceforge.net/"
depends=('gcc-libs')
makedepends=('gcc-fortran')
arch=('x86_64')
provides=('blas' 'lapack' 'cblas' 'atlas-lapack-base')
license=('BSD' 'custom:lapack')
options=(!makeflags)
install=$pkgname.install
source=("lapack-$_lapackver.tar.gz::https://github.com/Reference-LAPACK/lapack/archive/v$_lapackver.tar.gz"
        "http://downloads.sourceforge.net/math-atlas/atlas$pkgver.tar.bz2"
        "Makefile")
noextract=("lapack-$_lapackver.tar.gz" "atlas$pkgver.tar.bz2")
sha256sums=('106087f1bb5f46afdfba7f569d0cbe23dacb9a07cd24733765a0e89dbe1ad573'
            '2688eb733a6c5f78a18ef32144039adcd62fabce66f2eb51dd59dde806a6d2b7'
            '7627446a0d598b55bc8f2795f8ff2028f134928b9ca597b76bf8dd5622dbff69')

prepare() {
   msg 'Before building this package, as root you must set the CPU(s)'
   msg 'governor(s) to "performance" and disable intel_pstate.'
   msg 'See: https://wiki.archlinux.org/index.php/CPU_frequency_scaling'

   cd "$srcdir"
   tar -xjf atlas$pkgver.tar.bz2
   mkdir -p ATLAS/build
}
   
build() {
   cd "$srcdir/ATLAS/build"
   ../configure --prefix=/usr \
                --shared \
                --with-netlib-lapack-tarfile="$srcdir/lapack-$_lapackver.tar.gz"
   make build
   cd lib
   cp "$srcdir/Makefile" .
   make
}

check() {
   cd "$srcdir/ATLAS/build"
   make check F77FLAGS="$F77FLAGS -fallow-argument-mismatch"
   make ptcheck
   make time
}

package() {
   cd "$srcdir/ATLAS/build"
   make DESTDIR="$pkgdir/usr" install
   cp -d lib/*.so "$pkgdir/usr/lib"
   install -m755 lib/liblapack.so.3.6.1 "$pkgdir/usr/lib/liblapack.so.$_lapackver"
   install -m755 lib/libptlapack.so.3.6.1 "$pkgdir/usr/lib/libptlapack.so.$_lapackver"
   cd "$pkgdir/usr/lib"
   ln -s liblapack.so.$_lapackver liblapack.so.3
   ln -s liblapack.so.3 liblapack.so
   ln -s libblas.so libblas.so.3
   ln -s libcblas.so libcblas.so.3
   cd ../include/atlas
   sed -i "s#$srcdir# #g" *
   install -Dm644 "$srcdir/ATLAS/build/src/lapack/reference/LICENSE" \
      "$pkgdir/usr/share/licenses/$pkgname/lapack-license.txt"
}
