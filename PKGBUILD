# Maintainer : George Eleftheriou <eleftg>
# Contributor: orumin <dev at orum.in>

_pkgname=hdf5
pkgname=lib32-${_pkgname}
pkgver=1.10.3
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data (32-bit)"
arch=('x86_64')
url="https://portal.hdfgroup.org/display/support"
license=('custom')
depends=('lib32-zlib' 'lib32-libaec')
makedepends=('time' 'gcc-fortran-multilib')
source=("https://support.hdfgroup.org/ftp/HDF5/releases/${_pkgname}-${pkgver:0:4}/${_pkgname}-${pkgver}/src/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('56c5039103c51a40e493b43c504ce982')

prepare() {
    [ ! -d build ] && mkdir -p build
}

build() {
    cd build

    "${srcdir}/${_pkgname}-${pkgver}"/configure \
        CFLAGS="-m32 ${CFLAGS}" \
        CXXFLAGS="-m32 ${CXXFLAGS}" \
        FCFLAGS="-m32 ${FCFLAGS}" \
        FC="gfortran" \
        F9X="gfortran" \
        PKG_CONFIG_PATH="/usr/lib32/pkgconfig" \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --docdir=/usr/share/doc/hdf5 \
        --disable-static \
        --disable-sharedlib-rpath \
        --enable-build-mode=production \
        --enable-hl \
        --enable-cxx \
        --enable-fortran \
        --with-pic \
        --with-zlib \
        --with-szlib

    make
}

check() {
    cd build

    # Without exporting LD_LIBRARY_PATH, tests fail being unable to
    # locate the newly built (not installed yet) hdf5 runtime
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/build/src/.libs"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/build/c++/src/.libs"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/build/fortran/src/.libs"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/build/hl/src/.libs"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/build/hl/c++/src/.libs"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/build/hl/fortran/src/.libs"

    make check
}

package() {
    cd build

    make -j1 DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}"/usr/{include,share,bin}
}
