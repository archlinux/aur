# Maintainer: Giuseppe Borzi <gborzi___AT___ieee___DOT___org>
# Contributor: mickele <mimocciola___AT___yahoo___DOT___ com>
# Contributor: iztok pizorn <pizorn___AT___gmail___DOT___com>
# Contributor: olivier medoc <o_medoc___AT___yahoo___DOT___fr>
pkgname=atlas-lapack
pkgver=3.10.2
_lapackver=3.6.0
pkgrel=3
pkgdesc="Complete LAPACK and BLAS implementation using optimised ATLAS routines"
url="http://math-atlas.sourceforge.net/"
depends=('gcc-libs')
makedepends=('binutils' 'sed' 'gcc-fortran')
arch=('i686' 'x86_64')
conflicts=('blas' 'lapack' 'cblas' 'atlas-lapack-base')
provides=("blas" "lapack=$_lapackver" 'cblas' 'atlas-lapack-base')
license=('custom:blas' 'custom:lapack' 'custom:atlas')
options=(!makeflags)
install=$pkgname.install
source=(http://www.netlib.org/lapack/lapack-$_lapackver.tgz http://downloads.sourceforge.net/math-atlas/atlas${pkgver}.tar.bz2 blas-license.txt atlas-license.txt makefile.shared.mt makefile.shared.st)
noextract=(lapack-$_lapackver.tgz atlas$pkgver.tar.bz2)
md5sums=('f2f6c67134e851fe189bb3ca1fbb5101'
         'a4e21f343dec8f22e7415e339f09f6da'
         '38b6acb8ed5691d25863319d30a8b365'
         '4903eb06072dfbf94710691ccb6660bf'
         '2532ea5fdd412414a438b65b49451574'
         '24dfa225d311585d79dcf2560a9682b5')

build() {
   cd "$srcdir"
   tar -xjf atlas$pkgver.tar.bz2

   NCPU=`grep "^processor" /proc/cpuinfo | wc -l`
   #USE_ARCH_DEFAULTS="yes"
   msg 'Before building this package, as root you must set the CPU(s)'
   msg 'governor(s) to "performance".'
   msg 'See: https://wiki.archlinux.org/index.php/CPU_frequency_scaling'

   if [ "$CARCH" = "x86_64" ]; then
      ARCHITECTURE_BUILD_OPTS="-b 64" # for x86_64
   else
      ARCHITECTURE_BUILD_OPTS="-b 32" # for i686
   fi

   mkdir -p "$srcdir/ATLAS/build"
   cd "$srcdir/ATLAS/build"

   msg 'Build ATLAS'
   unset MAKE
   cd "$srcdir/ATLAS/build"
   rm -rf *
   ../configure --prefix=/usr/ $ARCHITECTURE_BUILD_OPTS -Fa alg -fPIC \
      --with-netlib-lapack-tarfile="$srcdir/lapack-$_lapackver.tgz"
   make build
   msg 'Build shared libraries'
   cd lib
   if [ 1 -lt $NCPU ]; then
      cp "$srcdir/makefile.shared.mt" makefile
   else
      cp "$srcdir/makefile.shared.st" makefile
   fi
   make -f makefile
}

check() {

   cd "$srcdir/ATLAS/build"

   msg 'Check...'
   unset MAKE
   make check
   make ptcheck
   make time
}

package() {

   cd "$srcdir/ATLAS/build"
   make DESTDIR="$pkgdir/usr" install
   cp -d lib/*.so* "$pkgdir/usr/lib"
   [ -e lib/libptlapack.a ] && cp lib/libptlapack.a "$pkgdir/usr/lib"
   cd "$pkgdir/usr/lib"
   ln -s libblas.so libblas.so.3
   ln -s liblapack.so.3 liblapack.so

   install -Dm644 "${srcdir}/blas-license.txt" \
      "${pkgdir}/usr/share/licenses/$pkgname/blas-license.txt"
   install -Dm644 "${srcdir}/ATLAS/build/src/lapack/reference/LICENSE" \
      "${pkgdir}/usr/share/licenses/$pkgname/lapack-license.txt"
   install -Dm644 "${srcdir}/atlas-license.txt" \
      "${pkgdir}/usr/share/licenses/$pkgname/atlas-license.txt"
}

