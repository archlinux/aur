# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Previous maintainer: neodarz <neodarz@neodarz.net>

pkgname=libsavitar-git
_pkgname=libSavitar
pkgver=4.9.beta.r0.gfe88675
pkgrel=2
pkgdesc="c++ implementation of 3mf loading with SIP python bindings"
arch=('i686' 'x86_64')
url="https://github.com/Ultimaker/$_pkgname"
license=('LGPL')
depends=('python' 'pugixml')
makedepends=('cmake' 'python-sip4' 'sip4' 'git')
provides=('libsavitar')
conflicts=('libsavitar')
source=("git+https://github.com/Ultimaker/$_pkgname.git"
        "0001-Do-not-vendor-the-pugixml-library.patch")
md5sums=('SKIP'
         '6a59f74447a366e9b71d294b916e5cc6')

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
  patch -Np1 -i "$srcdir"/0001-Do-not-vendor-the-pugixml-library.patch
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
