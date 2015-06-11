# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Martin Ortbauer <mortbauer@gmail.com>
# Original: Michele Mocciola <mickele>
# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Modified by: César Vecchio <cesar UNDERSTRIKE vecchio AT yahoo DOT com>

pkgname=med-openmpi
pkgver=3.0.8
pkgrel=3
pkgdesc="MED stands for Modelisation et Echanges de Donnees, i.e. Data Modelization and Exchanges - MED is code-aster exchange module linked to hdf5"
url="http://www.code-aster.org/outils/med/"
license="LGPL"
depends=('hdf5-openmpi' 'zlib')
makedepends=('gcc-fortran' 'coreutils' 'openmpi' 'swig')
provides=('med')
conflicts=('med')
replaces=('med')
arch=('i686' 'x86_64')
source=("http://files.salome-platform.org/Salome/other/${pkgname//-openmpi/}-${pkgver}.tar.gz"
	h5public_extract.patch)
md5sums=('8adb41767474d262abca1ce031d08f47'
         '156ab9456bab7b70237d0fc785b97e7c')

prepare() {
  cd ${srcdir}/${pkgname//-openmpi/}-${pkgver} || return 1
  patch -Np1 -i ../h5public_extract.patch
}

build() {
  cd ${srcdir}/${pkgname//-openmpi/}-${pkgver} || return 1

  PYTHON=/usr/bin/python2 MPIFC=mpif90 ./configure --prefix=/usr --with-swig=swig --datadir=/usr/share/med --with-med_int=int || return 1
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname//-openmpi/}-${pkgver} || return 1

  make DESTDIR=${pkgdir} install || return 1
  # now move the testprograms to share, we don't want all the stuff in the bindir
  cp -dpr --no-preserve=ownership ${pkgdir}/usr/bin/testc ${pkgdir}/usr/share/med/testc
  cp -dpr --no-preserve=ownership ${pkgdir}/usr/bin/testf ${pkgdir}/usr/share/med/
  cp -dpr --no-preserve=ownership ${pkgdir}/usr/bin/unittests ${pkgdir}/usr/share/med/
  cp -dpr --no-preserve=ownership ${pkgdir}/usr/bin/usescases ${pkgdir}/usr/share/med/
  rm -r ${pkgdir}/usr/bin/{usescases,unittests,testf,testc}
}

