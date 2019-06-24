# Maintainer: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Contributor: Peter Strapp <peter at strapp.co.uk>

pkgname=libindi_3rdparty
pkgver=1.7.9
pkgrel=1
pkgdesc="3rd party drivers for INDI, a distributed control protocol designed to operate astronomical instrumentation"
provides=('libindi_3rdparty')
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=(libvorbis libusb openal libnova libjpeg libindi libgphoto2 libftdi-compat cfitsio dcraw libftdi rtl-sdr)
makedepends=(cmake boost)
conflicts=(libqhy-git)
source=("https://github.com/indilib/indi/archive/v${pkgver}.tar.gz")
sha256sums=('b42d0a6849543ea2d144e8ee280611c4c44f7b11ecbae18378df440e0907730a')

prepare() {
  mkdir -p build
  cd indi-${pkgver}/3rdparty
  find ./ -name CMakeLists.txt -exec sed -i -e 's|"\/lib|"${CMAKE_INSTALL_PREFIX}/lib|g' {} \;        # Allow installing outside of /lib
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ../indi-${pkgver}/3rdparty
  make DESTDIR="/tmp/${pkgname}_${pkgver}" install                                                   # Install libraries to temp directory for use in INDI driver build

#  cp ../${pkgname}_${pkgver}/CMakeLists.txt.bak ../${pkgname}_${pkgver}/CMakeLists.txt               # Restore original CMakeLists.txt for INDI driver build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DFISHCAMP_LIBRARIES=/tmp/${pkgname}_${pkgver}/usr/lib/libfishcamp.so \
    -DFISHCAMP_INCLUDE_DIR:PATH=/tmp/${pkgname}_${pkgver}/usr/include/libfishcamp \
    -DAPOGEE_LIBRARY=/tmp/${pkgname}_${pkgver}/usr/lib/libapogee.so \
    -DAPOGEE_INCLUDE_DIR:PATH="/tmp/${pkgname}_${pkgver}/usr/include/libapogee;/tmp/${pkgname}_${pkgver}/usr/include" \
    -DFLI_LIBRARIES=/tmp/${pkgname}_${pkgver}/usr/lib/libfli.so \
    -DFLI_INCLUDE_DIR:PATH=/tmp/${pkgname}_${pkgver}/usr/include \
    -DQSI_LIBRARIES=/tmp/${pkgname}_${pkgver}/usr/lib/libqsiapi.so \
    -DQSI_INCLUDE_DIR:PATH=/tmp/${pkgname}_${pkgver}/usr/include \
    -DQHY_LIBRARIES=/tmp/${pkgname}_${pkgver}/usr/lib/libqhyccd.so \
    -DQHY_INCLUDE_DIR:PATH=/tmp/${pkgname}_${pkgver}/usr/include/libqhy \
    -DSBIG_LIBRARIES=/tmp/${pkgname}_${pkgver}/usr/lib/libsbig.so \
    -DSBIG_INCLUDE_DIR:PATH=/tmp/${pkgname}_${pkgver}/usr/include/libsbig \
    ../indi-${pkgver}/3rdparty
}

package() {
  cp -R /tmp/${pkgbase}_${pkgver}/* $pkgdir
  cd build
  make DESTDIR="$pkgdir" install
  rm -rf /tmp/${pkgname}_${pkgver}
}
