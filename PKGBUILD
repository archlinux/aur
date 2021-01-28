#
# Maintainer: Uffe Jakobsen
#

pkgname=sysvbanner
pkgver=1.0.18
_pkgver=1.0
__pkgver=${_pkgver}-18
pkgrel=1
pkgdesc='System-V banner clone'
arch=('x86_64')
url='http://packages.qa.debian.org/s/sysvbanner.html'
depends=('glibc')
#conflicts=('bsd-games')
license=('custom')
source=("http://deb.debian.org/debian/pool/main/s/sysvbanner/${pkgname}_1.0.orig.tar.gz"
        "http://deb.debian.org/debian/pool/main/s/sysvbanner/${pkgname}_${__pkgver}.debian.tar.xz"
        "01-man.patch")
sha512sums=("3635b6aeafdf29917b031d97533d4fd951bba639fb3604a99a0101dd5789db3631b9dde33765d76feeee9827dec2d201b09c5915763cf76778dffc8060810138"
            "cde22c02bffc1477973af7ec2d61ddd709c7d214a0752a28efc5d2d9a941267ade5551c913f07d773739bdb54f2bc888bcc75c785cd55cf59d8754e93893dd9b"
            "14255d0a35be028728095921e3153861cd296612ab790e213413cc7f4da7690f60451ea76952f7877c17538c13cb44da71f353278c06f3700845656c9d98d609")

prepare()
{
  cd "${pkgname}-${_pkgver}.orig"
  #cd "debian/pathces"

  echo
  echo "Debian patches:"
  echo
  for aa in "${srcdir}/debian/patches/"*.patch; do
      echo "$(basename ${aa}):"
      patch -p1 -N -i "${aa}"
      echo
  done

  pod2man "${srcdir}/debian/banner.pod" banner.1
  rm -f banner.1.gz
  gzip banner.1

  # apply patch from the source array (should be a pacman feature)
  #local filename
  #for filename in "${source[@]}"; do
  #  if [[ "${filename}" =~ \.patch$ ]]; then
  #    msg2 "Applying patch ${filename##*/}"
  #    patch -p1 -N -i "${srcdir}/${filename##*/}"
  #  fi
  #done
  #:
}

build()
{
  cd "${pkgname}-${_pkgver}.orig"
  make
}

package()
{
  #cd "${pkgname}-${_pkgver}.orig"
  #make DESTDIR="${pkgdir}" install

  install -D -m755 "${pkgname}-${_pkgver}.orig/banner" "${pkgdir}/usr/bin/sysvbanner"
  install -D -m755 "${pkgname}-${_pkgver}.orig/banner.1.gz" "${pkgdir}/usr/share/man/man1/sysvbanner.1.gz"
  install -D -m444 "debian/copyright" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
#
# EOF
#
