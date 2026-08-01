# Maintainer: Vincent Schult <viboschu@gmail.com>

pkgname=brother-hl6180dw-cups-bin
pkgver=3.0.0_1
pkgrel=2
pkgdesc='CUPS wrapper for Brother HL-6180DW printer'
arch=('i686' 'x86_64')
url='https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hl6180dw_all'
license=('GPL-2.0-or-later')

depends=(
  cups
  "brother-hl6180dw-lpr-bin=${pkgver}"
  sh
)
depends_i686=(
  glibc
)
depends_x86_64=(
  lib32-glibc
)

options=('!strip' '!debug' '!emptydirs')

_deb="hl6180dwcupswrapper-${pkgver/_/-}.i386.deb"
_vendor='/opt/brother/Printers/HL6180DW/cupswrapper'

source=("${_deb}::https://download.brother.com/welcome/dlf006043/${_deb}")
noextract=("${_deb}")

sha256sums=('2c47d5903df23084d095f23cdbf3cb1ae0fd1700d3201368ab03730495d25b13')

prepare(){
  cd "${srcdir}"
  rm -rf deb-root
  mkdir -p deb-root
  bsdtar -xf "${_deb}" -C deb-root
}

package(){
  local data_tar=("${srcdir}/deb-root"/data.tar.*)

  bsdtar -xf "${data_tar[0]}" -C "${pkgdir}"

  install -Dm755 "${pkgdir}${_vendor}/brother_lpdwrapper_HL6180DW" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_HL6180DW"

  install -Dm644 "${pkgdir}${_vendor}/brother-HL-6180DW-cups-en.ppd" "${pkgdir}/usr/share/cups/model/HL6180DW.ppd"

  rm -f "${pkgdir}${_vendor}/brother_lpdwrapper_HL6180DW" "${pkgdir}${_vendor}/brother-HL-6180DW-cups-en.ppd"
}
