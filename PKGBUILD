# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="epson-pc-fax2"
pkgver=1.0.0
pkgrel=2
pkgdesc="Epson PC-FAX driver 2 used with CUPS"
arch=(
  'i686'
  'x86_64'
)
url="https://download.ebz.epson.net/man/linux/pc-fax2_e.html"
license=(
  'custom:Epson End User Software License Agreement'
)
depends=(
  'cups'
  'ghostscript'
  'glibc'
  'libcups'
)
# makedepends=(
#   'curl'
# )
_pkgsrc="${pkgname}-${pkgver}"
# DLAGENTS+=(
#   'https::/usr/bin/curl -A "Mozilla" -qgb "" -fLC - --retry 3 --retry-delay 3 -o %o %u'
# )
source_i686=(
  "${_pkgsrc}-i686.deb::https://download3.ebz.epson.net/dsc/f/03/00/15/14/03/75cca41028d85de671a802d8a5c6d36b3945dc0f/${_pkgsrc}i386.deb"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.deb::https://download3.ebz.epson.net/dsc/f/03/00/15/14/02/23d720c4f51c39c9012f607fce736063b1815c88/${_pkgsrc}x86_64.deb"
)
noextract=(
  "${source_i686[@]%%::*}"
  "${source_x86_64[@]%%::*}"
)
sha256sums_i686=('bd100fb0be5b1b72120d6d232e866322de9b067e2ca984433d841f263ebd938f')
sha256sums_x86_64=('74d2dc3c0eeac490f4551daa4a0dac37c110a3101dd47e75e49feaa142c86236')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find . -type f -name '*.ppd' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/cups/model/${pkgname}/{}" \;

  cd "opt/epson/${pkgname}"
  find "bin" -maxdepth 1 -type f -exec \
    install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  
  install -vd "${pkgdir}/usr/lib/cups/backend"
  cp -vaT --no-preserve=ownership "bin/backend" "${pkgdir}/usr/lib/cups/backend"

  cd "doc"
  install -vDm644 "NEWS"          "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README"        "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYING.EPSON" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
