# Maintainer: Cabel <mxzcabel at tuta dot com>

pkgname=brother-dcpt430w
_printer=dcpt430w
pkgver=3.6.1
pkgrel=1
pkgdesc="Driver for the Brother DCP-t430w wifi multifuncional printer"
url="https://support.brother.com/g/b/downloadtop.aspx?c=us_ot&lang=en&prod=dcpt430w_all"
license=('GPL, EULA, custom:Brother License')
arch=('x86_64')
depends=('a2ps' 'ghostscript' 'cups' 'lib32-glibc')
optdepends=('system-config-printer: A CUPS printer configuration tool and status applet'
            'sane: scanning support'
            'sane-airscan: SANE backend for AirScan (eSCL) and WSD document scanners'
            'brscan5: scanning driver required to make the printer available to sane'
            'brscan-skey: scankey support if connected via USB')
            source=("https://download.brother.com/welcome/dlf106510/${_printer}pdrv-${pkgver}-1.${arch}.rpm" "spool.patch")
sha256sums=('fda5dc3bcb6a3f271fe1a6b7182ce812a46349a6f98014397c0fc6a9afdb9cf3'
            '41754aa2f95eb562a6e298b8426b57ca9dc3b471247bf96fa109dd2b22567e2c')
install="${_printer}.install"

package() {
 #unzip rpm file and go to pkgdir
  bsdtar -xf "${_printer}pdrv-${pkgver}-1.${arch}.rpm" -C "${pkgdir}"
  cd "${pkgdir}"

 #used directories
  _dir_opt="opt/brother/Printers/${_printer}"
  _dir_model="usr/share/cups/model/Brother"
  _dir_filter="usr/lib/cups/filter"
  _dir_bin="usr/bin"
  _dir_licenses="usr/share/licenses/${pkgname}"

 #include ppd file inside cups Brother's model directory
  install "${_dir_opt}/cupswrapper/brother_${_printer}_printer_en.ppd" -Dm755 -t "${_dir_model}"

 #include filter required by cups libraries
  install "${_dir_opt}/cupswrapper/brother_lpdwrapper_${_printer}" -Dm755 -t "${_dir_filter}"

 #include symbolic link for brother printer configuration
  mkdir -p "${pkgdir}/${_dir_bin}"
  ln -s "/${_dir_opt}/lpd/${arch}/brprintconf_${_printer}" "${_dir_opt}/lpd"
  ln -s "/${_dir_opt}/lpd/brprintconf_${_printer}" "${_dir_bin}"

 #install licenses inside the created brother's license directory
  mkdir -p "${pkgdir}/${_dir_licenses}"
  _licenses=("LICENSE_ENG.txt" "LICENSE_JPN.txt")
  for license in "${_licenses[@]}" ; do
    chmod 644 "${_dir_opt}/${license}"
    mv "${_dir_opt}/${license}" ${_dir_licenses}
  done

 #apply required patch
  patch -Np0 < "${srcdir}/spool.patch"
}
