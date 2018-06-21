# Contributor: George Eleftheriou <eleftg>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jed Brown <jedbrown>
# Contributor: eolianoe <eolianoe>
 
pkgname=scotch-mpich
pkgver=6.0.5a
_downloadnum=37401  # gforge is insane
pkgrel=1
_prefix=/usr
pkgdesc="Software package and libraries for graph, mesh and hypergraph partitioning, static mapping, and sparse matrix block ordering. This is the parallel version using the MPICH implementation (MPICH/ptesmumps)."
url="http://www.labri.fr/perso/pelegrin/scotch/"
license=("custom:CeCILL-C")
depends=('openmpi' 'bzip2')
makedepends=('flex-git' 'mpich') # flex won't work
provides=('scotch' 'ptscotch-mpich')
conflicts=('scotch' 'ptscotch-mpich')
arch=('i686' 'x86_64')
source=("http://gforge.inria.fr/frs/download.php/file/${_downloadnum}/scotch_${pkgver}.tar.gz")
sha256sums=('5b21b95e33acd5409d682fa7253cefbdffa8db82875549476c006d8cbe7c556f')
 
prepare() {
  cd scotch_${pkgver}/src
 
  [ -e Makefile.inc ] && rm Makefile.inc
  cp "Make.inc/Makefile.inc.${CARCH/_/-}_pc_linux2.shlib" Makefile.inc
  sed -i "s/-O3/${CFLAGS} -fPIC/g" Makefile.inc
 
  # disable SCOTCH_PTHREAD
  sed -i "s/-DSCOTCH_PTHREAD//" Makefile.inc

  # Fix C compiler
  sed -i "s,= mpicc,= ${_prefix}/bin/mpicc," Makefile.inc
  sed -i "s,CCD\t.*=.*gcc,CCD = ${_prefix}/bin/mpicc," Makefile.inc

  # Use the mpirun of mpich for testing
  sed -i "s,mpirun,${_prefix}/bin/mpirun," check/Makefile

  # Also enable bzip2 compression
  sed -i "s/-DCOMMON_FILE_COMPRESS_GZ/-DCOMMON_FILE_COMPRESS_GZ -DCOMMON_FILE_COMPRESS_BZ2/" Makefile.inc
  sed -i "s/-lz/-lz -lbz2/" Makefile.inc
 
  # Fix the creation of directories
  sed -i "s/mkdir/mkdir\ -p/" Makefile.inc
 
  # To install headers and libs also for esmumps
  sed -i 's/scotch\*/{scotch,esmumps}\*/g' Makefile

  # fix an installation bug (which is usually ignored anyway)
  sed -i "/\.\.\/bin\/\[agm\]/d" Makefile
  sed -i 's/mpirun/mpirun --oversubscribe/' check/Makefile
}
 
build() {
  cd scotch_${pkgver}/src
 
  make ptscotch
  make -j1 ptesmumps
}
 
check() {
  cd scotch_${pkgver}/src
 
  make ptcheck LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:../../lib"
}
 
package() {
  cd scotch_${pkgver}/src
 
  make install prefix="$pkgdir"/$_prefix \
       includedir="$pkgdir"/$_prefix/include/scotch
 
  install -m 644 -D "$srcdir"/scotch_${pkgver}/doc/CeCILL-C_V1-en.txt \
	  "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
