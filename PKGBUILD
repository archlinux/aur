# Maintainer: Filippo Falezza <filippo dot falezza at outlook dot it>

pkgname='geant4-full'
pkgver=11.1.3
pkgrel=1
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
  'tbb'
  'root'
)
provides=('geant4')
conflicts=(
  'geant4_devel'
  'geant4'
  'geant4-debug'
  'geant4-abladata'
  'geant4-ensdfstatedata'
  'geant4-incldata'
  'geant4-ledata'
  'geant4-levelgammadata'
  'geant4-neutronhpdata'
  'geant4-neutronxsdata'
  'geant4-particlexsdata'
  'geant4-piidata'
  'geant4-radioactivedata'
  'geant4-realsurfacedata'
  'geant4-saiddata'
)
optdepends=(
  'java-environment'
  'tcsh'
  'geant4-lend'
  'dawn'
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
  "4c5fbea6789d8d619edacca0631d6b5211a60e1bf9974c3d3fab9ef9e22692f5"
  "b03e886435addd44eea965c7a4a59deddc34c55381af2584042b2737c89b698e"
)
install="geant4-full.install"

build() {

  cd $srcdir
  echo "
export PATH=\$PATH:/opt/Geant4/Geant4-v${pkgver}/bin
export G4NEUTRONHPDATA=/opt/Geant4/Libraries/G4NDL4.7
export G4LEDATA=/opt/Geant4/Libraries/G4EMLOW8.2
export G4LEVELGAMMADATA=/opt/Geant4/Libraries/PhotonEvaporation5.7
export G4RADIOACTIVEDATA=/opt/Geant4/Libraries/RadioactiveDecay5.6
export G4PARTICLEXSDATA=/opt/Geant4/Libraries/G4PARTICLEXS4.0
export G4PIIDATA=/opt/Geant4/Libraries/G4PII1.3
export G4REALSURFACEDATA=/opt/Geant4/Libraries/RealSurface2.2
export G4SAIDXSDATA=/opt/Geant4/Libraries/G4SAIDDATA2.0
export G4ABLADATA=/opt/Geant4/Libraries/G4ABLA3.1
export G4INCLDATA=/opt/Geant4/Libraries/G4INCL1.0
export G4TENDLDATA=/opt/Geant4/Libraries/G4TENDL1.4/
export G4ENSDFSTATEDATA=/opt/Geant4/Libraries/G4ENSDFSTATE2.3
export G4PARTICLEHPDATA=/opt/Geant4/Libraries/G4TENDL1.4" > Geant4.sh

  echo "
setenv PATH \$PATH:/opt/Geant4/Geant4-v${pkgver}/bin
setenv G4NEUTRONHPDATA /opt/Geant4/data/G4NDL4.7
setenv G4LEDATA /opt/Geant4/Libraries/G4EMLOW8.2
setenv G4LEVELGAMMADATA /opt/Geant4/Libraries/PhotonEvaporation5.7
setenv G4RADIOACTIVEDATA /opt/Geant4/Libraries/RadioactiveDecay5.6
setenv G4PARTICLEXSDATA /opt/Geant4/Libraries/G4PARTICLEXS4.0
setenv G4PIIDATA /opt/Geant4/Libraries/G4PII1.3
setenv G4REALSURFACEDATA /opt/Geant4/Libraries/RealSurface2.2
setenv G4SAIDXSDATA /opt/Geant4/Libraries/G4SAIDDATA2.0
setenv G4ABLADATA /opt/Geant4/Libraries/G4ABLA3.1
setenv G4INCLDATA /opt/Geant4/Libraries/G4INCL1.0
setenv G4TENDLDATA /opt/Geant4/Libraries/G4TENDL1.4/
setenv G4ENSDFSTATEDATA /opt/Geant4/Libraries/G4ENSDFSTATE2.3
setenv G4PARTICLEHPDATA /opt/Geant4/Libraries/G4TENDL1.4" > Geant4.csh

  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/Geant4/Geant4-v${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DGEANT4_BUILD_MULTITHREADED=ON \
    -DGEANT4_INSTALL_DATA=ON \
    -DGEANT4_INSTALL_DATASETS_TENDL=ON \
    -DGEANT4_USE_G3TOG4=ON \
    -DGEANT4_USE_GDML=ON \
    -DGEANT4_USE_INVENTOR_QT=ON \
    -DGEANT4_USE_FREETYPE=ON \
    -DGEANT4_USE_OPENGL_X11=ON \
    -DGEANT4_USE_QT=ON \
    -DGEANT4_USE_RAYTRACER_X11=ON \
    -DGEANT4_USE_SYSTEM_ZLIB=OFF \
    -DGEANT4_USE_XM=ON \
    -DGEANT4_INSTALL_PACKAGE_CACHE=OFF \
    -DGEANT4_USE_PYTHON=ON \
    -DGEANT4_USE_TBB=ON \
    -DGEANT4_BUILD_TLS_MODEL=global-dynamic \
    -DGEANT4_INSTALL_DATADIR=/opt/Geant4/Libraries \
    ../geant4-v${pkgver}

  #set GEANT4_BUILD_TLS_MODEL=global-dynamic and GEANT4_USE_PYTHON=ON for compatibility with g4python
  make #VERBOSE=1
}

package() {
  cd $srcdir
  install -D -m 755 Geant4.sh $pkgdir/etc/profile.d/Geant4.sh
  install -D -m 755 Geant4.csh $pkgdir/etc/profile.d/Geant4.csh

  cd ${srcdir}/build
  make DESTDIR="${pkgdir}" install
  ln -s /opt/Geant4/Geant4-v${pkgver}/lib ${pkgdir}/opt/Geant4/Geant4-v${pkgver}/lib64
}
