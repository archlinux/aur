# Maintainer: Cabel <mxzcabel at tuta dot com>
# Contributor: Ishaan Bhimwal <ishaanbhimwal at gmail dot com>

pkgname=brother-dcpt220
_printer=dcpt220
pkgver=3.5.0
pkgrel=1
pkgdesc="Driver for the Brother DCP-T220 wifi multifuncional printer"
url="https://support.brother.com/g/b/producttop.aspx?c=in&lang=en&prod=dcpt220_all"
license=('GPL, EULA, custom:Brother License')
arch=('x86_64')
depends=('a2ps' 'cups' 'ghostscript' 'lib32-glibc')
optdepends=('system-config-printer: A CUPS printer configuration tool and status applet'
            'sane: scanning support'
            'sane-airscan: SANE backend for AirScan (eSCL) and WSD document scanners'
            'brscan5: scanning driver required to make the printer available to sane'
            'brscan-skey: scankey support if connected via USB')
source=("https://download.brother.com/welcome/dlf105163/${_printer}pdrv-${pkgver}-1.i386.rpm" "spool.patch")
sha256sums=('2244b72cb354f7be1140f5cd44ae54befaafb901f98ca100594f6b36e577c88a'
            '38cb648cba2504633641f31cfc78cc1539217eb0709a4e725be2913ee23403eb')
install="${_printer}.install"

package() {
 #unzip rpm file and go to pkgdir
  bsdtar -xf "${_printer}pdrv-${pkgver}-1.i386.rpm" -C "${pkgdir}"
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
  ln -s "/${_dir_opt}/lpd/x86_64/brprintconf_${_printer}" "${_dir_opt}/lpd"
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
