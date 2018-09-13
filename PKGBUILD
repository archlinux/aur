# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Previous maintainer: neodarz <neodarz@neodarz.net>

pkgname=libsavitar-git
_pkgname=libSavitar
pkgver=3.4.1.r0.g62dd545
pkgrel=1
pkgdesc="c++ implementation of 3mf loading with SIP python bindings"
arch=('i686' 'x86_64')
url="https://github.com/Ultimaker/$_pkgname"
license=('LGPL')
depends=('python' 'pugixml')
makedepends=('cmake' 'python-sip' 'sip' 'git')
provides=('libsavitar')
conflicts=('libsavitar')
source=("git+https://github.com/Ultimaker/$_pkgname.git"
        "https://github.com/Ultimaker/libSavitar/pull/8/commits/91aa70c6320461ae65600dce954b5ffb905b7039.patch")
md5sums=('SKIP'
         '8cb2ef4a8ff551114ac8520c6be42ec6')

pkgver() {
  cd "${_pkgname}"
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages,DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages,g' CMakeLists.txt
  sed -i 's,DESTINATION lib/python${PYTHON_VERSION_MAJOR}/dist-packages/cura),DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/cura),g' CMakeLists.txt

  # don't install a second system pugixml; WONTFIX upstream due to:
  # "It's been decided that an external dependency makes setting up your
  # development environment for Cura needlessly difficult."
  patch -Np1 -i "$srcdir"/91aa70c6320461ae65600dce954b5ffb905b7039.patch
}

build() {
  cd "${_pkgname}"
  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
