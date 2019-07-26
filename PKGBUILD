# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=libiges-git
pkgver=r225.efb93fd
pkgrel=2
pkgdesc="Implementation of the IGESv5.3 specification"
arch=('i686' 'x86_64')
url="http://cbernardo.github.io/libIGES"
license=('LGPL-2.1')
depends=('gcc')
optdepends=('sisl')
makedepends=('git' 'cmake')
_name=libIGES
provides=('libiges')
conflicts=('libiges')
source=("git+https://github.com/cbernardo/libIGES.git")
md5sums=('SKIP')

pkgver() {
  cd "$_name"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

_buildtype="Release"

_cmake_options=()

check_optdepends() {
    # Check if sisl is installed
    if (pacman -Qqs sisl >/dev/null) ; then
        msg "Enabling sisl support"
        _cmake_options=(${_cmake_options[@]} -DUSE_SISL=ON)
    else
        msg "Disabling sisl support"
    fi
}

build() {

    # Check optional dependencies
    check_optdepends

    # Create a build directory
    mkdir -p "${srcdir}/${_name}/build"
    cd "${srcdir}/${_name}/build"

    msg "Starting CMake (build type: ${_buildtype})"

    cmake .. \
        -DCMAKE_BUILD_TYPE="${buildtype}" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        ${_cmake_options[@]}

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${_name}/build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
