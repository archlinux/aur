# Maintainer:  Anton Kudelin <kudelin___AT___protonmail___DOT___com>
# Contributor: Giuseppe Borzi <gborzi___AT___ieee___DOT___org>
# Contributor: mickele <mimocciola___AT___yahoo___DOT___ com>
# Contributor: iztok pizorn <pizorn___AT___gmail___DOT___com>
# Contributor: olivier medoc <o_medoc___AT___yahoo___DOT___fr>

pkgname=atlas-lapack
_PKGNAME=ATLAS
pkgver=3.10.3
_lapackver=3.10.0
pkgrel=7
pkgdesc="Automatically Tuned Linear Algebra Software"
url="http://math-atlas.sourceforge.net"
depends=('gcc-libs')
makedepends=('gcc-fortran')
arch=('x86_64')
provides=('blas' 'lapack' 'cblas' 'atlas-lapack-base')
license=('BSD' 'custom:lapack')
source=("lapack-$_lapackver.tar.gz::https://github.com/Reference-LAPACK/lapack/archive/v$_lapackver.tar.gz"
        "http://downloads.sourceforge.net/math-atlas/atlas$pkgver.tar.bz2"
        "Makefile"
        "gfortran-10.patch")
noextract=("lapack-$_lapackver.tar.gz" "atlas$pkgver.tar.bz2")
sha256sums=('328c1bea493a32cac5257d84157dc686cc3ab0b004e2bea22044e0a59f6f8a19'
            '2688eb733a6c5f78a18ef32144039adcd62fabce66f2eb51dd59dde806a6d2b7'
            '7627446a0d598b55bc8f2795f8ff2028f134928b9ca597b76bf8dd5622dbff69'
            '33dbb696ab88cf8df2b7fcebbbd60c01b0a26afdd5df4be2d8b344a7bfcdc12f')
options=(!makeflags !buildflags)
install=$pkgname.install

prepare() {
  echo 'Before building this package, as root you must set the CPU(s)'
  echo 'governor(s) to "performance" and disable intel_pstate.'
  echo 'See: https://wiki.archlinux.org/index.php/CPU_frequency_scaling'
  
  cd "$srcdir"
  tar -xjf atlas$pkgver.tar.bz2
  mkdir -p $_PKGNAME/build

  cd $_PKGNAME
  patch -p1 < "$srcdir/gfortran-10.patch"
}
   
build() {
  cd "$srcdir/$_PKGNAME/build"
  ../configure --prefix=/usr \
               --shared \
               --with-netlib-lapack-tarfile="$srcdir/lapack-$_lapackver.tar.gz"
  make build
  cd lib
  cp "$srcdir/Makefile" .
  make
}

check() {
  cd "$srcdir/$_PKGNAME/build"
  make check F77FLAGS="$F77FLAGS -fallow-argument-mismatch"
  make ptcheck
  make time
}

package() {
  cd "$srcdir/$_PKGNAME/build"
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
  install -Dm644 "$srcdir/$_PKGNAME/build/src/lapack/reference/LICENSE" \
     "$pkgdir/usr/share/licenses/$pkgname/lapack-license.txt"
}
