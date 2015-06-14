# Maintainer: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
pkgname='geant4'
pkgver=10.01.01
_pkgver=10.01.p01
pkgrel=1
pkgdesc="A simulation toolkit for particle physics interactions."
depends=('cmake>=2.8.2' 'xerces-c' 'qt5-base' 'qt5-connectivity' 'qt5-declarative' 'qt5-enginio' 'qt5-graphicaleffects' 'qt5-imageformats' 'qt5-location'  'qt5-multimedia'  'qt5-quick1' 'qt5-quickcontrols' 'qt5-script' 'qt5-sensors' 'qt5-serialport' 'qt5-svg' 'qt5-tools' 'qt5-translations' 'qt5-wayland' 'qt5-webchannel' 'qt5-webengine' 'qt5-webkit' 'qt5-websockets' 'qt5-x11extras' 'qt5-xmlpatterns' 'glu' 'soxt' 'mesa' 'clhep')
replaces=('geant4-deb')
optdepends=('java-environment: for histogram visualizations and
analysis'
  'tcsh: for C Shell support'
  'python: for G4Python support'
  'geant4-abladata: Data files for nuclear shell effects in INCL/ABLA hadronic mode'
  'geant4-ledata: Data files for low energy electromagnetic processes'
  'geant4-levelgammadata: Data files for photon evaporation'
  'geant4-neutronhpdata: Neutron data files with thermal cross sections'
  'geant4-neutronxsdata: Data files for evaluated neutron cross sections on natural composition of elements'
  'geant4-piidata: Data files for shell ionisation cross sections'
  'geant4-radioactivedata: Data files for radioactive decay hadronic processes'
  'geant4-realsurfacedata: Data files for measured optical surface reflectance'
  'geant4-saiddata: Data files from evaluated cross-sections in SAID data-base')
url="http://geant4.cern.ch/"
arch=('x86_64' 'i686')
license=('custom: http://geant4.cern.ch/license/')
options=('!emptydirs')
install="${pkgname}.install"
source=("http://geant4.cern.ch/support/source/${pkgname}.${_pkgver}.tar.gz"
  "Geant4InterfaceOptions.patch"
  "${pkgname}.install")
md5sums=('145c91d167a3fda2ad811a468dd8221c'
         'cc428f31958c6e036cb01c0220b3fd83'
         'c3652d79011cd3fab2e1081e22f9f513')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

prepare() {
  cd ${srcdir}/${pkgname}.${_pkgver}/cmake/Modules/
#  patch -Np1 Geant4InterfaceOptions.cmake < ${srcdir}/Geant4InterfaceOptions.patch
}

## Geant4 Build Options
## http://geant4.web.cern.ch/geant4/UserDocumentation/UsersGuides/InstallationGuide/html/ch02s03.html

build() {
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  env -i \
    QT_SELECT=5 \
    PATH=/usr/bin \
    cmake -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DGEANT4_USE_GDML=ON \
    -DGEANT4_USE_G3TOG4=ON \
    -DGEANT4_USE_QT=ON \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5 \
    -DGEANT4_USE_XM=ON \
    -DGEANT4_BUILD_MULTITHREADED=ON \
    -DGEANT4_USE_SYSTEM_CLHEP=ON \
    -DGEANT4_USE_OPENGL_X11=ON \
    -DGEANT4_USE_INVENTOR=ON \
    -DGEANT4_USE_RAYTRACER_X11=ON \
    -DGEANT4_USE_SYSTEM_EXPAT=ON \
    -DGEANT4_USE_SYSTEM_ZLIB=ON \
    ../${pkgname}.${_pkgver}

  make

  ##  -DGEANT4_BUILD_CXXSTD=c++11 \
  ## this presents issues with some random number generation routines.
}

package() {

  #Since the basic package does not include the data files, their
  #configuration should be removed from the configuration file. Data
  #files are also available on the AUR and the environment variables
  #are set automatically for you from the packages.

  msg "Removing wrongly set environment variables"

  variables=("G4LEDATA" \
    "G4LEVELGAMMADATA" \
    "G4NEUTRONHPDATA" \
    "G4NEUTRONXSDATA" \
    "G4PIIDATA" \
    "G4RADIOACTIVEDATA" \
    "G4REALSURFACEDATA" \
    "G4SAIDXSDATA" \
    "G4ABLADATA" )

  for _varname in ${variables[*]}
  do
    sed -i "/${_varname}/d" ${srcdir}/build/InstallTreeFiles/geant4.sh
    sed -i "/${_varname}/d" ${srcdir}/build/InstallTreeFiles/geant4.csh
  done

  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install

  echo 'pushd /usr/bin &> /dev/null && source geant4.sh  && popd &>/dev/null' > ${srcdir}/geant4.profile.sh
  echo 'pushd /usr/bin &> /dev/null && source geant4.csh && popd &>/dev/null' > ${srcdir}/geant4.profile.csh
  install -d ${pkgdir}/etc/profile.d
  install -m755 ${srcdir}/geant4.profile.sh  ${pkgdir}/etc/profile.d/geant4.sh
  install -m755 ${srcdir}/geant4.profile.csh ${pkgdir}/etc/profile.d/geant4.csh
}
