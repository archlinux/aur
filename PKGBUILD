# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libfreenect-git
pkgver=v0.5.6.r0.g4d2fede
pkgrel=1
pkgdesc="Drivers and libraries for the Xbox Kinect device on Linux"
arch=('i686' 'x86_64')
url="http://openkinect.org"
license=('GPL')
depends=('libusb' 'glu' 'freeglut' 'bash' 'python' 'python2')
makedepends=('git' 'cmake' 'libxmu' 'cython' 'python-numpy' 'cython2' 'python2-numpy')
optdepends=('opencv: support for python demos'
            'python2-matplotlib: support for python demos')
provides=('libfreenect')
conflicts=('libfreenect')
source=('libfreenect-git::git+https://github.com/OpenKinect/libfreenect.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DPROJECT_INCLUDE_INSTALL_DIR=/usr/include \
    -DBUILD_REDIST_PACKAGE=OFF \
    -DBUILD_OPENNI2_DRIVER=ON \
    -DBUILD_PYTHON=ON

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 platform/linux/udev/51-kinect.rules "${pkgdir}/etc/udev/rules.d/51-kinect.rules"
}
