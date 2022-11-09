# Maintainer: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Contributor: Peter Strapp <peter at strapp.co.uk>

pkgname=libindi_3rdparty
pkgver=1.9.8
pkgrel=1
pkgdesc="3rd party drivers for INDI, a distributed control protocol designed to operate astronomical instrumentation"
provides=("libindi_3rdparty")
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=(libvorbis libusb openal libnova libjpeg libindi libgphoto2 libftdi-compat cfitsio dcraw libftdi rtl-sdr)
makedepends=(cmake boost)
conflicts=()
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz" "celestronaux-auxproto.diff" "libfirmata-firmata.diff")
sha256sums=("a222a22ca4edae1816255e3851cfdb91efff557378021a44ca05d672410fc81e" "fef4fe62933872bbf6424e8ee538363d38288ed12fce0222fd566bcb5a4bf372" "525dc01ac3b4f96ee02809806abc309ce753271632cef267495074f74808c2c2")


prepare() {
  mkdir -p build
  cd indi-3rdparty-${pkgver}
  patch -Np1 < ${srcdir}/celestronaux-auxproto.diff
  patch -Np1 < ${srcdir}/libfirmata-firmata.diff
  find ./ -name CMakeLists.txt -exec sed -i -e 's|"\/lib|"${CMAKE_INSTALL_PREFIX}/lib|g' {} \;        # Allow installing outside of /lib
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_ASICAM=Off \
    -DWITH_QHY=Off \
    -DWITH_GPSD=Off \
    -DWITH_QSI=Off \
    -DWITH_EQMOD=Off \
    -DWITH_GPSNMEA=Off \
    ../indi-3rdparty-${pkgver}
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
    -DSBIG_LIBRARIES=/tmp/${pkgname}_${pkgver}/usr/lib/libsbig.so \
    -DSBIG_INCLUDE_DIR:PATH=/tmp/${pkgname}_${pkgver}/usr/include/libsbig \
    -DWITH_ASICAM=Off \
    -DWITH_QHY=Off \
    -DWITH_GPSD=Off \
    -DWITH_QSI=Off \
    -DWITH_EQMOD=Off \
    -DWITH_GPSNMEA=Off \
    ../indi-3rdparty-${pkgver}
}

package() {
  cp -R /tmp/${pkgbase}_${pkgver}/* $pkgdir
  cd build
  make DESTDIR="$pkgdir" install
  rm -rf /tmp/${pkgname}_${pkgver}
}
