# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=libmocap-git
pkgver=r76.99f89be
pkgrel=1
pkgdesc="A simple library to load motion capture data"
arch=('i686' 'x86_64')
url="https://github.com/jrl-umi3218/libmocap"
license=('Modified BSD')
depends=()
optdepends=()
makedepends=('git' 'cmake' 'doxygen')
provides=('libmocap')
conflicts=('libmocap')

# Repository location
_gitroot="git+https://github.com/jrl-umi3218/libmocap.git#branch=master"
_gitname="libmocap"

source=("${_gitname}"::${_gitroot})
md5sums=('SKIP')

# Build type
_buildtype="RelWithDebInfo"

# Build directory
_builddir="${_gitname}-build"

pkgver() {
    cd "$srcdir/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
          -DENABLE_ROS_VIEWER=OFF \
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
