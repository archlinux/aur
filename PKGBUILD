# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=cpl
pkgver=7.1.4
pkgrel=3
#lock the versions
_wcs_ver=7.6
_cfitsio_ver=3.49
_fftw_ver=3.3.9
pkgdesc="ESO Common Pipeline Library"
url="https://www.eso.org/sci/software/cpl/index.html"
arch=('x86_64')
license=('GPL2')
depends=(gsl)
makedepends=(gsl)
provides=()
conflicts=()
replaces=()
backup=()
source=(ftp://ftp.eso.org/pub/dfs/pipelines/libraries/cpl/cpl-${pkgver}.tar.gz
	https://ftp.eso.org/pub/dfs/pipelines/libraries/cfitsio/cfitsio-${_cfitsio_ver}.tar.gz
	https://ftp.eso.org/pub/dfs/pipelines/libraries/wcslib/wcslib-${_wcs_ver}.tar.bz2
	https://ftp.eso.org/pub/dfs/pipelines/libraries/fftw/fftw-${_fftw_ver}.tar.gz
    cpl.sh)	
md5sums=('fd172d323a94dce2624b5d9b8014f21a'
         '171860ffed8c1a396fc497d853f285c1'
         '8fea0d68e0a0d3946c2c39d62f7198a2'
         '50145bb68a8510b5d77605f11cadf8dc'
         SKIP)


build_cfitsio () {
    cd ${srcdir}/cfitsio-${_cfitsio_ver}
    ./configure --prefix=${srcdir}/build --enable-reentrant --enable-sse2 --enable-ssse3
    make
    make shared
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
    ./configure --prefix=${pkgdir}/opt/esopipes --with-fftw=${FFTWDIR} CPPFLAGS="-DCX_DISABLE_ASSERT -DL2_CACHE_BYTES=0"
    make 
}


package() {

    cd ${srcdir}/${pkgname}-${pkgver}
    make install
    install -D -m644 COPYING "${pkgdir}/share/licenses/${pkgname}/LICENSE"
    install -D -m755 ${srcdir}/cpl.sh ${pkgdir}/etc/profile.d/cpl.sh   

    cp -aR ${srcdir}/build/* ${pkgdir}/opt/esopipes/
    
}

# vim:set ts=4 sw=4 et:
