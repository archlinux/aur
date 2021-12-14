# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=libfreenect
pkgver=0.6.2
pkgrel=2
pkgdesc="Drivers and libraries for the Xbox Kinect device on Linux"
arch=('i686' 'x86_64')
url="https://github.com/OpenKinect/libfreenect"
license=('GPL2')
depends=('libusb' 'glu' 'freeglut' 'python')
makedepends=('cmake' 'libxmu' 'cython' 'python-numpy')
optdepends=('opencv: support for python demos'
            'python-matplotlib: support for python demos')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/OpenKinect/libfreenect/archive/v${pkgver}.tar.gz)
sha512sums=('e232487fe62a81161e6e74d34a625d6e86ca56befc1692590ecf863ce6b96b9094b3042557e8a4801a7a1fb3eade4cb02d647cc57dd6b043e7b891d48ff1cba1')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/${GLUT_LIBRARY}/${GLUT_LIBRARIES}/g' examples/CMakeLists.txt wrappers/cpp/CMakeLists.txt
}

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
