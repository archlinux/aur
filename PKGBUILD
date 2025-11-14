# Maintainer: Emanuel Bennici <emanuel at l0nax dot org>

_model=mfcj4550dw
_device_name="MFC-J4550DW"

pkgname=brother-mfc-j4550dw
pkgver=3.6.1
pkgrel=1
pkgdesc="LPR and CUPS driver for Brother MFC-J4550DW"
url="https://www.brother.de/support/mfcj4550dw/downloads"
arch=('x86_64')
license=('EULA')

depends=('cups' 'perl')
optdepends=('brscan5: scanner support')

source=("https://download.brother.com/welcome/dlf107055/mfcj4550dwpdrv-${pkgver}-${pkgrel}.x86_64.rpm")

sha256sums=('db833b716238a217c585005f0cff7032db115149c41ce5989f3f34f5cfad139f')

package() {
  # Brother binaries hard-code /opt/brother in their paths; we must keep that.
  local SRC_PREFIX=/opt
  local PREFIX=/usr/share

  # Install the whole /opt/brother subtree
  install -d "${pkgdir}${SRC_PREFIX}"
  cp -r "${srcdir}${SRC_PREFIX}/brother" "${pkgdir}${SRC_PREFIX}"

  # /etc/printcap is managed by CUPS; remove Brother's helper
  find "${pkgdir}" -type f -name 'setupPrintcap*' -delete

  # --- CUPS integration ---

  # 1) PPD: expose it in the standard CUPS location
  local ppd_file="${SRC_PREFIX}/brother/Printers/${_model}/cupswrapper/brother_${_model}_printer_en.ppd"
  install -d "${pkgdir}${PREFIX}/cups/model/Brother"
  ln -s "${ppd_file}" "${pkgdir}${PREFIX}/cups/model/Brother/"

  # 2) Filter: the lpd wrapper script that CUPS will call
  local lpdwrapper="${SRC_PREFIX}/brother/Printers/${_model}/cupswrapper/brother_lpdwrapper_${_model}"
  chmod +x "${pkgdir}${lpdwrapper}"
  install -d "${pkgdir}/usr/lib/cups/filter"
  ln -s "${lpdwrapper}" "${pkgdir}/usr/lib/cups/filter/"

  # --- Architecture-specific binaries under lpd/ ---

  # Brother ships the real filter and config helper under lpd/x86_64/
  # We symlink them into lpd/ so the wrapper can find them generically.
  ln -s "${SRC_PREFIX}/brother/Printers/${_model}/lpd/${CARCH}/br${_model}filter" \
    "${pkgdir}${SRC_PREFIX}/brother/Printers/${_model}/lpd/"
  ln -s "${SRC_PREFIX}/brother/Printers/${_model}/lpd/${CARCH}/brprintconf_${_model}" \
    "${pkgdir}${SRC_PREFIX}/brother/Printers/${_model}/lpd/"

  # Convenience frontend for brprintconf in $PATH
  install -d "${pkgdir}/usr/bin"
  ln -s "${SRC_PREFIX}/brother/Printers/${_model}/lpd/brprintconf_${_model}" \
    "${pkgdir}/usr/bin/brprintconf_${_model}"

  # --- License ---

  # Install Brother's license in the standard license dir
  install -Dm644 "${srcdir}${SRC_PREFIX}/brother/Printers/${_model}/LICENSE_ENG.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_ENG.txt"
}
