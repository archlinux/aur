# Maintainer: Benjamin Chretien <chretien@lirmm.fr>
# Contributor: Thomas Moulard <thomas.moulard@gmail.com>
pkgname=roboptim-core-plugin-ipopt-git
pkgver=20130314
pkgrel=1
pkgdesc="Ipopt interface for RobOptim Core"
arch=('i686' 'x86_64')
url="http://roboptim.net/"
license=('(L)GPL2')
depends=('roboptim-core-git' 'boost>=1.41' 'doxygen' 'libltdl' 'ipopt')
makedepends=('git' 'cmake')
provides=('roboptim-core-plugin-ipopt')
conflicts=('roboptim-core-plugin-ipopt')

# Repository location
_gitroot="git://github.com/roboptim/roboptim-core-plugin-ipopt.git"
_gitname="roboptim-core-plugin-ipopt"

# Build type
_buildtype="RELWITHDEBINFO"

# Build directory
_builddir="${srcdir}/${_gitname}-${pkgver}-build"

# Doxytag file to correct
_doxytag="usr/share/doc/roboptim-core-plugin-ipopt/doxygen-html/roboptim-core-plugin-ipopt.doxytag"

# Build the project
build() {
    msg "Connecting to Git server"

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

    msg "Starting CMake (build type = ${_buildtype})"

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
          "${srcdir}/${_gitname}"

    # Compile the library
    msg "Building the project"
    make --silent || return 1

    # Create the documentation
    msg "Creating the documentation"
    make --silent doc || return 1
}

# Run unit tests
check() {
    msg "Running unit tests"
    cd "${srcdir}/${_gitname}-${pkgver}-build"

    # Need to update LD_LIBRARY_PATH else tests fail
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${_builddir}/src"
    make test || return 1
}

# Create the package
package() {
    # Install in /opt/roboptim
    cd "${srcdir}/${_gitname}-${pkgver}-build"

    msg "Installing files"
    make --silent DESTDIR="${pkgdir}/" install || return 1

    # Remove ${src_dir} from the doxytag
    msg "Correcting doxytag file"
    sed -i "s:${srcdir}::g" ${pkgdir}/${_doxytag}
}
