# Maintainer: orumin <dev at orum.in>

pkgname=lib32-hdf5
_basename=hdf5
pkgver=1.10.1
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data (32-bit)"
arch=('x86_64')
url="https://www.hdfgroup.org/hdf5/"
license=('custom')
depends=('lib32-zlib' 'bash')
makedepends=('time' 'gcc-fortran-multilib')
source=("https://support.hdfgroup.org/ftp/HDF5/releases/${_basename}-${pkgver:0:4}/${_basename}-${pkgver/_/-}/src/${_basename}-${pkgver/_/-}.tar.bz2")
# https://support.hdfgroup.org/ftp/HDF5/releases/${_basename}-${pkgver:0:4}/${_basename}-${pkgver/_/-}/src/${_basename}-${pkgver/_/-}.md5
md5sums=('d89893c05ee7ea8611b51bb39450d64e')

build() {
    cd ${_basename}-${pkgver/_/-}

    export CC="gcc -m32"
    export CXX="g++ -m32"
    export F9X="gfortran -m32"
    export PKG_CONFIG_PAHT="/usr/lib32/pkgconfig"

    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --disable-static \
        --enable-hl \
        --enable-build-mode=production \
        --with-pic \
        --docdir=/usr/share/doc/hdf5/ \
        --disable-sharedlib-rpath \
        --enable-cxx \
        --enable-fortran \
        --with-zlib
    make
}

package() {
    cd ${_basename}-${pkgver/_/-}

    make -j1 DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}"/usr/lib32/libdynlib*.so
    rm -r "${pkgdir}"/usr/bin
    rm -r "${pkgdir}"/usr/include
    rm -r "${pkgdir}"/usr/share
}
