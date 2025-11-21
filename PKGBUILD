# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>

_model='HLL1230W'

pkgname=brother-hl-l1230w
pkgver=4.4.0
pkgrel=1
pkgdesc='LPR and CUPS driver for the Brother HL-L1230W'
arch=('x86_64')
url='https://support.brother.com/g/b/producttop.aspx?c=as_ot&lang=en&prod=hll1230w_eu_as'
license=('custom:Brother commercial license')
depends=(
  'cups'
  'ghostscript'
)
source=("https://download.brother.com/welcome/dlf106421/hll1230wpdrv-${pkgver}-1.${CARCH}.rpm")
sha256sums=('ae0ef9f1f720f7822b377b1a9b9677c840db54c98329f744756d49a4a4f461ad')

package() {
  # Use "/usr/share" instead of "/opt"
  install -d "${pkgdir}/usr/share"
  cp -R "${srcdir}/opt/brother" "${pkgdir}/usr/share"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "${pkgdir}/usr/share/brother/Printers/${_model}/cupswrapper/lpdwrapper"
  sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "${pkgdir}/usr/share/brother/Printers/${_model}/lpd/lpdfilter"

  # "/etc/printcap" is managed by cups
  find "${pkgdir}" -type f -name 'setupPrintcap*' -delete

  # Symlink for lpdwrapper so it correctly figures out the printer model from the path
  install -d "${pkgdir}/usr/lib/cups/filter/"
  ln -s "/usr/share/brother/Printers/${_model}/cupswrapper/lpdwrapper" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_${_model}"

  # Symlink for the PPD
  install -d "${pkgdir}/usr/share/cups/model/"
  ln -s "/usr/share/brother/Printers/${_model}/cupswrapper/brother-${_model}-cups-en.ppd" "${pkgdir}/usr/share/cups/model/"

  ln -s "/usr/share/brother/Printers/${_model}/lpd/${CARCH}/brprintconflsr3" "${pkgdir}/usr/share/brother/Printers/${_model}/lpd/"
  ln -s "/usr/share/brother/Printers/${_model}/lpd/${CARCH}/rawtobr3" "${pkgdir}/usr/share/brother/Printers/${_model}/lpd/"
}

