# Maintainer: RogueGirl

pkgname=libfreenect-sirlynix-git
pkgver=0.6.2.r9.g5058631
_gitname=libfreenect-git
pkgrel=1
pkgdesc="Drivers and libraries for the Xbox Kinect device on Linux (patched to work with obs-kinect)"
arch=('i686' 'x86_64')
url="https://github.com/SirLynix/libfreenect"
license=('GPL')
depends=(
  'glibc' 'gcc-libs' 'bash' 'libusb' 'libgl' 'glu'
  'freeglut' 'python'
)
makedepends=('cmake' 'libxmu' 'cython0' 'python-numpy')
optdepends=('opencv: support for python demos'
            'python-matplotlib: support for python demos')
provides=('libfreenect')
conflicts=('libfreenect')
source=('libfreenect-git::git+https://github.com/SirLynix/libfreenect.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-47
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DPROJECT_INCLUDE_INSTALL_DIR=/usr/include \
    -DBUILD_REDIST_PACKAGE=OFF \
    -DBUILD_OPENNI2_DRIVER=ON \
    -DBUILD_PYTHON3=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -Wno-dev
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 platform/linux/udev/51-kinect.rules "${pkgdir}/etc/udev/rules.d/51-kinect.rules"
}
