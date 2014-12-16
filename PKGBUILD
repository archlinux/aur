# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=roboptim-core-plugin-ipopt-git
_name="roboptim-core-plugin-ipopt"
pkgver=v2.0.r77.gbca3914
pkgrel=1
pkgdesc="Ipopt interface for RobOptim Core"
arch=('i686' 'x86_64')
url="http://roboptim.net/"
license=('(L)GPL2')
depends=('roboptim-core-git' 'boost>=1.41' 'doxygen' 'eigen3' 'libltdl' 'ipopt')
makedepends=('git' 'cmake')
provides=('roboptim-core-plugin-ipopt')
conflicts=('roboptim-core-plugin-ipopt')

# Repository location
_gitroot="git+https://github.com/roboptim/${_name}.git"
source=("${_name}::${_gitroot}#branch=master")
md5sums=('SKIP')

# Build type
_buildtype="RelWithDebInfo"

# Build directory
_builddir="${_name}-build"

pkgver() {
  cd "${srcdir}/${_name}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

# Build the project
build() {
  # Update submodules
  msg "Updating submodules"
  cd ${srcdir}/${_name}
  git submodule init && git submodule update

  # Create a build directory
  mkdir -p ${srcdir}/${_builddir}
  cd ${srcdir}/${_builddir}

  msg "Starting CMake (build type = ${_buildtype})"

  # Run CMake in release
  cmake -DCMAKE_BUILD_TYPE="${_buildtype}" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DDISABLE_TESTS=ON \
    "${srcdir}/${_name}"

  # Compile the library
  msg "Building the project"
  make --silent

  # Create the documentation
  msg "Creating the documentation"
  make --silent doc
}

# Run unit tests
check() {
  msg "Running unit tests"
  cd "${srcdir}/${_builddir}"

  make test
}

# Create the package
package() {
  cd "${srcdir}/${_builddir}"

  msg "Installing files"
  make --silent DESTDIR="${pkgdir}/" install
}
