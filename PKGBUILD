# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=libfreenect
pkgver=0.6.4
pkgrel=1
pkgdesc="Drivers and libraries for the Xbox Kinect device on Linux"
arch=('i686' 'x86_64')
url="https://github.com/OpenKinect/libfreenect"
license=('GPL2')
depends=('libusb' 'glu' 'freeglut' 'python')
makedepends=('cmake' 'libxmu' 'cython' 'python-numpy')
optdepends=('opencv: support for python demos'
            'python-matplotlib: support for python demos')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/OpenKinect/libfreenect/archive/v${pkgver}.tar.gz)
sha256sums=('6169600f999729a7f99dd71a9825ed6e7aec8b8aac4f532ecf2911f76133c125')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX='/usr' \
    -DPROJECT_INCLUDE_INSTALL_DIR='/usr/include' \
    -DBUILD_REDIST_PACKAGE=OFF \
    -DBUILD_OPENNI2_DRIVER=ON \
    -DBUILD_PYTHON3=ON \
    -DOpenGL_GL_PREFERENCE=GLVND .

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 platform/linux/udev/51-kinect.rules "${pkgdir}/etc/udev/rules.d/51-kinect.rules"
}
