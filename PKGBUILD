# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_model=dcpl3560cdw
_revision=1
pkgname=brother-dcpl3560cdw-cups-bin
pkgver=3.5.1
pkgrel=1
pkgdesc="CUPS driver for the Brother DCP-L3560CDW printer"
arch=('x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpl3560cdw_us_eu_as"
license=('LicenseRef-Brother')
depends=('perl')
options=('!debug')
source=("https://download.brother.com/welcome/dlf105772/${_model}pdrv-${pkgver}-${_revision}.i386.rpm")
b2sums=('8cefe00cb540d8c48d65091e5978f261db5b355328385cded88f1fd1ff10229503d9bed8a57c4a40f7433709f2a7a12aac9b900f03dfc120a23ad31fb10b9e13')

package() {
  # removes unnecessary file
  rm -f "${srcdir}/opt/brother/Printers/${_model}/inf/setupPrintcapij"
  rm -rf "${srcdir}/opt/brother/Printers/${_model}/lpd/i686"

  # install filter
  install -Dm755 "${srcdir}/opt/brother/Printers/${_model}/cupswrapper/brother_lpdwrapper_${_model}" \
    "${pkgdir}/opt/brother/Printers/${_model}/cupswrapper/brother_lpdwrapper_${_model}"
  install -d "${pkgdir}/usr/lib/cups/filter"
  ln -s "/opt/brother/Printers/${_model}/cupswrapper/brother_lpdwrapper_${_model}" \
    "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_dcpl3560cdw"

  # install model
  install -Dm644 "${srcdir}/opt/brother/Printers/${_model}/cupswrapper/brother_${_model}_printer_en.ppd" \
    "${pkgdir}/opt/brother/Printers/${_model}/cupswrapper/brother_${_model}_printer_en.ppd"
  install -d "${pkgdir}/usr/share/cups/model"
  ln -s "/opt/brother/Printers/${_model}/cupswrapper/brother_${_model}_printer_en.ppd" \
    "${pkgdir}/usr/share/cups/model/brother_${_model}_printer_en.ppd"

  # copy inf
  cp -r "${srcdir}/opt/brother/Printers/${_model}/inf" \
    "${pkgdir}/opt/brother/Printers/${_model}"

  # install ldp
  install -Dm755 "${srcdir}/opt/brother/Printers/${_model}/lpd/filter_${_model}" \
    "${pkgdir}/opt/brother/Printers/${_model}/lpd/filter_${_model}"

  # install binaries
  install -Dm755 -t "${pkgdir}/opt/brother/Printers/${_model}/lpd" \
    "${srcdir}/opt/brother/Printers/${_model}/lpd/${arch}/"*

  # install licenses
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/opt/brother/Printers/${_model}/"LICENSE_*
}
