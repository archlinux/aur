# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=pagmo
pkgver=1.1.7
pkgrel=1
pkgdesc="Perform parallel computations of optimisation tasks (global and local) via the asynchronous generalized island model."
arch=('i686' 'x86_64')
url="https://github.com/esa/pagmo"
license=('GPLv3')
depends=('boost')
optdepends=('gsl: Mathematical operations (symbolic)'
	    'blas: GSL CBLAS functions'
	    'ipopt: Nonlinear optimization algorithms'
	    'nlopt: Nonlinear optimization algorithms'
	    'python: PyGMO support'
	    'openmpi: MPI Support')
makedepends=('cmake')
source=(https://github.com/esa/pagmo/archive/${pkgver}.tar.gz)
sha512sums=('502705b9b87bf2607472347bb6d04571b132f1df9864a18448586f03befc86511ca445c78aad7f20a24630bc5671f3c22c3d61a40f7257791759fb996c0fe551')

# Build type
_buildtype="RelWithDebInfo"

# Build directory
_builddir="${pkgname}-build"

_cmake_options=(
  -D BUILD_MAIN=OFF
  -D BUILD_EXAMPLES=OFF
  -D ENABLE_TESTS=OFF
  -D INSTALL_HEADERS=ON
)

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

    # Check if OpenMPI is installed.
    if (pacman -Qqs openmpi >/dev/null); then
       msg "Enabling OpenMPI support"
       _cmake_options=(${_cmake_options[@]} -D ENABLE_MPI=ON)
    else
	msg "Disabling OpenMPI support"
    fi

    # Check if Python 3 is installed
    if (pacman -Qqs python >/dev/null) ; then
        msg "Enabling PyGMO build"
        _cmake_options=(${_cmake_options[@]} -D BUILD_PYGMO=ON 
	                                     -D PYGMO_PYTHON_VERSION=3
					     -D PYTHON_INCLUDE_DIR=`python-config --includes | sed 's/\s.*$//' | sed 's/-I//'` 
					     -D PYTHON_EXECUTABLE=/usr/bin/python)
    else
        msg "Disabling PyGMO build"
    fi
}

# Build the project
build() {
    # Check optional dependencies
    check_optdepends

    msg "Starting CMake (build type = ${_buildtype})"

    # Create a build directory
    cd "${srcdir}"
    mkdir -p "${_builddir}"
    cd "${_builddir}"

    # Run CMake in release
    cmake -DCMAKE_BUILD_TYPE="${_buildtype}" \
	  -DCMAKE_INSTALL_PREFIX="/usr" \
          ${_cmake_options[@]} \
	  ${srcdir}/${pkgname}-${pkgver}

    # Compile the library
    msg "Building the project"
    make
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
