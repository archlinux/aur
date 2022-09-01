# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: neodarz <neodarz@neodarz.net>

pkgname=libsavitar
pkgver=4.13.0
pkgrel=1
pkgdesc="C++ implementation of 3mf loading with SIP python bindings"
arch=('x86_64')
url="https://github.com/Ultimaker/libsavitar"
license=('AGPL')
depends=('python' 'pugixml')
makedepends=('cmake' 'python-sip4' 'sip4')
source=($pkgname-$pkgver.tar.gz::https://github.com/Ultimaker/libSavitar//archive/${pkgver}.tar.gz use_system_pugixml.patch)
sha512sums=('a446131c0bbcc34e55c093032af823b9750797f06297bea9fd4d64838e793811e71679a1f6ae99be9fc9382a23e8763140147c7a6eea0a310f6f2d40b53be3bf'
            'b312dcf43bf334001da98da93388da99731eacf417fe3a9dff51831bdd1f0ab5487377925bebce05e227533be2680b1a45f3203b0a7b9de9a77280a206ec7b26')

prepare() {
  cd "libSavitar-${pkgver}"
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages,DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages,g' CMakeLists.txt
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages/cura),DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/cura),g' CMakeLists.txt

  # don't install a second system pugixml; WONTFIX upstream due to:
  # "It's been decided that an external dependency makes setting up your
  # development environment for Cura needlessly difficult."
  patch -Np1 -i "$srcdir"/use_system_pugixml.patch
}

build() {
  cd "libSavitar-${pkgver}"
  mkdir  build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "libSavitar-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
