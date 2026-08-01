# Maintainer: Vincent Schult <viboschu@gmail.com>

pkgname=brother-hl6180dw-lpr-bin
pkgver=3.0.0_1
pkgrel=2
pkgdesc='LPR driver for Brother HL-6180DW printer'
arch=('i686' 'x86_64')
url='https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hl6180dw_all'
license=('LicenseRef-Brother-EULA' 'GPL-2.0-or-later')
depends=(
  ghostscript
  sh
)
depends_i686=(
  glibc
)
depends_x86_64=(
  lib32-glibc
)

options=('!strip' '!debug' '!emptydirs')

_deb="hl6180dwlpr-${pkgver/_/-}.i386.deb"

source=(
  "${_deb}::https://download.brother.com/welcome/dlf006041/${_deb}"
  'LICENSE.html::https://support.brother.com/g/s/agreement/English_lpr/agree.html'
)
noextract=(
  "${_deb}"
)
sha256sums=('3b9db34d70b8199c17a56df746da1431ee7bbac9df299cfd6ed28b78350c6769'
            '194f2a3b820f6533e7abbce7fdb727a1434a6e07f1851be696e40771e7a884ea')

prepare(){
  cd "${srcdir}"
  rm -rf deb-root
  mkdir -p deb-root
  bsdtar -xf "${_deb}" -C deb-root
}

package(){
  local data_tar=("${srcdir}/deb-root"/data.tar.*)

  bsdtar -xf "${data_tar[0]}" -C "${pkgdir}"

  local vendor="${pkgdir}/opt/brother/Printers/HL6180DW"

  sed -i 's|GHOST_SCRIPT=`which gs`|GHOST_SCRIPT=/usr/bin/gs|' "${vendor}/lpd/psconvert2"

  rm -f "${vendor}/inf/braddprinter" "${vendor}/inf/setupPrintcap" "${vendor}/lpd/brprintconflsr3"

  rm -rf "${pkgdir}/var/spool/lpd" "${pkgdir}/etc/opt" "${pkgdir}/usr/share/doc"

  install -Dm644 "${srcdir}/LICENSE.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
