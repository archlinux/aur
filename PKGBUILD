# Maintainer: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
pkgname='geant4'
pkgver=10.4.2
_pkgver=10.04.p02
pkgrel=1
pkgdesc="A simulation toolkit for particle physics interactions."
depends=('cmake>=2.8.2'
         'xerces-c'
         'qt5-base'
         'glu'
         'soxt'
        )
conflicts=('geant4_devel')
optdepends=('java-environment: for histogram visualizations and
analysis'
  'tcsh: for C Shell support'
  'python: for G4Python support'
  'geant4-abladata: Data files for nuclear shell effects in INCL/ABLA hadronic mode'
  'geant4-ensdfstatedata: Nuclei properties from the Evaluated Nuclear Structure Data Files'
  'geant4-ledata: Data files for low energy electromagnetic processes'
  'geant4-levelgammadata: Data files for photon evaporation'
  'geant4-neutronhpdata: Neutron data files with thermal cross sections'
  'geant4-neutronxsdata: Data files for evaluated neutron cross sections on natural composition of elements'
  'geant4-piidata: Data files for shell ionisation cross sections'
  'geant4-radioactivedata: Data files for radioactive decay hadronic processes'
  'geant4-realsurfacedata: Data files for measured optical surface reflectance'
  'geant4-saiddata: Data files from evaluated cross-sections in SAID data-base')
url="http://geant4.cern.ch/"
arch=('x86_64')
license=('custom: http://geant4.cern.ch/license/')
options=('!emptydirs')
install="${pkgname}.install"
source=("http://cern.ch/geant4-data/releases/${pkgname}.${_pkgver}.tar.gz"
  "${pkgname}.install")
md5sums=('b0a201c7b8ab1e45a07371b5cd3b09b0'
         'bfe6791027de966cad240d8584c6b657')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

build() {

  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  env -i \
      QT_SELECT=5 \
      PATH=/usr/bin \
      cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DGEANT4_BUILD_MULTITHREADED=ON \
      -DGEANT4_BUILD_CXXSTD=14 \
      -DGEANT4_INSTALL_DATA=OFF \
      -DGEANT4_USE_GDML=ON \
      -DGEANT4_USE_G3TOG4=ON \
      -DGEANT4_USE_QT=ON \
      -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5 \
      -DGEANT4_USE_XM=ON \
      -DGEANT4_USE_OPENGL_X11=ON \
      -DGEANT4_USE_INVENTOR=ON \
      -DGEANT4_USE_RAYTRACER_X11=ON \
      -DGEANT4_USE_SYSTEM_CLHEP=OFF \
      -DGEANT4_USE_SYSTEM_EXPAT=ON \
      -DGEANT4_USE_SYSTEM_ZLIB=ON \
      -DCMAKE_INSTALL_LIBDIR=lib \
      ../${pkgname}.${_pkgver}

  G4VERBOSE=1 make

}

package() {

  #Since the basic package does not include the data files, their
  #configuration should be removed from the configuration file. Data
  #files are also available on the AUR and the environment variables
  #are set automatically for you from the packages.

  msg "Removing 'wrongly' set environment variables"

  variables=("G4NEUTRONHPDATA" \
                 "G4LEDATA" \
                 "G4LEVELGAMMADATA" \
                 "G4RADIOACTIVEDATA" \
                 "G4NEUTRONXSDATA" \
                 "G4PIIDATA" \
                 "G4REALSURFACEDATA" \
                 "G4SAIDXSDATA" \
                 "G4ABLADATA" \
                 "G4ENSDFSTATEDATA")

  for _varname in ${variables[*]}
  do
    sed -i "/${_varname}/d" ${srcdir}/build/InstallTreeFiles/geant4.sh
    sed -i "/${_varname}/d" ${srcdir}/build/InstallTreeFiles/geant4.csh
  done

  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install

  echo 'pushd /usr/bin &> /dev/null && source geant4.sh  && popd &> /dev/null' > ${srcdir}/geant4.profile.sh
  echo 'pushd /usr/bin >& /dev/null && source geant4.csh && popd >& /dev/null' > ${srcdir}/geant4.profile.csh
  install -d ${pkgdir}/etc/profile.d
  install -m755 ${srcdir}/geant4.profile.sh  ${pkgdir}/etc/profile.d/geant4.sh
  install -m755 ${srcdir}/geant4.profile.csh ${pkgdir}/etc/profile.d/geant4.csh
}
