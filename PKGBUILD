# Maintainer: masutu < masutu dot arch at gmail dot com >
# Contributor: Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=cpl
pkgver=7.4
pkgrel=1
#lock the versions
_wcs_ver=8.5
_cfitsio_ver=4.6.3
_fftw_ver=3.3.10
pkgdesc="ESO Common Pipeline Library"
url="https://www.eso.org/sci/software/cpl/index.html"
arch=('x86_64')
license=('GPL2')
depends=(gsl)
source=(ftp://ftp.eso.org/pub/dfs/pipelines/libraries/cpl/cpl-${pkgver}.tar.gz
	https://ftp.eso.org/pub/dfs/pipelines/libraries/cfitsio/cfitsio-${_cfitsio_ver}.tar.gz
	https://ftp.eso.org/pub/dfs/pipelines/libraries/wcslib/wcslib-${_wcs_ver}.tar.bz2
	https://ftp.eso.org/pub/dfs/pipelines/libraries/fftw/fftw-${_fftw_ver}.tar.gz
    cpl.sh)	
md5sums=('26930526738069a72c1b607f8a3ddacd'
         '1f95e471cf89403ff877ab58a788ad69'
         '07b188f67739a621101103f92ccf52cc'
         '8ccbf6a5ea78a16dbc3e1306e234cc5c'
         'SKIP')

build_cfitsio () {
    cd ${srcdir}/cfitsio-${_cfitsio_ver}
    ./configure --prefix=${srcdir}/build --enable-reentrant --enable-shared
    make
    make install
}

build_wcslib () {
    cd ${srcdir}/wcslib-${_wcs_ver}
    ./configure --prefix=${srcdir}/build --without-pgplot --with-x --with-cfitsiolib=${srcdir}/lib --with-cfitsioinc=${srcdir}/include --disable-fortran
    make
    make install
}

build_fftw () {
    cd ${srcdir}/fftw-${_fftw_ver}
     ./configure --prefix=${srcdir}/build --enable-openmp --enable-threads --enable-avx --enable-sse2 --disable-fortran --enable-shared --enable-float
    make
    make install
    make clean
     ./configure --prefix=${srcdir}/build --enable-openmp --enable-threads --enable-avx --enable-sse2 --disable-fortran --enable-shared
    make
    make install
}

build () {
    build_cfitsio
    build_wcslib
    build_fftw
    export LD_LIBRARY_PATH=${srcdir}/build/lib:${LD_LIBRARY_PATH}
    export C_INCLUDE_PATH=${srcdir}/build/include:${C_INCLUDE_PATH}
    export CFITSIODIR=${srcdir}/build
    export WCSDIR=${srcdir}/build
    export FFTWDIR=${srcdir}/build

    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=${pkgdir}/opt/esopipes --with-fftw=${FFTWDIR} CPPFLAGS="-DCX_DISABLE_ASSERT -DL2_CACHE_BYTES=0" --with-system-cext=no
    make 
}

package() {

    cd ${srcdir}/${pkgname}-${pkgver}
    make install
    install -D -m644 COPYING "${pkgdir}/share/licenses/${pkgname}/LICENSE"
    install -D -m755 ${srcdir}/cpl.sh ${pkgdir}/etc/profile.d/cpl.sh   

    cp -a ${srcdir}/build/* ${pkgdir}/opt/esopipes/
    install -d "$pkgdir/opt/esopipes/lib/esopipes-plugins" 
}

# vim:set ts=4 sw=4 et:
