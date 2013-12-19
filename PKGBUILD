# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=roboptim-core-python-git
pkgver=20131219
pkgrel=1
pkgdesc="Python bindings for RobOptim"
arch=('i686' 'x86_64')
url="http://roboptim.net/"
license=('(L)GPL2')
depends=('boost>=1.41' 'eigen3' 'libltdl' 'log4cxx>=0.10' 'python2' 'roboptim-core-git')
optdepends=()
makedepends=('git' 'cmake>=2.8' 'doxygen')
provides=('roboptim-core-python')
conflicts=('roboptim-core-python')

# Repository location
_gitroot="git://github.com/roboptim/roboptim-core-python.git"
_gitname="roboptim-core-python"

source=("${_gitname}"::${_gitroot})
md5sums=('SKIP')

# Build type
_buildtype="RELWITHDEBINFO"

# Build directory
_builddir="${_gitname}-build"

_doxytag="usr/share/doc/roboptim-core-python/doxygen-html/roboptim-core-python.doxytag"

pkgver() {
    date +%Y%m%d
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

    # Remove ${src_dir} from the doxytag
    msg "Correcting doxytag file"
    sed -i "s:${srcdir}::g" ${pkgdir}/${_doxytag}
}
