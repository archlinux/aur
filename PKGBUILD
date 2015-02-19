# Maintainer: Benjamin Chretien <chretien@lirmm.fr>
# Contributor: Thomas Moulard <thomas.moulard@gmail.com>
pkgname=roboptim-core
pkgver=2.0
pkgrel=2
pkgdesc="Numerical Optimization for Robotics"
arch=('i686' 'x86_64')
url="http://roboptim.net/"
license=('(L)GPL2')
depends=('eigen>=3.2' 'boost>=1.41' 'doxygen' 'libltdl' 'log4cxx')
optdepends=()
makedepends=('cmake')
provides=('roboptim-core')
conflicts=('roboptim-core-git')
source=("https://github.com/roboptim/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('84bfe74fe4bf7826bbf98fc64a225025')

# Build type
_buildtype="RelWithDebInfo"

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
    # Note: some tests fail with more recent versions of Eigen
    # (print output style)
    make test || return 0
}

# Create the package
package() {
    # Install in /opt/roboptim
    cd "${srcdir}/${pkgname}-${pkgver}-build"

    msg "Installing files"
    make --silent DESTDIR="${pkgdir}/" install
}
