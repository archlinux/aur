# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=openhrp3
pkgver=3.1.8
pkgrel=5
pkgdesc="Open Architecture Human-centered Robotics Platform"
arch=('i686' 'x86_64')
url="https://github.com/fkanehiro/openhrp3"
license=('EPL')
# FIXME: probably tons of dependencies missing
depends=('omniorb' 'lapack' 'f2c' 'boost' 'eigen3'
         'collada-dom' 'openrtm-aist' 'uuid' 'python2')
optdepends=()
makedepends=('cmake' 'doxygen' 'graphviz' 'python2-yaml')
source=("https://github.com/fkanehiro/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('100dd486e8a3504c242835fc44f2e6830c78360623b98f981b9d2667949ffccf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fixes
  find . -type f -exec sed -i 's|COMMAND python -c|COMMAND python2 -c|g' {} \;
  find . -type f -exec sed -i 's|dist-packages|site-packages|g' {} \;

  # Create build directory
  mkdir -p build && cd build

  # Run CMake
  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib"

  # Compile
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  # Install Gazebo
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
