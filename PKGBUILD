# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: George Eleftheriou <eleftg>
# Contributor: orumin <dev at orum.in>

_pkgname=hdf5
pkgname=lib32-${_pkgname}
pkgver=1.12.0
pkgrel=2
pkgdesc="General purpose library and file format for storing scientific data (32-bit)"
arch=('x86_64')
url="https://portal.hdfgroup.org/display/support"
license=(custom)
depends=(lib32-zlib lib32-libaec bash hdf5)
makedepends=(cmake time gcc-fortran-multilib)
source=("https://support.hdfgroup.org/ftp/HDF5/releases/${_pkgname}-${pkgver:0:4}/${_pkgname}-${pkgver}/src/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('97906268640a6e9ce0cde703d5a71c9ac3092eded729591279bf2e3ca9765f61')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    ./configure \
        CFLAGS="-m32 ${CFLAGS}" \
        CXXFLAGS="-m32 ${CXXFLAGS}" \
        FCFLAGS="-m32 ${FCFLAGS}" \
        FC="gfortran" \
        F9X="gfortran" \
        PKG_CONFIG_PATH="/usr/lib32/pkgconfig" \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --disable-static \
        --disable-sharedlib-rpath \
	--disable-tools \
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
    cd ${_pkgname}-${pkgver/_/-}

    # Without this, checks are failing with messages like error while loading shared libraries: libhdf5.so.101: cannot open shared object file: No such file or directory
    export LD_LIBRARY_PATH="${srcdir}"/${_pkgname}-${pkgver/_/-}/src/.libs/
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${srcdir}"/${_pkgname}-${pkgver/_/-}/c++/src/.libs/
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${srcdir}"/${_pkgname}-${pkgver/_/-}/fortran/src/.libs/
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${srcdir}"/${_pkgname}-${pkgver/_/-}/hl/src/.libs/
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${srcdir}"/${_pkgname}-${pkgver/_/-}/hl/c++/src/.libs/
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${srcdir}"/${_pkgname}-${pkgver/_/-}/hl/fortran/src/.libs/
    
    make check
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver/_/-}/src
    make DESTDIR="${pkgdir}" install
    cd ../c++
    make DESTDIR="${pkgdir}" install
    cd ../fortran
    make DESTDIR="${pkgdir}" install       
    cd ../hl
    make DESTDIR="${pkgdir}" install       
    
    cd ${srcdir}/${_pkgname}-${pkgver/_/-}
    
    rm -rf "${pkgdir}"/usr/bin
    rm -rf "${pkgdir}"/usr/include
}
