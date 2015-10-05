# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libfreenect-git
pkgver=v0.5.2.r8.gdcb2929
pkgrel=1
pkgdesc="Drivers and libraries for the Xbox Kinect device on Linux"
arch=('i686' 'x86_64')
url="http://openkinect.org"
license=('GPL')
depends=('libusb' 'glu' 'freeglut' 'bash' 'python2')
makedepends=('cmake' 'git' 'libxmu' 'python2-numpy')
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

prepare() {
  cd "${srcdir}/${pkgname}"

  sed '/set(PYTHON_EXECUTABLE "python2")/d' -i CMakeLists.txt
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DPROJECT_INCLUDE_INSTALL_DIR=/usr/include -DLIB_SUFFIX="" \
    -DBUILD_AUDIO=ON \
    -DBUILD_REDIST_PACKAGE=OFF \
    -DBUILD_OPENNI2_DRIVER=ON \
    -DBUILD_PYTHON=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DPython_ADDITIONAL_VERSIONS="2.7;2.6;2.5;2.4;2.3;2.2;2.1;2.0" .

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 platform/linux/udev/51-kinect.rules "${pkgdir}/etc/udev/rules.d/51-kinect.rules"
}
