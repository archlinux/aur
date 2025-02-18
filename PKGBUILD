# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="epson-pc-fax2"
pkgver=1.0.0
pkgrel=1
pkgdesc="Epson PC-FAX driver 2 used with CUPS"
arch=('i686' 'x86_64')
url="https://download.ebz.epson.net/man/linux/pc-fax2_e.html"
license=('custom:Epson End User Software License Agreement')
depends=('cups' 'glibc' 'libcups')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{i686,x86_64}".deb")
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("${pkgname}-MANUAL.en.pdf::https://download3.ebz.epson.net/dsc/f/03/00/16/58/60/be239e715344c3a12abb97ca9daa16ec1111693a/PC-Fax2_e.pdf"
        "${pkgname}-MANUAL.jp.pdf::https://download3.ebz.epson.net/dsc/f/03/00/16/58/60/7747738edb34cdd52f0ad109e964ad13173ad7eb/PC-Fax2_j.pdf")
source_i686=("${_pkgsrc}-i686.deb::https://download3.ebz.epson.net/dsc/f/03/00/15/14/03/75cca41028d85de671a802d8a5c6d36b3945dc0f/${_pkgsrc}i386.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://download3.ebz.epson.net/dsc/f/03/00/15/14/02/23d720c4f51c39c9012f607fce736063b1815c88/${_pkgsrc}x86_64.deb")
sha256sums=('93c04f9db10045355bfa2c804ade0be6e114f0abd0fe4c2c79289f16c4a5f640'
            '01a22dd3107aebeccfda5bdd468acb5fd6783395f1bf2c32eaa4d808fd752dfd')
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
  cd "${srcdir}/${_pkgsrc}-${CARCH}/opt"
  rm -rf "${pkgname}"
  mv -f "epson/${pkgname}" "${pkgname}"
  rm -rf "epson"

  cd "${pkgname}"
  find "doc" -type f \( -name '*LICENSE*' -o -name '*COPYING*' -o -name '*license*' \) \
    -execdir install -Dm644 "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/licenses/${pkgname}/{}" \; \
    -exec rm "{}" +
  find "doc" -type f -execdir \
    install -Dm644 "{}" "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${pkgname}/{}" \;
  rm -rf "doc"
  
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/cups/model"
  rm -rf "${pkgname}"
  mv -f "Epson" "${pkgname}"
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  install -vDm644 "${pkgname}-MANUAL.en.pdf" "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.en.pdf"
  install -vDm644 "${pkgname}-MANUAL.jp.pdf" "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.jp.pdf"

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vsf "/opt/${pkgname}/bin/epfax2" "${pkgdir}/usr/bin/epfax2"
}
