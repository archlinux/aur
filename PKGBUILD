# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=roboptim-core-plugin-nlopt-git
pkgver=0.1.r0.g0956b6e
pkgrel=1
pkgdesc="NLopt interface for RobOptim Core."
arch=('i686' 'x86_64')
url="http://roboptim.net/"
license=('(L)GPL2')
depends=('eigen3' 'boost>=1.41' 'libltdl' 'log4cxx>=0.10' 'roboptim-core-git' 'nlopt')
optdepends=()
makedepends=('git' 'cmake' 'doxygen')

# Repository location
_gitroot="git://github.com/roboptim/roboptim-core-plugin-nlopt"
_gitname="roboptim-core-plugin-nlopt"

source=("${_gitname}"::${_gitroot})
md5sums=('SKIP')

# Build type
_buildtype="RelWithDebInfo"

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
