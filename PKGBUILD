# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Jingbei Li <petronny>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <archange@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>
# Contributor: Jed Brown <jed@59A2.org>
# Contributor: Simone Pezzuto <junki.gnu@gmail.com>

_pkgname=hdf5
_mpi=mpich
pkgname=${_pkgname}-${_mpi}
_prefix=/opt/${pkgname}
pkgver=1.12.0
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data (${_mpi} version) (full version including its Java Native Interfaces)"
arch=('x86_64')
url="https://portal.hdfgroup.org/display/support"
license=('custom')
depends=('bash' 'libaec' "${_mpi}")
makedepends=('cmake' 'time' 'java-environment' 'gcc-fortran')
options=('staticlibs')
source=("https://support.hdfgroup.org/ftp/HDF5/releases/${_pkgname}-${pkgver:0:4}/${_pkgname}-${pkgver}/src/${_pkgname}-${pkgver}.tar.bz2"
        'hdf5-1.12.0-compat-1.6.patch')
md5sums=('1fa68c4b11b6ef7a9d72ffa55995f898'
         'afd4d35a187d5c7892e7060e729d4813')

build() {
    # Crazy workaround: run CMake to generate pkg-config file
    mkdir -p build && cd build

    RUNPARALLEL="/opt/mpich/bin/mpirun" \
    JAVADOC='javadoc -Xdoclint:none' \
    cmake ../${_pkgname}-${pkgver}  \
        -DCMAKE_CXX_COMPILER=/opt/mpich/bin/mpicxx \
        -DCMAKE_C_COMPILER=/opt/mpich/bin/mpicc \
        -DCMAKE_Fortran_COMPILER=/opt/mpich/bin/mpif90 \
        -DCMAKE_C_FLAGS="${CPPFLAGS} ${CFLAGS}" \
        -DCMAKE_CXX_FLAGS="${CPPFLAGS} ${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
        -DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
        -DCMAKE_MODULE_LINKER_FLAGS="${LDFLAGS}" \
        -DCMAKE_INSTALL_RPATH="" \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="${_prefix}" \
        -DALLOW_UNSUPPORTED=ON \
        -DHDF5_BUILD_HL_LIB=ON \
        -DHDF5_BUILD_CPP_LIB=ON \
        -DHDF5_BUILD_FORTRAN=ON \
        -DHDF5_BUILD_JAVA=ON \
        -DHDF5_ENABLE_Z_LIB_SUPPORT=ON \
        -DHDF5_ENABLE_SZIP_SUPPORT=ON \
        -DHDF5_ENABLE_SZIP_ENCODING=ON \
        -DHDF5_ENABLE_PARALLEL=ON \
        -DBUILD_TESTING=OFF

    # But don’t build with it, it’s quite broken
    "${srcdir}/${_pkgname}-${pkgver}"/configure \
        CXX="/opt/mpich/bin/mpicxx" \
        CC="/opt/mpich/bin/mpicc" \
        FC="/opt/mpich/bin/mpif90" \
        F9X="/opt/mpich/bin/mpif90" \
        MPICH_MPICC_FLAGS="${CFLAGS}" \
        MPICH_MPICXX_FLAGS="${CXXFLAGS}" \
        MPICH_LDFLAGS="${LDFLAGS}" \
        RUNPARALLEL="/opt/mpich/bin/mpirun" \
        JAVADOC='javadoc -Xdoclint:none' \
        --prefix="${_prefix}" \
        --docdir="${_prefix}/share/doc/${_pkgname}" \
        --enable-static \
        --disable-sharedlib-rpath \
        --enable-build-mode=production \
        --enable-hl \
        --enable-cxx \
        --enable-fortran \
        --enable-java \
        --enable-parallel \
        --enable-unsupported \
        --with-pic \
        --with-zlib \
        --with-szlib

    make
}

package() {
    cd build

    make DESTDIR="${pkgdir}" install

    # Move examples to a proper place
    install -dm755 "${pkgdir}${_prefix}/share/doc/${_pkgname}"
    mv "${pkgdir}${_prefix}"/share/{hdf5_examples,doc/${_pkgname}/examples}

    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 CMakeFiles/hdf5{,_hl}{,_cpp}-${pkgver}.pc \
        -t "${pkgdir}${_prefix}"/lib/pkgconfig
    # Fix 1.6 compatibility for h5py
    cd "${pkgdir}"/usr/include/
    patch -p1 -i "${srcdir}"/hdf5-1.12.0-compat-1.6.patch
}
