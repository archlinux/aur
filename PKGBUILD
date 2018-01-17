# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
_ecmwfname=bufrdc
pkgname=libbufr-ecmwf
pkgver=000409
tablever=4.1.2
_ecmwfdir=35752466
pkgrel=2
pkgdesc="ECMWF WMO FM-94 BUFR encode/decode library"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/BUFR/BUFRDC+Home"
license=('Apache')
groups=(science)
depends=()
makedepends=(rsync gcc-fortran)
options=('staticlibs')
source=(https://software.ecmwf.int/wiki/download/attachments/$_ecmwfdir/${_ecmwfname}_${pkgver}.tar.gz https://software.ecmwf.int/wiki/download/attachments/$_ecmwfdir/bufrdc_tables-${tablever}.tar.gz)
md5sums=('4f924c5b821e280da84b4e6389f522f2'
         '31fb65adb1d9885ab50c429c9f71d046')

build() {
  cd ${srcdir}/${_ecmwfname}_${pkgver}
  sed -i -e '/\/var\/tmp\/mac\/p4/d' test.sh
  sed -i -e "/CFLAGS/s|$| -fPIC|" config/config.linux_gfortran*.in
  sed -i -e "/FFLAGS/s|$| -fPIC|" config/config.linux_gfortran*.in
  # gcc/fortran: y; ifort: i
  # NB: ifort could be enabled here instead of gfortran
  _response="y\n"

  # 64-bit reals on x86_64, else 32-bit reals
  if [[ "$CARCH" == "x86_64" ]]; then
    _response="${_response}y\n"
  else
    _response="${_response}n\n"
  fi

  # The installation directory (/usr/local/lib) appears to be 
  # hard-coded during compilation
  _response="${_response}/usr/share/gribdc\n"
  echo -e $_response | ./build_library
  cd ${srcdir}/${_ecmwfname}_${pkgver}/bufrtables
  tar zxvf ${srcdir}/bufrdc_tables-${tablever}.tar.gz
}

package() {
  cd ${srcdir}/${_ecmwfname}_${pkgver}
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/share/libbufr/bufrtables
  if [[ "$CARCH" == "x86_64" ]]; then
    install -m 644 libbufrR64.a ${pkgdir}/usr/lib/libbufrR64.a
    ln -sf /usr/lib/libbufrR64.a ${pkgdir}/usr/lib/libbufr.a
  else
    install -m 644 libbufr.a ${pkgdir}/usr/lib/libbufr.a
  fi
  rsync -a bufrtables/*.TXT bufrtables/*.distinct \
    ${pkgdir}/usr/share/libbufr/bufrtables
}

# vim:set ts=2 sw=2 et:
