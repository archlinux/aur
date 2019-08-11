# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Joey Dumont <joey.dumont@gmail.com>
pkgname=pagmo
pkgver=2.11.1
pkgrel=1
pkgdesc="Perform parallel computations of optimisation tasks (global and local) via the asynchronous generalized island model"
arch=('i686' 'x86_64')
url="https://github.com/esa/pagmo2"
license=('GPLv3')
depends=('boost')
optdepends=('coin-or-ipopt: Ipopt optimizer support'
            'eigen: library for matrix math'
            'nlopt: NLopt optimizer support')
makedepends=('cmake')
_name=pagmo2
source=(https://github.com/esa/${_name}/archive/v${pkgver}.tar.gz)
sha512sums=('7ab1b446efb996422d3c4ab83b359cf8eacef4bb25f3ead2f31afdb6cad6d0c9ead79490f5764f297c44449e960131510733b44f2709fc939e9227021329f3e1')

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

    cd "${srcdir}/${_name}-${pkgver}"

    msg "Starting CMake (build type: ${_buildtype})"

    # Create a build directory
    mkdir -p "${srcdir}/${_name}-${pkgver}-build"
    cd "${srcdir}/${_name}-${pkgver}-build"

    cmake \
        -DCMAKE_BUILD_TYPE="${buildtype}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        ${_cmake_options[@]} \
        "${srcdir}/${_name}-${pkgver}"

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${_name}-${pkgver}-build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
