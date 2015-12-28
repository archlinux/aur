# $Id$
# Maintainer: Peter Strapp <peter at strapp.co.uk>

pkgname=libindi_3rdparty
pkgver=1.1.0
pkgrel=1
pkgdesc="3rd party drivers for INDI, a distributed control protocol designed to operate astronomical instrumentation"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=(libvorbis libusb openal libnova libjpeg libindi libgphoto2 libftdi-compat cfitsio dcraw)
makedepends=(cmake boost)
source=("http://www.indilib.org/jdownloads/Source/${pkgname}_$pkgver.tar.gz")
sha1sums=('dff30ef8fd4021a6bda6381c011e334dbb0b8c8d')

prepare() {
  mkdir -p build tmp
  cd ${pkgname}_${pkgver}
  find ./ -name CMakeLists.txt -exec sed -i -e 's|"/lib/firmware|"/usr/lib/firmware|' {} \;
  find ./ -name CMakeLists.txt -exec sed -i -e 's|"/lib/udev|"/etc/udev|' {} \;
  sed -e 's|<ApogeeCam.h>|<libapogee/ApogeeCam.h>|' -i indi-apogee/apogee_ccd.h
  sed -e 's|<FindDeviceEthernet.h>|<libapogee/FindDeviceEthernet.h>|' -i indi-apogee/apogee_ccd.h
  sed -e 's|<FindDeviceUsb.h>|<libapogee/FindDeviceUsb.h>|' -i indi-apogee/apogee_ccd.h
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ../${pkgname}_$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFISHCAMP_LIBRARIES=$pkgdir/usr/lib/libfishcamp.so \
    -DFISHCAMP_INCLUDE_DIR=$pkgdir/usr/include/libfishcamp \
    -DAPOGEE_LIBRARY=$pkgdir/usr/lib/libapogee.so \
    -DAPOGEE_INCLUDE_DIR=$pkgdir/usr/include \
    -DFLI_LIBRARIES=$pkgdir/usr/lib/libfli.so \
    -DFLI_INCLUDE_DIR=$pkgdir/usr/include \
    -DQSI_LIBRARIES=$pkgdir/usr/lib/libqsiapi.so \
    -DQSI_INCLUDE_DIR=$pkgdir/usr/include \
    -DSBIG_LIBRARIES=$pkgdir/usr/lib/libsbigudrv.so.2.1.0 \
    -DSBIG_INCLUDE_DIR=$pkgdir/usr/include/libsbig \
    ../${pkgname}_$pkgver
  make DESTDIR="$pkgdir" install
}