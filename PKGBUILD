# Maintainer: Benjamin Chretien <chretien@lirmm.fr>
# Contributor: Thomas Moulard <thomas.moulard@gmail.com>

pkgname=roboptim-trajectory-git
pkgver=20130322
pkgrel=1
pkgdesc="Trajectory optimization for robotics"
arch=('i686' 'x86_64')
url="http://roboptim.net/"
license=('(L)GPL2')
depends=('roboptim-core-git' 'roboptim-core-plugin-ipopt-git' 'boost>=1.41'
         'doxygen' 'pkg-config' 'libltdl')
makedepends=('git' 'cmake')
provides=('roboptim-trajectory')
conflicts=('roboptim-trajectory')
optdepends=()

# Repository location
_gitroot="git://github.com/roboptim/roboptim-trajectory.git"
_gitname="roboptim-trajectory"

# Build type
_buildtype="RELWITHDEBINFO"

# Build directory
_builddir="${srcdir}/${_gitname}-${pkgver}-build"

# Build the project
build() {
    msg "Connecting to Git server..."

    if [ -d ${srcdir}/${_gitname} ] ; then
        # Update local files (including submodules)
        cd ${srcdir}/${_gitname} && git pull origin && git submodule update || return 1
        msg "The local files are updated."
    else
        # Clone repository and submodules
        git clone --recursive ${_gitroot} ${srcdir}/${_gitname} || return 1
    fi

    msg "Git checkout done or server timeout"

    cd "${srcdir}/${_gitname}" || return 1

    msg "Starting CMake (build type = ${_buildtype})..."

    # Create a build directory
    if [ -d ${_builddir} ]
    then
        cd ${_builddir}
    else
        mkdir ${_builddir}
        cd ${_builddir}
    fi

    # Run CMake in release
    cmake -DCMAKE_BUILD_TYPE="${_buildtype}" \
          -DCMAKE_INSTALL_PREFIX="/usr" \
          -DIPOPT_SOLVER=1 \
          "${srcdir}/${_gitname}"

    # Compile the library
    msg "Building the project..."
    make --silent || return 1

    # Create the documentation
    msg "Creating the documentation..."
    make --silent doc || return 1
}

# Run unit tests
check() {
    msg "Running unit tests..."
    cd "${srcdir}/${_gitname}-${pkgver}-build"

    # Need to update LD_LIBRARY_PATH else tests fail
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${_builddir}/src"
    make test || return 1
}

# Create the package
package() {
    # Install in /opt/roboptim
    cd "${srcdir}/${_gitname}-${pkgver}-build"

    msg "Installing files..."
    make --silent DESTDIR="${pkgdir}/" install || return 1
}
