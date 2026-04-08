# Maintainer: ArtieRando
pkgname=powershield-bin
_pkgname=powershield
_pkgname_old=upsmon
pkgver=7.1.1
# _pkgver_armv7h=5.3.0
_urlver='800/1800'
# _urlver_armv7h='402/1402'
pkgrel=1
pkgdesc="UPS Management Software (upsmon) by RPS S.p.a. (Riello-ups)."
arch=(
  'x86_64'
  # 'armv7h'
)
url="https://www.riello-ups.com/downloads/1-powershield-free"
license=('custom')
provides=('powershield' 'upsmon')
conflicts=('upsmon')
depends=(
  'glibc'
  'openssl-1.1'
  'qt5-base'
)
install="${_pkgname}.install"
source=(
  'powershield.service'
  '62-powershield.rules'
)
source_x86_64=("${_pkgname}-${pkgver}-x64.deb::https://www.riello-ups.com/uploads/file/${_urlver}/${_pkgname}-${pkgver}-linux-4.19-amd64.deb")
# source_armv7h=("${_pkgname_old}-${_pkgver_armv7h}-armhf.deb::https://www.riello-ups.com/uploads/file/${_urlver_armv7h}/${_pkgname_old}-${_pkgver_armv7h}-linux-3.12-armhf.deb")
sha256sums=(
  '75f108c800b95120170da18c242730aed0297df039792c7912e184cd9bf21194'
  '2557ebee0ee18bc51444e802bd0ed08f75028c9aa8471af61b9b37609dfa020e'
)
sha256sums_x86_64=('74adbe174f661a756fac220589ee630d712895252d63dfaa1bae31d49b16f669')
# sha256sums_armv7h=('5294041cfae681dc7f3b40b8a21a2ca336a5aadb6f7800dd83d861390f578b43')

backup=(
  "opt/${_pkgname_old}/jobs.ini"
  "opt/${_pkgname_old}/jobsMDU.ini"
  "opt/${_pkgname_old}/jobsMPW.ini"
  "opt/${_pkgname_old}/jobsSTS.ini"
  "opt/${_pkgname_old}/modular.ini"
  "opt/${_pkgname_old}/sensor.ini"
  "opt/${_pkgname_old}/upsmon.ini"
)

package() {
  echo "  -> Extracting the data.tar.xz..."
  cd "${srcdir:?}" \
    && bsdtar -xf data.tar.xz -C "${pkgdir:?}"

  # Delete deprecated files
  rm -rf "${pkgdir:?}/usr/"
  rm "${pkgdir}/opt/upsmon/upsstart"
  rm "${pkgdir}/opt/upsmon/upsstop"
  rm "${pkgdir}/opt/upsmon/upsrestart"
  rm "${pkgdir}/opt/upsmon/wUpsSetup.scr"
  rm "${pkgdir}/opt/upsmon/wUpsWizard.scr"

  # Fix library dependencies
  ln -s /usr/lib/libssl.so.1.1 "${pkgdir}/opt/upsmon/libssl.so.1.1"
  ln -s /usr/lib/libcrypto.so.1.1 "${pkgdir}/opt/upsmon/libcrypto.so.1.1"
  install -Dm0755 "${pkgdir}/opt/upsmon/lib/librpswidgets.so.1" "${pkgdir}/usr/lib/librpswidgets.so.1"
  rm -rf "${pkgdir}/opt/upsmon/lib/"

  # Service
  install -Dm0644 powershield.service "${pkgdir}/usr/lib/systemd/system/powershield.service"

  # Udev rule
  install -Dm0644 62-powershield.rules "${pkgdir}/usr/lib/udev/rules.d/62-powershield.rules"

  # Create sample UPS device
  printf '%b\n' '' \
    '[UPS_00]' \
    'Name="Riello UPS"' \
    'Type="GPSER11201XX"' \
    'Port="/dev/powershield"' \
    'SystemShutdown=1' \
    'SystemShutDelayAllow=1' \
    'SystemShutLeadAllow=1' \
    'SystemShutdownDelay=5' \
    'SystemShutdownLead=5' \
    'UPSShutdown=1' \
    'UPSShutdownDelay=5' \
    'UPSReboot=1' >> "${pkgdir}/opt/upsmon/upsmon.ini"

  # License
  install -dm0755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -sf "/opt/${_pkgname_old}/License.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
