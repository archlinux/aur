# Maintainer : George Eleftheriou <eleftg>
# Maintainer : XavierCLL <xavier dot corredor dot llano at gmail dot com>
# Contributor: Jingbei Li <petronny>
# Contributor: David Scholl <djscholl at gmail dot com>

pkgname=hdf4-static
_pkgname=hdf4
pkgver=4.2.14
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data (version including the FORTRAN interfaces)"
arch=('x86_64')
url="https://portal.hdfgroup.org/display/support/HDF+4.2.14"
license=('custom')
options=('staticlibs')
depends=('libaec' 'zlib' 'libjpeg-turbo' 'libtirpc')
makedepends=('gcc-fortran')
source=("https://support.hdfgroup.org/ftp/HDF/releases/HDF${pkgver}/src/hdf-${pkgver}.tar.bz2"
        "config.patch")
md5sums=('3f3bd5da84015e9221d26fb5a80094b4'
         'e17d14ac1d27012c1ea9ac03f783d355')

prepare() {
    mkdir -p build
    cd "hdf-${pkgver}"
    patch < "${srcdir}/config.patch"
    autoreconf -i
}

build() {
    cd build

    "${srcdir}/hdf-${pkgver}"/configure \
        CFLAGS="${CFLAGS} -fPIC" \
        FFLAGS="${FFLAGS} -fPIC -ffixed-line-length-none" \
        LIBS="-ljpeg -laec -lsz" \
        F77=gfortran \
        --enable-static \
        --disable-shared \
        --enable-fortran \
        --disable-netcdf \
        --enable-production \
        --with-zlib \
        --with-szlib=/usr \
        --prefix=/opt/"${pkgname}"

  make
}

package() {
    cd build
    make -j1 DESTDIR="${pkgdir}" install
    install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 "${srcdir}/hdf-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}"
}
