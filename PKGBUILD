# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=libfreenect
pkgver=0.7.5
pkgrel=1
pkgdesc="Drivers and libraries for the Xbox Kinect device on Linux"
arch=('x86_64')
url="https://github.com/OpenKinect/libfreenect"
license=(GPL-2.0-or-later)
depends=(
  'glibc' 'gcc-libs' 'bash' 'libusb' 'libgl' 'glu'
  'freeglut' 'python'
)
makedepends=('cmake' 'libxmu' 'cython' 'python-numpy' 'python-setuptools')
optdepends=('opencv: support for python demos'
            'python-matplotlib: support for python demos')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/OpenKinect/libfreenect/archive/v${pkgver}.tar.gz)
sha256sums=('3c668053db726206a8c3a92e92e91ef7a64407968f422b9c4b828d0fd234c866')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DPROJECT_INCLUDE_INSTALL_DIR='/usr/include' \
    -DBUILD_REDIST_PACKAGE=OFF \
    -DBUILD_OPENNI2_DRIVER=ON \
    -DBUILD_PYTHON3=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "${pkgname}-${pkgver}/platform/linux/udev/51-kinect.rules" "${pkgdir}/etc/udev/rules.d/51-kinect.rules"
}
