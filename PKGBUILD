# Maintainer: Graziano Giuliani <graziano.giuliani@gmail.com>
pkgname=ncregrid
pkgver=1.5b
pkgrel=1
pkgdesc="Tool (written in FORTRAN-90) for data transfer of gridded 2- and 3-dimensional (spatial) geophysical/geochemical scalar fields between grids of different resolutions."
arch=(i686 x86_64)
url="http://www.pa.op.dlr.de/~PatrickJoeckel/ncregrid/index.html"
license=('GPL')
depends=(netcdf-fortran)
makedepends=(gcc-fortran)
source=(http://www.pa.op.dlr.de/~PatrickJoeckel/ncregrid/ncregrid.tar.gz)
md5sums=('7f5399aec42c42b79cbe63cfc1e2b2c5')

build() {
  cd ${srcdir}/${pkgname}
  sed -i configure -e 's/libnetcdf.a/libnetcdff.so/'
  F90=gfortran F90FLAGS="$FCFLAGS" \
    NC_INC=/usr/include NC_LIB=/usr/lib ./configure --prefix=/usr
  for file in src/*.f90
  do
    cp -a $file src/`basename $file .f90`.F90
  done
  sed -e 's/\.f90/\.F90/g' -i src/Makefile
  sed -e 's/-lnetcdf/-lnetcdff -lnetcdf/' -i Makefile
  make
}

package() {
  cd ${srcdir}/${pkgname}
  mkdir -p ${pkgdir}/usr/{bin,share/${pkgname}/examples}
  install -m 755 src/ncregrid ${pkgdir}/usr/bin
  install -m 644 doc/ncregrid.pdf ${pkgdir}/usr/share/${pkgname}
  cp -a examples/* ${pkgdir}/usr/share/${pkgname}/examples
  find ${pkgdir}/usr/share/${pkgname}/examples -type d -exec chmod 755 {} \;
  find ${pkgdir}/usr/share/${pkgname}/examples -type f -exec chmod 644 {} \;
  rmdir ${pkgdir}/usr/share/${pkgname}/examples/namelist/output
}

# vim:set ts=2 sw=2 et:
