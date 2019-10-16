# Maintainer: Anton Kudelin <kudelin___AT___protonmail___DOT___com>
# Contributor: Giuseppe Borzi <gborzi___AT___ieee___DOT___org>
# Contributor: mickele <mimocciola___AT___yahoo___DOT___ com>
# Contributor: iztok pizorn <pizorn___AT___gmail___DOT___com>
# Contributor: olivier medoc <o_medoc___AT___yahoo___DOT___fr>

pkgname=atlas-lapack
pkgver=3.10.3
_lapackver=3.8.0
pkgrel=3
pkgdesc="Automatically Tuned Linear Algebra Software"
url="http://math-atlas.sourceforge.net/"
depends=('gcc-libs')
makedepends=('binutils' 'sed' 'gcc-fortran')
arch=('x86_64')
conflicts=('blas' 'lapack' 'cblas' 'atlas-lapack-base' 'openblas' 'openblas-lapack')
provides=("blas" "lapack" 'cblas' 'atlas-lapack-base')
license=('BSD' 'custom:lapack')
options=(!makeflags)
install=$pkgname.install
source=("https://github.com/Reference-LAPACK/lapack/archive/v$_lapackver.tar.gz"
        "http://downloads.sourceforge.net/math-atlas/atlas${pkgver}.tar.bz2"
        "Makefile")
noextract=("v$_lapackver.tar.gz" "atlas$pkgver.tar.bz2")
sha256sums=('deb22cc4a6120bff72621155a9917f485f96ef8319ac074a7afbc68aab88bcf6'
            '2688eb733a6c5f78a18ef32144039adcd62fabce66f2eb51dd59dde806a6d2b7'
            '7627446a0d598b55bc8f2795f8ff2028f134928b9ca597b76bf8dd5622dbff69')

prepare() {
   msg 'Before building this package, as root you must set the CPU(s)'
   msg 'governor(s) to "performance" and disable intel_pstate.'
   msg 'See: https://wiki.archlinux.org/index.php/CPU_frequency_scaling'

   cd $srcdir
   tar -xjf atlas$pkgver.tar.bz2
   mkdir -p ATLAS/build
}
   
build() {
   cd $srcdir/ATLAS/build

   ../configure --prefix=/usr \
                --shared \
                --with-netlib-lapack-tarfile="$srcdir/v$_lapackver.tar.gz"
   make build
   cd lib
   cp $srcdir/Makefile .
   make
}

check() {
   cd $srcdir/ATLAS/build

   make check
   make ptcheck
   make time
}

package() {
   cd $srcdir/ATLAS/build

   make DESTDIR=$pkgdir/usr install
   cp -d lib/*.so* $pkgdir/usr/lib
   cd $pkgdir/usr/lib
   ln -s libblas.so libblas.so.3
   ln -s liblapack.so.3 liblapack.so
   
   cd ../include/atlas
   sed -i "s#$srcdir# #g" *

   install -Dm644 $srcdir/ATLAS/build/src/lapack/reference/LICENSE \
      $pkgdir/usr/share/licenses/$pkgname/lapack-license.txt
}
