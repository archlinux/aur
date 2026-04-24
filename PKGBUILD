#
# Maintainer: Uffe Jakobsen
#
# Past maintainer: Sébastien Luttringer <seblu@archlinux.org>
#

pkgname=sysvbanner
pkgver=1.0.19
_pkgver=1.0-19
__pkgver=1.0
pkgrel=1
pkgdesc='System-V banner clone'
arch=('x86_64')
#url='http://packages.qa.debian.org/s/sysvbanner.html'
url='http://https://salsa.debian.org/debian/sysvbanner'
depends=('glibc')
conflicts=('bsd-games')
license=("LicenseRef-custom")
#source=("http://ftp.debian.org/debian/pool/main/s/sysvbanner/${pkgname}_${pkgver}.tar.gz"
source=("http://ftp.debian.org/debian/pool/main/s/sysvbanner/${pkgname}_${__pkgver}.orig.tar.gz"
        "http://ftp.debian.org/debian/pool/main/s/sysvbanner/${pkgname}_${_pkgver}.debian.tar.xz"
        "01-man.patch")
sha512sums=('3635b6aeafdf29917b031d97533d4fd951bba639fb3604a99a0101dd5789db3631b9dde33765d76feeee9827dec2d201b09c5915763cf76778dffc8060810138'
            'b18fa530e343ee28a727c4ac0241d76fd22717b3bbefe011c2c25c45e10292aea78038df9b340f6675efbd75a55e9dcec36087ddb64208a06fd51ca512fa7c01'
            '14255d0a35be028728095921e3153861cd296612ab790e213413cc7f4da7690f60451ea76952f7877c17538c13cb44da71f353278c06f3700845656c9d98d609')

prepare()
{
  cd "${pkgname}-${__pkgver}.orig";

  echo;
  echo "Debian patch series:";
  cat "${srcdir}/debian/patches/series";
  echo;

  #for aa in $(cat "${srcdir}/debian/patches/series"); do
  for aa in "${srcdir}/debian/patches/"*.patch; do
      echo "Processing $(basename ${aa}):";
      patch -p1 -N -i "${aa}";
      echo;
  done

  pod2man --section 1 --center "${pkgname}" "${srcdir}/debian/banner.pod" > "${pkgname}.1";

  #cd "${pkgname}-${_pkgver}"
  # apply patch from the source array (should be a pacman feature)
  #local filename
  #for filename in "${source[@]}"; do
  #  if [[ "$filename" =~ \.patch$ ]]; then
  #    msg2 "Applying patch ${filename##*/}";
  #    patch -p1 -N -i "${srcdir}/${filename##*/}";
  #  fi;
  #done;
  #:
}

build()
{
  cd "${pkgname}-${__pkgver}.orig";
  make;
}

package()
{
  #cd "${pkgname}-${_pkgver}";
  #make DESTDIR="${pkgdir}" install;
  # rename into sysvbanner - allows co-existence with stock banner package (once the conflict has been removed)
  #mv "${pkgdir}/usr/bin/banner" "${pkgdir}/usr/bin/sysvbanner";
  #mv "${pkgdir}/usr/share/man/man1/banner.1" "${pkgdir}/usr/share/man/man1/sysvbanner.1";
  #install -D -m444 "debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE";

  cd "${pkgname}-${__pkgver}.orig";
  install -D -m755 "banner" "${pkgdir}/usr/bin/sysvbanner";
  install -D -m644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -D -m644 "${srcdir}/debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE";
}

#
# vim:set ts=2 sw=2 et:
#
# EOF
#
