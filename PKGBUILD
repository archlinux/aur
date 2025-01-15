# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="epson-pc-fax2"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson PC-FAX driver used with CUPS"
arch=('i686' 'x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('cups' 'glibc' 'libcups')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{i686,x86_64}".deb")
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source_i686=("${_pkgsrc}-i686.deb::https://download3.ebz.epson.net/dsc/f/03/00/15/14/03/75cca41028d85de671a802d8a5c6d36b3945dc0f/${_pkgsrc}i386.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://download3.ebz.epson.net/dsc/f/03/00/15/14/02/23d720c4f51c39c9012f607fce736063b1815c88/${_pkgsrc}x86_64.deb")
sha256sums_i686=('bd100fb0be5b1b72120d6d232e866322de9b067e2ca984433d841f263ebd938f')
sha256sums_x86_64=('74d2dc3c0eeac490f4551daa4a0dac37c110a3101dd47e75e49feaa142c86236')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/opt/epson/${pkgname}/doc"
  install -Dm644 "NEWS"   "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 "README" "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${pkgname}/README"
  install -Dm644 "COPYING.EPSON" \
    "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/licenses/${pkgname}/COPYING"
  
  cd "${srcdir}/${_pkgsrc}-${CARCH}/opt/epson/${pkgname}"
  rm -rf "doc"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  cp -vr --no-preserve=ownership * "${pkgdir}"

  install -vdm755 "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -vsf "/opt/epson/${pkgname}/bin/epfax2" "epfax2"
}
