# $Id$
# Maintainer: Peter Strapp <peter at strapp.co.uk>

pkgname=libindi_3rdparty
pkgver=1.2.0
pkgrel=2
pkgdesc="3rd party drivers for INDI, a distributed control protocol designed to operate astronomical instrumentation"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=(libvorbis libusb openal libnova libjpeg libindi libgphoto2 libftdi-compat cfitsio dcraw libqhy-git)
makedepends=(cmake boost)
source=("http://indilib.org/jdownloads/Source/${pkgname}_${pkgver}.tar.gz")
sha1sums=('7348b96ae663d11ea877bdb9f181e3126e14eeb6')

prepare() {
  mkdir -p build
  cd ${pkgname}_${pkgver}
  find ./ -name CMakeLists.txt -exec sed -i -e 's|"\/lib|"${CMAKE_INSTALL_PREFIX}/lib|g' {} \;        # Allow installing outside of /lib
  sed -e 's|<ApogeeCam.h>|<libapogee/ApogeeCam.h>|' -i indi-apogee/apogee_ccd.h                       # Headers found in libapogee directory
  sed -e 's|<FindDeviceEthernet.h>|<libapogee/FindDeviceEthernet.h>|' -i indi-apogee/apogee_ccd.h     # Headers found in libapogee directory
  sed -e 's|<FindDeviceUsb.h>|<libapogee/FindDeviceUsb.h>|' -i indi-apogee/apogee_ccd.h               # Headers found in libapogee directory
  sed -e 's|#add_subdirectory[(]indi-qhy[)]|add_subdirectory(indi-qhy)|' -i CMakeLists.txt            # Enable build of QHY INDI driver (despite it being "broken")
  cp CMakeLists.txt CMakeLists.txt.bak                                                                # Backup CMakeLists.txt. It's modified for first pass and restored for second pass.
  sed -e '/###/d' -i CMakeLists.txt                                                                   # Force all libraries to be built
  sed -e '/_FOUND[)]/d' -i CMakeLists.txt                                                             # Force all libraries to be built
  sed -e '/add_subdirectory[(]indi-/d' -i CMakeLists.txt                                              # Force all libraries to be built
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ../${pkgname}_${pkgver}
  make DESTDIR="/tmp/${pkgname}_${pkgver}" install                                                   # Install libraries to temp directory for use in INDI driver build

  cp ../${pkgname}_${pkgver}/CMakeLists.txt.bak ../${pkgname}_${pkgver}/CMakeLists.txt               # Restore original CMakeLists.txt for INDI driver build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFISHCAMP_LIBRARIES=/tmp/${pkgname}_${pkgver}/usr/lib/libfishcamp.so \
    -DFISHCAMP_INCLUDE_DIR=/tmp/${pkgname}_${pkgver}/usr/include/libfishcamp \
    -DAPOGEE_LIBRARY=/tmp/${pkgname}_${pkgver}/usr/lib/libapogee.so \
    -DAPOGEE_INCLUDE_DIR=/tmp/${pkgname}_${pkgver}/usr/include \
    -DFLI_LIBRARIES=/tmp/${pkgname}_${pkgver}/usr/lib/libfli.so \
    -DFLI_INCLUDE_DIR=/tmp/${pkgname}_${pkgver}/usr/include \
    -DQSI_LIBRARIES=/tmp/${pkgname}_${pkgver}/usr/lib/libqsiapi.so \
    -DQSI_INCLUDE_DIR=/tmp/${pkgname}_${pkgver}/usr/include \
    -DSBIG_LIBRARIES=/tmp/${pkgname}_${pkgver}/usr/lib/libsbigudrv.so.2.1.0 \
    -DSBIG_INCLUDE_DIR=/tmp/${pkgname}_${pkgver}/usr/include/libsbig \
    ../${pkgname}_${pkgver}
}

package() {
  cp -R /tmp/${pkgname}_${pkgver}/* $pkgdir
  cd build
  make DESTDIR="$pkgdir" install
  rm -rf /tmp/${pkgname}_${pkgver}
}