# Previous Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=pagmo-git
pkgver=r3632.f580121d
pkgrel=2
pkgdesc="Perform parallel computations of optimisation tasks (global and local)
via the asynchronous generalized island model (git version)"
arch=('i686' 'x86_64')
url="https://github.com/esa/pagmo2"
license=('GPLv3')
depends=('boost')
optdepends=('coin-or-ipopt: Ipopt optimizer support'
            'eigen: library for matrix math'
            'nlopt: NLopt optimizer support')
makedepends=('git' 'cmake')
_name=pagmo2
provides=('pagmo')
conflicts=('pagmo')
source=("git+https://github.com/esa/pagmo2.git")
md5sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_buildtype="Release"

_cmake_options=()

check_optdepends() {

    # Check if coin-or-ipopt is installed
    if (pacman -Qqs coin-or-ipopt >/dev/null) ; then
        msg "Enabling ipopt support"
        _cmake_options=(${_cmake_options[@]} -DPAGMO_WITH_IPOPT=ON)
    else
        msg "Disabling ipopt support"
    fi

    # Check if eigen is installed
    if (pacman -Qqs eigen3 >/dev/null) ; then
        msg "Enabling eigen support"
        _cmake_options=(${_cmake_options[@]} -DPAGMO_WITH_EIGEN3=ON)
    else
        msg "Disabling eigen support"
    fi

    # Check if nlopt is installed
    if (pacman -Qqs nlopt >/dev/null) ; then
        msg "Enabling nlopt support"
        _cmake_options=(${_cmake_options[@]} -DPAGMO_WITH_NLOPT=ON)
    else
        msg "Disabling nlopt support"
    fi

}

build() {

    # Check optional dependencies
    check_optdepends

    cd "${srcdir}/${_name}"

    msg "Starting CMake (build type: ${_buildtype})"

    # Create a build directory
    mkdir -p "${srcdir}/${_name}-build"
    cd "${srcdir}/${_name}-build"

    cmake \
        -DCMAKE_BUILD_TYPE="${buildtype}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        ${_cmake_options[@]} \
        "${srcdir}/${_name}"

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${_name}-build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
