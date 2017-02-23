# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=wgrib2
pkgver=2.0.6c
pkgrel=1
pkgdesc="A program to manipulate, inventory and decode GRIB-2 files"
arch=('i686' 'x86_64')
url="http://www.cpc.noaa.gov/products/wesley/wgrib2/"
license=('custom')
depends=('netcdf' 'jasper' 'libpng' 'libmariadbclient' 'proj' 'libaec')
makedepends=('g2clib' 'gctpc')
source=(ftp://ftp.cpc.ncep.noaa.gov/wd51we/${pkgname}/${pkgname}_nolib.tgz.v${pkgver}
        wgrib2.patch
        http://www.ftp.cpc.ncep.noaa.gov/wd51we/${pkgname}/iplib_hwrf.tgz)
md5sums=('6d2eda625b7f370011904cec73be3546'
         'bcebd9ebba2c95757c61ade4570c0f69'
         '6d672b9d5823a0cb3bdd12131175250a')

build() {
  cd ${srcdir}/iplib_hwrf
  rm -f *.o *.a
  FC=gfortran FFLAGS='${CFLAGS} -fPIC -DPIC' make
  cd ${srcdir}/grib2
  patch -p0 -i ${srcdir}/wgrib2.patch
  sed -i 's/image.inmem_.*=.*1;//' wgrib2/enc_jpeg2000_clone.c
  FC=gfortran F90=gfortran F77=gfortran make
}

package()
{
  cd ${srcdir}/grib2
  install -Dm755 ${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${pkgname}/LICENSE-${pkgname} \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
