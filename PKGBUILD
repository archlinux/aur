# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>

pkgname=roboptim-trajectory-git
pkgver=3.1.r67.gee9ed09
pkgrel=1
pkgdesc="Trajectory optimization for robotics"
arch=('i686' 'x86_64')
url="http://roboptim.net/"
license=('(L)GPL2')
depends=('roboptim-core-git' 'roboptim-core-plugin-ipopt-git' 'boost>=1.41'
         'eigen3' 'pkg-config' 'libltdl')
makedepends=('git' 'cmake' 'doxygen')
optdepends=()
provides=('roboptim-trajectory')
conflicts=('roboptim-trajectory')

_name="roboptim-trajectory"
source=("${_name}"::"git+https://github.com/roboptim/${_name}.git")
md5sums=('SKIP')

# Build type
_buildtype="RelWithDebInfo"

pkgver() {
  cd "${srcdir}/${_name}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null \
      | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v([0-9])/\1/' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

# Build the project
build() {
  cd "${srcdir}/${_name}"

  # Download submodules
  git submodule init && git submodule update

  msg "Starting CMake (build type = ${_buildtype})..."

  # Create a build directory
  mkdir -p build && cd build

  # Run CMake in release
  cmake -DCMAKE_BUILD_TYPE="${_buildtype}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="lib" \
        "${srcdir}/${_name}"

  # Compile the library
  msg "Building the project..."
  make --silent

  # Create the documentation
  msg "Creating the documentation..."
  make --silent doc
}

# Run unit tests
check() {
  msg "Running unit tests..."
  cd "${srcdir}/${_name}/build"

  make test || return 0
}

# Create the package
package() {
  cd "${srcdir}/${_name}/build"

  msg "Installing files..."
  make --silent DESTDIR="${pkgdir}/" install
}
