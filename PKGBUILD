# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libfreenect
pkgver=0.5.2
pkgrel=1
pkgdesc="Drivers and libraries for the Xbox Kinect device on Linux"
arch=('i686' 'x86_64')
url="http://openkinect.org"
license=('GPL')
depends=('libusb' 'glu' 'freeglut' 'bash' 'python' 'cython')
makedepends=('cmake' 'libxmu' 'python-numpy' 'python2')
optdepends=('opencv: support for python demos'
            'python-matplotlib: support for python demos')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/OpenKinect/libfreenect/archive/v${pkgver}.tar.gz)
md5sums=('4d683cffe79f741aeb777cacaa88fd44')
sha256sums=('91af5c09b7eae217c4be69234ae5a6371f24da8ff6986f98c2db19f1993f2a71')
sha384sums=('e0723886adea009e290318ae59a9a7ea1ff82d2b369ed0646a58d59a6ce1bfa30b5eb7c66e0909ee48a6165ba74cfc79')
sha512sums=('26224a8d4cb0c57ce058754d691631fa14fe4547b3a6b9afbcc9b0fd29577e7b767e65abcfff9bad72e32d1bb9723dd9fc3d41f076a0e0b1cf87b5855faf4b41')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed 's/systemupdate\/FFFE07DF00000001/Systemupdate\/FFFE07DF00000001/g' -i src/fwfetcher.py

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DPROJECT_INCLUDE_INSTALL_DIR=/usr/include -DLIB_SUFFIX="" \
    -DBUILD_REDIST_PACKAGE=OFF \
    -DBUILD_OPENNI2_DRIVER=ON \
    -DBUILD_PYTHON=ON .

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 platform/linux/udev/51-kinect.rules "${pkgdir}/etc/udev/rules.d/51-kinect.rules"
}
