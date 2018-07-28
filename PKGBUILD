# Maintainer : George Eleftheriou <eleftg>
# Contributor: orumin <dev at orum.in>

_pkgname=hdf5
pkgname=lib32-${_pkgname}
pkgver=1.10.2
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data (32-bit)"
arch=('x86_64')
url="https://www.hdfgroup.org/hdf5/"
license=('custom')
depends=('lib32-zlib')
makedepends=('time' 'gcc-fortran-multilib')
source=("https://support.hdfgroup.org/ftp/HDF5/releases/${_pkgname}-${pkgver:0:4}/${_pkgname}-${pkgver}/src/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('41fb9347801b546fba323523a1c1af51')

prepare() {
    cd ${_pkgname}-${pkgver}

    # Fix building with GCC 8.1
    sed 's/\(.*\)(void) HDF_NO_UBSAN/HDF_NO_UBSAN \1(void)/' -i src/H5detect.c
}

build() {
    cd ${_pkgname}-${pkgver}

    ./configure \
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
        --with-zlib
    make
}

check() {
    cd ${_pkgname}-${pkgver}

    # Without exporting LD_LIBRARY_PATH, tests fail being unable to
    # locate the newly built (not installed yet) hdf5 runtime
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/${_pkgname}-${pkgver}/src/.libs"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/${_pkgname}-${pkgver}/c++/src/.libs"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/${_pkgname}-${pkgver}/fortran/src/.libs"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/${_pkgname}-${pkgver}/hl/src/.libs"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/${_pkgname}-${pkgver}/hl/c++/src/.libs"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${srcdir}/${_pkgname}-${pkgver}/hl/fortran/src/.libs"

    make check
}

package() {
    cd ${_pkgname}-${pkgver}

    make -j1 DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}"/usr/{include,share,bin}
}
