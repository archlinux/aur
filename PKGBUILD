# Maintainer: Michele Mocciola <mickele>
# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Contributor: Philippe Miron <tuxication@gmail.com>
# Modified by: César Vecchio <cesar UNDERSTRIKE vecchio AT yahoo DOT com>
# Modified by: Martin Ortbauer <mortbauer@gmail.com>
     
pkgname=med-salome
_pkgname=med
pkgver=3.1.0
pkgrel=1
pkgdesc="MED stands for Modelisation et Echanges de Donnees, i.e. Data Modelization and Exchanges - This version is built to be linked against salome-med on x86_64"
url="http://www.code-aster.org/outils/med/"
license=('LGPL')
depends=('hdf5')
makedepends=('gcc-fortran' 'coreutils')
optdepends=('tk' 'python2')
provides=("med={pkgver}")
conflicts=("med_fichier" "med")
replaces=("med_fichier" "med")
backup=()
arch=('i686' 'x86_64')
source=("http://files.salome-platform.org/Salome/other/${_pkgname}-${pkgver}.tar.gz")

# _installdir=/opt/${pkgname}
_installdir=/usr
_sharedir=${_installdir}/share/${pkgname}

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}_SRC || return 1
 
  # patch to avoid inconcsistency between med_proto.h and MEDequivInfo.c
  sed -i -e "s|int fid|med_idt fid|" ./src/2.3.6/ci/MEDequivInfo.c
}

build() {
  export PYTHON="python2"

  cd ${srcdir}/${_pkgname}-${pkgver}_SRC
 
  ./configure --with-f90=gfortran --prefix=${_installdir}  --with-med_int=int --datadir=${_sharedir}
  make
}
 
package() {
  cd ${srcdir}/${_pkgname}-${pkgver}_SRC
 
  make DESTDIR=${pkgdir} install
  
  ln -sf mdump3 ${pkgdir}/usr/bin/mdump
  ln -sf xmdump3 ${pkgdir}/usr/bin/xmdump

  # now move the testprograms to share, we don't want all the stuff in the bindir
  for _FILE in usescases unittests testf testc testpy
  do
    rm -rf ${pkgdir}${_installdir}/bin/${_FILE}
  done
}

md5sums=('a1e1eb068f20634f5ea797914241eb51')
