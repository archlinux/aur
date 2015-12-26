# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=libdart
pkgver=5.1.1
pkgrel=1
pkgdesc="Dynamic Animation and Robotics Toolkit"
arch=('i686' 'x86_64')
url="http://dartsim.github.io"
license=('BSD')
depends=('assimp' 'boost' 'eigen>=3' 'fcl' 'flann' 'glut' 'libccd' 'libgl')
optdepends=('bullet: Bullet support'
            'ipopt: Ipopt support'
            'nlopt: NLopt support')
makedepends=('cmake' 'doxygen')
_name=dart
source=(https://github.com/dartsim/${_name}/archive/v${pkgver}.tar.gz)
md5sums=('4a10222311a1d490cbc75cbb3197a60d')

# Build type
_buildtype="Release"

# Build the project
build() {
  cd "${srcdir}/${_name}-${pkgver}"

  msg "Starting CMake (build type = ${_buildtype})"

  # Create a build directory
  mkdir -p "${srcdir}/${_name}-${pkgver}-build"
  cd "${srcdir}/${_name}-${pkgver}-build"

  # Run CMake in release
  cmake -DCMAKE_BUILD_TYPE="${_buildtype}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        "${srcdir}/${_name}-${pkgver}"

  # Compile the library
  msg "Building the project"
  make
}

# Run unit tests
check() {
  msg "Running unit tests"
  cd "${srcdir}/${_name}-${pkgver}-build"
  make test
}

# Create the package
package() {
  # Install in /opt/roboptim
  cd "${srcdir}/${_name}-${pkgver}-build"

  msg "Installing files"
  make DESTDIR="${pkgdir}/" install
}
