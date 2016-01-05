# Maintainer Oliver Goethel <deezy>
# Contributor: Michele Mocciola <mickele>
# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Contributor: Philippe Miron <tuxication@gmail.com>
# Modified by: César Vecchio <cesar UNDERSTRIKE vecchio AT yahoo DOT com>
# Modified by: Martin Ortbauer <mortbauer@gmail.com>
     
pkgname=med
pkgver=3.1.0
pkgrel=1
pkgdesc="MED stands for Modelisation et Echanges de Donnees, i.e. Data Modelization and Exchanges - MED is code-aster exchange module linked to hdf5"
url="http://www.code-aster.org/outils/med/"
license=('LGPL')
depends=('hdf5' 'openmpi' 'swig')
makedepends=('gcc-fortran' 'coreutils')
optdepends=('tk' 'python2')
provides=()
conflicts=('med_fichier')
replaces=('med_fichier')
backup=()
arch=('i686' 'x86_64')
source=("http://files.salome-platform.org/Salome/other/${pkgname}-${pkgver}.tar.gz")
md5sums=('a1e1eb068f20634f5ea797914241eb51')
 
build() {
  if [ "$CARCH" = "x86_64" ]; then
    export FFLAGS="-fopenmp -fPIC -fdefault-double-8 -fdefault-integer-8 -fdefault-real-8 -ffixed-line-length-0 ${CFLAGS}"
    export FCFLAGS="-fopenmp -fPIC -fdefault-double-8 -fdefault-integer-8 -fdefault-real-8 -ffixed-line-length-0 ${CFLAGS}"
    export CPPFLAGS="-DHAVE_F77INT64 ${CPPFLAGS}"
    export F77=mpif90
    export FC=mpif90
  else # i686
    export FFLAGS="-fopenmp -fPIC -ffixed-line-length-0 ${CFLAGS}"
    export FCFLAGS="-fopenmp -fPIC -ffixed-line-length-0 ${CFLAGS}"
    export F77=mpif90
    export FC=mpif90
  fi
  
  export PYTHON="$(which python2)"

  cd ${srcdir}/${pkgname}-${pkgver}_SRC || return 1
 
  # patch H5public_extract.h.in
  sed -i -e '/^#typedef/ s/#/\/\//' ./include/H5public_extract.h.in
 
  ./configure --with-f90=mpif90 --prefix=/usr --datadir=/usr/share/med --with-swig=yes || return 1
  make || return 1
}
 
package() {
  cd ${srcdir}/${pkgname}-${pkgver}_SRC || return 1
 
  make DESTDIR=${pkgdir} install || return 1
  # now move the testprograms to share, we don't want all the stuff in the bindir
  cp -dpr --no-preserve=ownership ${pkgdir}/usr/bin/testc ${pkgdir}/usr/share/med/testc
  cp -dpr --no-preserve=ownership ${pkgdir}/usr/bin/testf ${pkgdir}/usr/share/med/
  cp -dpr --no-preserve=ownership ${pkgdir}/usr/bin/unittests ${pkgdir}/usr/share/med/
  cp -dpr --no-preserve=ownership ${pkgdir}/usr/bin/usescases ${pkgdir}/usr/share/med/
  rm -r ${pkgdir}/usr/bin/{usescases,unittests,testf,testc}
}

