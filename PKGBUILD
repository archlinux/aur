# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

_pkgname=psmoveapi
pkgname=${_pkgname}-git
pkgver=4.0.1.r14.g1eb4525
pkgrel=1
pkgdesc="Playstation Move Motion Controller API"
arch=(i686 x86_64)
url="http://thp.io/2010/psmove/"
license=('BSD')
depends=('udev' 'bluez-libs' 'v4l-utils' 'opencv' 'jdk7-openjdk'
         'python2' 'mono' 'swig' 'freeglut' 'libusb')
makedepends=('cmake')
source=("${_pkgname}::git+https://github.com/thp/psmoveapi.git"
        'fix-opencv-headers.patch'
        'add-libv4l2-module.patch')
sha1sums=('SKIP'
          '4544da4ae2f0220350b9d59f05d1e6c8b5e71b36'
          'f81b484bced325b076ea550b47f2bb145f709a45')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git submodule update

  # Add the missing OpenCV includes
  patch -p1 -i "${srcdir}/fix-opencv-headers.patch"

  # Add the missing cmake libv4l2 linkage
  patch -p1 -i "${srcdir}/add-libv4l2-module.patch"

  JAVA_HOME=/usr/lib/jvm/default cmake . \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DPSMOVEAPI_LIB_DEST=lib \
    -DPSMOVE_BUILD_EXAMPLES=OFF \
    -DPSMOVE_BUILD_OPENGL_EXAMPLES=OFF \
    -DPSMOVE_BUILD_TESTS=OFF
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

