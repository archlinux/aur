# Maintainer: Benjamin Chretien <chretien@lirmm.fr>
# Contributor: Thomas Moulard <thomas.moulard@gmail.com>
pkgname=roboptim-core
pkgver=2.0
pkgrel=1
pkgdesc="Numerical Optimization for Robotics"
arch=('i686' 'x86_64')
url="http://roboptim.net/"
license=('(L)GPL2')
depends=('eigen3>=3' 'boost>=1.41' 'doxygen' 'libltdl' 'log4cxx')
optdepends=()
makedepends=('cmake')
provides=('roboptim-core')
conflicts=('roboptim-core-git')
source=(https://github.com/roboptim/releases/blob/master/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('1d077052fb801a95209407e0661f9a6d')

# Build type
_buildtype="RELWITHDEBINFO"

# Build the project
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    msg "Starting CMake (build type = ${_buildtype})"

    # Create a build directory
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build"
    cd "${srcdir}/${pkgname}-${pkgver}-build"

    # Run CMake in release
    cmake -DCMAKE_BUILD_TYPE="${_buildtype}" \
          -DCMAKE_INSTALL_PREFIX="/usr" \
          "${srcdir}/${pkgname}-${pkgver}"

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
    cd "${srcdir}/${pkgname}-${pkgver}-build"
    make test
}

# Create the package
package() {
    # Install in /opt/roboptim
    cd "${srcdir}/${pkgname}-${pkgver}-build"

    msg "Installing files"
    make --silent DESTDIR="${pkgdir}/" install
}
