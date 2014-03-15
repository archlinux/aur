# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=roboptim-core-git
pkgver=2.0.r266.g3dae58c
pkgrel=1
pkgdesc="Numerical Optimization for Robotics"
arch=('i686' 'x86_64')
url="http://roboptim.net/"
license=('(L)GPL2')
depends=('eigen3' 'boost>=1.41' 'libltdl' 'log4cxx>=0.10')
optdepends=()
makedepends=('git' 'cmake' 'doxygen')
provides=('roboptim-core')
conflicts=('roboptim-core')

# Repository location
_gitroot="git://github.com/roboptim/roboptim-core.git"
_gitname="roboptim-core"

source=("${_gitname}"::${_gitroot})
md5sums=('SKIP')

# Build type
_buildtype="RELWITHDEBINFO"

# Build directory
_builddir="${_gitname}-build"

pkgver() {
    cd "$srcdir/${_gitname}"
    # Use the tag of the last commit
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v([0-9])/\1/'
}

# Build the project
build() {
    msg "Updating Git submodules"

    cd "${srcdir}/${_gitname}"
    git submodule init
    git submodule update

    msg "Starting CMake (build type = ${_buildtype})"

    # Create a build directory
    cd "${srcdir}"
    mkdir -p ${_builddir}
    cd "${_builddir}"

    # Run CMake in release
    cmake -DCMAKE_BUILD_TYPE="${_buildtype}" \
          -DCMAKE_INSTALL_PREFIX="/usr" \
          "${srcdir}/${_gitname}"

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
