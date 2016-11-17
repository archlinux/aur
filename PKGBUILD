# Maintainer: Michele Mocciola <mickele>
# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Contributor: Philippe Miron <tuxication@gmail.com>
# Modified by: César Vecchio <cesar UNDERSTRIKE vecchio AT yahoo DOT com>
# Modified by: Martin Ortbauer <mortbauer@gmail.com>
     
pkgname=med-salome
_pkgname=med
pkgver=3.2.0
pkgrel=1
pkgdesc="MED stands for Modelisation et Echanges de Donnees, i.e. Data Modelization and Exchanges - This version is built to be linked against salome-med on x86_64"
url="http://www.code-aster.org/outils/med/"
license=('LGPL')
depends=('hdf5' 'python2')
makedepends=('gcc-fortran' 'coreutils' 'swig')
optdepends=('tk')
provides=("med={pkgver}")
conflicts=("med_fichier" "med")
replaces=("med_fichier" "med")
backup=()
arch=('i686' 'x86_64')
source=("http://files.salome-platform.org/Salome/other/${_pkgname}-${pkgver}.tar.gz"
        "patch-include_2.3.6_med.h.in"
        "patch-include_med.h.in"
        "patch-src_2.3.6_ci_MEDequivInfo.c"
        "patch-int2long")
md5sums=('eb61df92f0624feb6328f517cd756a23'
         'b83949326d7ae0ca77a06822b754a329'
         '14a151cea108388d7a3b4c62887169f6'
         '8f0cbf6f08783a6ba68ff5ab240dd62e'
         '08c436aee7cf573ff28463cc2e88ec1b')
	

# _installdir=/opt/${pkgname}
_installdir=/usr
_sharedir=${_installdir}/share/${pkgname}

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # patch H5public_extract.h.in
  sed -i -e '/^#typedef/ s/#/\/\//' ./include/H5public_extract.h.in
  
  #patch for hdf5-1.10
  patch -p0 < ${srcdir}/patch-include_2.3.6_med.h.in
  patch -p0 < ${srcdir}/patch-include_med.h.in
  patch -p0 < ${srcdir}/patch-src_2.3.6_ci_MEDequivInfo.c
  patch -p0 < ${srcdir}/patch-int2long
}

build() {
  export FFLAGS="-fopenmp -fPIC -ffixed-line-length-0 ${CFLAGS}"
  export FCFLAGS="-fopenmp -fPIC -ffixed-line-length-0 ${CFLAGS}"
  export F77=gfortran
  export FC=gfortran
  export PYTHON="$(which python2)"

  cd ${srcdir}/${_pkgname}-${pkgver}

  ./configure --with-f90=gfortran --prefix=${_installdir} --with-med_int=int --datadir=${_sharedir} --with-swig=yes
  make
}
 
package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
  
  # now move the testprograms to share, we don't want all the stuff in the bindir
  cp -dpr --no-preserve=ownership ${pkgdir}/usr/bin/testc ${pkgdir}${_sharedir}/testc
  cp -dpr --no-preserve=ownership ${pkgdir}/usr/bin/testf ${pkgdir}${_sharedir}
  cp -dpr --no-preserve=ownership ${pkgdir}/usr/bin/unittests ${pkgdir}${_sharedir}
  cp -dpr --no-preserve=ownership ${pkgdir}/usr/bin/usescases ${pkgdir}${_sharedir}
  rm -r ${pkgdir}/usr/bin/{usescases,unittests,testf,testc}
}
