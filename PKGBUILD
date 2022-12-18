# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname='geant4-full'
pkgver=11.1.0
pkgrel=5
pkgdesc="A simulation toolkit for particle physics interactions - includes all the optional libraries"
depends=(
  'cmake>=3.16'
  'xerces-c>=3'
  'qt6-base'
  'glu'
  'openmotif'
  'soqt'
  'zlib'
  'python>=3'
  'boost'
)
conflicts=('geant4_devel' 'geant4' 'geant4-debug')
optdepends=(
  'java-environment'
  'tcsh'
  'geant4-lend'
)
url="http://geant4.cern.ch/"
arch=('x86_64')
license=('custom: http://geant4.cern.ch/license/')
options=('!emptydirs')
source=(
  "http://geant4-data.web.cern.ch/releases/geant4-v${pkgver}.tar.gz"
  'geant4-full.install'
)
sha256sums=(
  "051e43066152c373f74746bdffe6f0c9e4175ad9cf1eb7b67da0dc1a05d0b985"
  '40db557cb8f9d20d91e03dbae2d9bbec75c922b0175ef383f06e44881184c3e4'
)
install="geant4-full.install"

build() {

  cd $srcdir
  echo "
export G4NEUTRONHPDATA=/usr/share/Geant4/data/G4NDL4.7
export G4LEDATA=/usr/share/Geant4/data/G4EMLOW8.2
export G4LEVELGAMMADATA=/usr/share/Geant4/data/PhotonEvaporation5.7
export G4RADIOACTIVEDATA=/usr/share/Geant4/data/RadioactiveDecay5.6
export G4PARTICLEXSDATA=/usr/share/Geant4/data/G4PARTICLEXS4.0
export G4PIIDATA=/usr/share/Geant4/data/G4PII1.3
export G4REALSURFACEDATA=/usr/share/Geant4/data/RealSurface2.2
export G4SAIDXSDATA=/usr/share/Geant4/data/G4SAIDDATA2.0
export G4ABLADATA=/usr/share/Geant4/data/G4ABLA3.1
export G4INCLDATA=/usr/share/Geant4/data/G4INCL1.0
export G4ENSDFSTATEDATA=/usr/share/Geant4/data/G4ENSDFSTATE2.3" >> Geant4.sh

  echo "
setenv G4NEUTRONHPDATA /usr/share/Geant4/data/G4NDL4.7
setenv G4LEDATA /usr/share/Geant4/data/G4EMLOW8.2
setenv G4LEVELGAMMADATA /usr/share/Geant4/data/PhotonEvaporation5.7
setenv G4RADIOACTIVEDATA /usr/share/Geant4/data/RadioactiveDecay5.6
setenv G4PARTICLEXSDATA /usr/share/Geant4/data/G4PARTICLEXS4.0
setenv G4PIIDATA /usr/share/Geant4/data/G4PII1.3
setenv G4REALSURFACEDATA /usr/share/Geant4/data/RealSurface2.2
setenv G4SAIDXSDATA /usr/share/Geant4/data/G4SAIDDATA2.0
setenv G4ABLADATA /usr/share/Geant4/data/G4ABLA3.1
setenv G4INCLDATA /usr/share/Geant4/data/G4INCL1.0
setenv G4ENSDFSTATEDATA /usr/share/Geant4/data/G4ENSDFSTATE2.3" >> Geant4.csh

  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  env -i \
    QT_SELECT=6 \
    PATH=/usr/bin \
    cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DGEANT4_BUILD_MULTITHREADED=ON \
      -DGEANT4_INSTALL_DATA=ON \
      -DGEANT4_USE_G3TOG4=ON \
      -DGEANT4_USE_GDML=ON \
      -DGEANT4_USE_INVENTOR_QT=ON \
      -DGEANT4_USE_OPENGL_X11=ON \
      -DGEANT4_USE_QT=ON \
      -DGEANT4_USE_RAYTRACER_X11=ON \
      -DGEANT4_USE_SYSTEM_ZLIB=ON \
      -DGEANT4_USE_XM=ON \
      -DGEANT4_INSTALL_PACKAGE_CACHE=OFF \
      -DGEANT4_USE_PYTHON=ON \
      -DGEANT4_USE_TOOLSSG=QT \
      -DGEANT4_BUILD_TLS_MODEL=global-dynamic \
      ../geant4-v${pkgver}

  make VERBOSE=1
}

package() {
  cd $srcdir
  install -D -m 755 Geant4.sh $pkgdir/etc/profile.d/Geant4.sh
  install -D -m 755 Geant4.csh $pkgdir/etc/profile.d/Geant4.csh

  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
}
