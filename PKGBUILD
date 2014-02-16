# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libfreenect
pkgver=0.3.0
pkgrel=1
pkgdesc="Drivers and libraries for the Xbox Kinect device on Linux"
arch=('i686' 'x86_64')
url="http://openkinect.org"
license=('GPL')
depends=('libusb' 'glu' 'freeglut' 'bash' 'python2')
makedepends=('cmake' 'libxmu' 'python2-numpy')
optdepends=('opencv: support for python demos'
            'python2-matplotlib: support for python demos')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/OpenKinect/libfreenect/archive/v${pkgver}.tar.gz)
md5sums=(c96d38d7d16e09294b41f650ccd3ea68)
sha256sums=(288a82402f5ca9d5edfec4fcf4af2c197433a12db03a0e7ce28ac77c530cedad)
sha384sums=(7c2b41fb647396a06c0f30ad0a77fa3c89d8ab05c35e5c9f5a9d7d919672a0559703229393261e92a80e8892a775fb51)
sha512sums=(6331c146dab2a0dd747985c6dbabfb9bf84edbc5e7fcb1ca53cd94e930f20f97c8e707017916c76dd939f25ee1e07a100bc564061ace2d31c59a0f2db77b61a7)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install "libfreenect.hpp" to "/usr/include/libfreenect"
  sed 's/DESTINATION include/DESTINATION ${PROJECT_INCLUDE_INSTALL_DIR}/g' -i "wrappers/cpp/CMakeLists.txt"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DPROJECT_INCLUDE_INSTALL_DIR=/usr/include -DLIB_SUFFIX="" \
    -DBUILD_AUDIO=ON \
    -DBUILD_OPENNI2_DRIVER=ON \
    -DBUILD_PYTHON=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DPython_ADDITIONAL_VERSIONS="2.7;2.6;2.5;2.4;2.3;2.2;2.1;2.0" .

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 platform/linux/udev/51-kinect.rules "${pkgdir}/etc/udev/rules.d/51-kinect.rules"
	
  # Patch include files
  sed 's/<libfreenect.h>/<libfreenect\/libfreenect.h>/g' -i "${pkgdir}/usr/include/libfreenect/libfreenect.hpp"
  sed 's/<libfreenect.h>/<libfreenect\/libfreenect.h>/g' -i "${pkgdir}/usr/include/libfreenect/libfreenect-audio.h"
  sed 's/<libfreenect.h>/<libfreenect\/libfreenect.h>/g' -i "${pkgdir}/usr/include/libfreenect/libfreenect-registration.h"
  sed 's/<libfreenect.h>/<libfreenect\/libfreenect.h>/g' -i "${pkgdir}/usr/include/libfreenect/libfreenect_sync.h"
}
