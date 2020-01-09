# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=python-jsbsim-git
pkgver=r5209.b9a9ee9a
pkgrel=1
pkgdesc="An open source flight dynamics & control software library (Python)"
arch=('x86_64')
url="http://www.jsbsim.org"
license=('LGPL-2.1')
depends=(expat)
makedepends=(cmake gcc cython git)
_name=jsbsim
conflicts=(python-jsbsim jsbsim)
provides=(python-jsbsim)
source=("git+https://github.com/JSBSim-Team/${_name}")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

    cd "${srcdir}/${_name}"

    msg "Starting CMake (build type: ${_buildtype})"

    # Create a build directory
    mkdir -p "${srcdir}/${_name}/build"
    cd "${srcdir}/${_name}/build"

    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DSYSTEM_EXPAT=ON \
        -DBUILD_SHARED_LIBS=ON \
        -DINSTALL_PYTHON_MODULE=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        ..

    msg "Building the project"
    make
}

package() {
    cd "${srcdir}/${_name}/build"

    msg "Installing files"
    make DESTDIR="${pkgdir}/" install
}
