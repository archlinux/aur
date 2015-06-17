# Maintainer: Samuel Mesa <samuelmesa at linuxmail.org>

pkgname=taudem
_pkgname=TauDEM
pkgver=5.0.6
pkgrel=2
pkgdesc="Suite of Digital Elevation Model (DEM) tools for the extraction and analysis of hydrologic information from topography as represented by a DEM"
arch=(i686 x86_64)
url="http://hydrology.uwrl.usu.edu/taudem"
license=('GPL')
depends=()
makedepends=('openmpi' 'cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
options=('!makeflags')
source=(http://hydrology.usu.edu/taudem/taudem5/TauDEM5PCsrc_506.zip)
md5sums=('76848267b3acd1c4667b7c7d7112ade6')

build() {
   unzip ${_pkgname}5PCsrc_506.zip
   cd  src   
   sed -i -e '40 a #include <stdint.h>' ./linearpart.h
   find . -type f -name "*.cpp" -o -name "*.h" | xargs sed -i 's/#include "stdint.h"/#include <stdint.h>/' 
   
   rm -rf build
   mkdir build
   cd build
   
   msg "starting make..."
   CXX=mpicxx cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local 
   make all
}

package() {
  cd "$srcdir/"src/build
  make DESTDIR=${pkgdir} install
}  

