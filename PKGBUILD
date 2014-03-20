# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=pagmo-git
pkgver=20140320
pkgrel=2
pkgdesc="Perform parallel computations of optimisation tasks (global and local) via the asynchronous generalized island model."
arch=('i686' 'x86_64')
url="https://github.com/esa/pagmo"
license=('GPLv3')
depends=('boost')
optdepends=('blas' 'gsl' 'ipopt' 'nlopt' 'python')
makedepends=('git' 'cmake' 'doxygen')
provides=('pagmo')
conflicts=('pagmo')

# Repository location
_gitroot="git://github.com/esa/pagmo"
_gitname="pagmo"

source=("${_gitname}"::${_gitroot}#branch=development)
md5sums=('SKIP')

# Build type
_buildtype="RelWithDebInfo"

# Build directory
_builddir="${_gitname}-build"

_cmake_options=(
  -D BUILD_MAIN=OFF
  -D BUILD_EXAMPLES=OFF
  -D ENABLE_TESTS=OFF
  -D INSTALL_HEADERS=ON
  -D PYGMO_PYTHON_VERSION=3
)

pkgver() {
    cd "$srcdir/${_gitname}"
    date +%Y%m%d
}

check_optdepends() {
    # Check if gsl is installed
    if (pacman -Qqs gsl >/dev/null) ; then
        msg "Enabling GSL support"
        _cmake_options=(${_cmake_options[@]} -D ENABLE_GSL=ON)
    else
        msg "Disabling GSL support"
    fi

    # Check if ipopt is installed
    if (pacman -Qqs ipopt >/dev/null) ; then
        msg "Enabling Ipopt support"
        _cmake_options=(${_cmake_options[@]} -D ENABLE_IPOPT=ON)
    else
        msg "Disabling Ipopt support"
    fi

    # Check if NLopt is installed
    if (pacman -Qqs nlopt >/dev/null) ; then
        msg "Enabling NLopt support"
        _cmake_options=(${_cmake_options[@]} -D ENABLE_NLOPT=ON)
    else
        msg "Disabling NLopt support"
    fi

    # Check if Python 3 is installed
    if (pacman -Qqs python3 >/dev/null) ; then
        msg "Enabling PyGMO build"
        _cmake_options=(${_cmake_options[@]} -D BUILD_PYGMO=ON)
    else
        msg "Disabling PyGMO build"
    fi
}

# Build the project
build() {
    # Check optional dependencies
    check_optdepends

    msg "Updating Git submodules"

    cd "${srcdir}/${_gitname}"

    msg "Starting CMake (build type = ${_buildtype})"

    # Create a build directory
    cd "${srcdir}"
    mkdir -p ${_builddir}
    cd "${_builddir}"

    # Run CMake in release
    cmake -DCMAKE_BUILD_TYPE="${_buildtype}" \
          -DCMAKE_INSTALL_PREFIX="/usr" \
          ${_cmake_options[@]} \
          "${srcdir}/${_gitname}"

    # Compile the library
    msg "Building the project"
    make --silent
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
