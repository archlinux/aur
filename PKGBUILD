# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>
_ecmwfname=bufrdc
pkgname=libbufr-ecmwf
pkgver=000403
pkgrel=1
pkgdesc="ECMWF WMO FM-94 BUFR encode/decode library"
arch=(i686 x86_64)
url="https://software.ecmwf.int/wiki/display/BUFR/BUFRDC+Home"
license=('Apache')
groups=(science)
depends=()
makedepends=(rsync gcc-fortran)
options=('staticlibs')
source=(https://software.ecmwf.int/wiki/download/attachments/35752466/${_ecmwfname}_${pkgver}.tar.gz)
md5sums=('a64b82478cd03ab41f3a029ff5ce1dcb')

build() {
  cd ${srcdir}/${_ecmwfname}_${pkgver}
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
