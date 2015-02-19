# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=roboptim-core-python-git
pkgver=20150218
pkgrel=1
pkgdesc="Python bindings for RobOptim"
arch=('i686' 'x86_64')
url="http://roboptim.net/"
license=('(L)GPL2')
depends=('boost>=1.41' 'eigen3' 'python2' 'python2-numpy' 'roboptim-core-git')
optdepends=('python2-matplotlib: visualization')
makedepends=('git' 'cmake>=2.8' 'doxygen')
provides=('roboptim-core-python')
conflicts=('roboptim-core-python')

# Repository location
_gitroot="git+https://github.com/roboptim/roboptim-core-python.git"
_gitname="roboptim-core-python"

source=("${_gitname}"::${_gitroot})
md5sums=('SKIP')

# Build type
_buildtype="RelWithDebInfo"

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
          -DPYTHON_EXECUTABLE=/usr/bin/python2 \
          -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
          -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
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
    export PYTHONPATH=$(pwd)/src
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
