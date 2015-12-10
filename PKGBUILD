# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=hrpsys-base
pkgver=315.8.0
pkgrel=1
pkgdesc="Basic RT components and utilities to control robots using OpenRTM"
arch=('i686' 'x86_64')
url="https://github.com/fkanehiro/hrpsys-base"
license=('EPL')
depends=('openhrp3' 'openrtm-aist-python' 'libxml2' 'sdl' 'opencv' 'qhull' 'glew')
optdepends=()
makedepends=('cmake' 'doxygen')
source=("https://github.com/fkanehiro/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('96951b21fb7e4415229726fc8046f922b71708dd4585f2f60816a9fc9f883494')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix qhull includes
  msg "Applying qhull includes fix..."
  find . -type f -exec sed -i 's|include <qhull/|include <libqhull/|g' {} \;
  find . -type f -exec sed -i 's|include \"qhull/|include \"libqhull/|g' {} \;
  find . -type f -exec sed -i 's|include/qhull/qhull.h|include/libqhull/libqhull.h|g' {} \;

  find . -type f -exec sed -i 's|COMMAND python -c|COMMAND python2 -c|g' {} \;
  find . -type f -exec sed -i 's|dist-packages|site-packages|g' {} \;

  # Create build directory
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"

  # Run CMake
  cmake "${srcdir}/${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib"

  # Compile
  make
}

package() {
  cd "${srcdir}/build"

  # Install Gazebo
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
