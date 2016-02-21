# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libfreenect
pkgver=0.5.3
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
sha512sums=('bf5ac23b1ead3dec1d76868373b219a995d648b4da9b317655bc48fc641ec5d8ed5a02228a026c7c95d3c96cc5d5184152be3e5789959e23a332e38167cf7018')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed '/set(PYTHON_EXECUTABLE "python2")/d' -i CMakeLists.txt
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DPROJECT_INCLUDE_INSTALL_DIR=/usr/include -DLIB_SUFFIX="" \
    -DBUILD_REDIST_PACKAGE=OFF \
    -DBUILD_OPENNI2_DRIVER=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DBUILD_PYTHON=ON .

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 platform/linux/udev/51-kinect.rules "${pkgdir}/etc/udev/rules.d/51-kinect.rules"
}
