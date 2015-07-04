# Contributor: Graziano Giuliani

pkgname=g2clib
pkgver=1.4.0
pkgrel=5
pkgdesc="GRIB2 encoder/decoder (C version)"
url="http://www.nco.ncep.noaa.gov/pmb/codes/GRIB2"
license="custom:NWS"
arch=('i686' 'x86_64')
provides=(g2clib)
dependes=(jasper libpng)
options=('staticlibs')
source=(http://www.nco.ncep.noaa.gov/pmb/codes/GRIB2/${pkgname}-${pkgver}.tar
        NWS_license.txt)
md5sums=('f0cbab4ebbaec6d8dd15da1a36c93675'
         '64f9f7f5ad383df409986d8a67d2fa78')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  export CFLAGS="${CFLAGS} -fPIC"
  export CXXFLAGS="${CXXFLAGS} -fPIC"
  sed -i makefile -e 's/-X64//' -e '/CFLAGS=/d' -e '/CC=/d'
  CC=gcc CFLAGS="$CFLAGS -DUSE_JPEG2000 -DUSE_PNG" make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/{lib,include,share/licenses/${pkgname}}
  install -m 644 libgrib2c.a ${pkgdir}/usr/lib
  install -m 644 *.h ${pkgdir}/usr/include
  install -m 644 ${srcdir}/NWS_license.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/NWS
}

# vim:set ts=2 sw=2 et:
