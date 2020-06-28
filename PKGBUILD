# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: George Eleftheriou <eleftg>
# Contributor: orumin <dev at orum.in>

_pkgname=hdf5
pkgname=lib32-${_pkgname}
pkgver=1.12.0
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data (32-bit)"
arch=('x86_64')
url="https://portal.hdfgroup.org/display/support"
license=(custom)
depends=(lib32-zlib lib32-libaec bash)
makedepends=(cmake time gcc-fortran-multilib)
source=("https://support.hdfgroup.org/ftp/HDF5/releases/${_pkgname}-${pkgver:0:4}/${_pkgname}-${pkgver}/src/${_pkgname}-${pkgver}.tar.bz2"
        hdf5-1.12.0-compat-1.6.patch)
sha256sums=('97906268640a6e9ce0cde703d5a71c9ac3092eded729591279bf2e3ca9765f61'
            '72ad497c56760bb3af8193c88d3fa264125829850b843697de55d934c56f7f44')

build() {
    # Crazy workaround: run CMake to generate pkg-config file
    mkdir -p build && cd build
    cmake ../${_pkgname}-${pkgver/_/-} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DHDF5_BUILD_HL_LIB=ON \
        -DHDF5_BUILD_CPP_LIB=ON \
        -DHDF5_BUILD_FORTRAN=ON \
        -DHDF5_ENABLE_Z_LIB_SUPPORT=ON \
        -DHDF5_ENABLE_SZIP_SUPPORT=ON \
        -DHDF5_ENABLE_SZIP_ENCODING=ON
    # But dont build with it, its quite broken

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
    cd ${_pkgname}-${pkgver/_/-}
    # Without this, checks are failing with messages like error while loading shared libraries: libhdf5.so.101: cannot open shared object file: No such file or directory
    export LD_LIBRARY_PATH="${srcdir}"/${pkgname}-${pkgver/_/-}/src/.libs/
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${srcdir}"/${pkgname}-${pkgver/_/-}/c++/src/.libs/
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${srcdir}"/${pkgname}-${pkgver/_/-}/fortran/src/.libs/
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${srcdir}"/${pkgname}-${pkgver/_/-}/hl/src/.libs/
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${srcdir}"/${pkgname}-${pkgver/_/-}/hl/c++/src/.libs/
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${srcdir}"/${pkgname}-${pkgver/_/-}/hl/fortran/src/.libs/
    make check
}

package() {
    cd ${_pkgname}-${pkgver/_/-}
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING -t "${pkgdir}"/usr/share/licenses/${_pkgname}
    # Install pkg-config files from CMake tree
    install -Dm644 ../build/CMakeFiles/hdf5{,_hl}{,_cpp}-${pkgver}.pc -t "${pkgdir}"/usr/lib/pkgconfig/
    # Fix 1.6 compatibility for h5py
    cd "${pkgdir}"/usr/include/
    patch -p1 -i "${srcdir}"/hdf5-1.12.0-compat-1.6.patch
}
