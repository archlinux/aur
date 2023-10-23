# Maintainer: Kars Wang <jaklsy [at] gmail [dot] com>

_pkgname=libint
_lmax_ver=7
pkgname=libint-cp2k
pkgver=2.7.0.beta.5
_pkgver="$(sed 's/\.beta/-beta/' <<< "${pkgver}")"
__pkgver="v${_pkgver}-cp2k-lmax-${_lmax_ver}"
pkgrel=1
pkgdesc='A high-performance library for computing Gaussian integrals in quantum mechanics (cp2k edition)'
url='https://github.com/cp2k/libint-cp2k'
license=('GPL')
arch=('x86_64')
depends=('boost')
makedepends=('python' 'gcc-fortran' 'cmake' 'automake' 'autoconf' 'eigen')
provides=('libint2')
conflicts=('libint2')
source=("https://github.com/cp2k/libint-cp2k/releases/download/v${_pkgver}/${_pkgname}-${__pkgver}.tgz")
sha256sums=('523e93da19652ae78ebaaa7c646dd2cd2f93809ca0c5a1f325e80f1d264af8e1')
options=(staticlibs)


prepare() {
    cd "${srcdir}/${_pkgname}-${__pkgver}"

    # Setting build environment
    export CC=gcc
    export CXX=g++
    export FC=gfortran
    export CXXGENFLAGS="$CXXFLAGS"

    mkdir -p build
}

build() {
    cd "${srcdir}/${_pkgname}-${__pkgver}/build"

    cmake .. -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_CXX_COMPILER="$CXX" \
        -DLIBINT2_INSTALL_LIBDIR="/usr/lib" \
        -DENABLE_FORTRAN=ON \
        -DCXXFLAGS="$CXXFLAGS -g1"

    cmake --build .
}

# check() {
#     libint_build_dir="${srcdir}/build_libint"
#     cd "$libint_build_dir/${_pkgname}-${__pkgver}"
#     cmake --build . --target check
# }

package() {
    cd "${srcdir}/${_pkgname}-${__pkgver}/build"
    cmake --build . --target install -- DESTDIR="${pkgdir}"
}
