# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="epson-pc-fax2"
pkgver=1.0.0
pkgrel=2
pkgdesc="Epson PC-FAX driver used with CUPS"
arch=('i686' 'x86_64')
url="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:Epson End User Software License Agreement')
depends=('cups' 'glibc' 'libcups')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{i686,x86_64}".deb")
# DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")
source=("MANUAL.en.pdf::https://download3.ebz.epson.net/dsc/f/03/00/16/58/60/be239e715344c3a12abb97ca9daa16ec1111693a/PC-Fax2_e.pdf"
        "MANUAL.jp.pdf::https://download3.ebz.epson.net/dsc/f/03/00/16/58/60/7747738edb34cdd52f0ad109e964ad13173ad7eb/PC-Fax2_j.pdf")
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
  cd "${srcdir}"
  install -Dm644 "MANUAL.en.pdf" \
    "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${pkgname}/MANUAL.en.pdf"
  install -Dm644 "MANUAL.jp.pdf" \
    "${srcdir}/${_pkgsrc}-${CARCH}/usr/share/doc/${pkgname}/MANUAL.jp.pdf"

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
