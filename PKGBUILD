# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='storcli'
_name='STORCLI_SAS3.5_P'
pkgver='007.3103.0000.0000'
pkgrel='1'
_phase='32'
_prefix='univ_viva_cli_rel/Unified_storcli_all_os'
pkgdesc="CLI program for LSI MegaRAID cards"
url='https://www.broadcom.com/'
license=('custom')
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
source=("https://docs.broadcom.com/docs-and-downloads/host-bus-adapters/host-bus-adapters-common-files/sas_sata_nvme_12g_p${_phase}/${_name}${_phase}.zip"
	"https://docs.broadcom.com/docs-and-downloads/host-bus-adapters/host-bus-adapters-common-files/sas_sata_nvme_12g_p28/${_name}28.zip")
sha256sums=('3801ce29b3a2292b969d6fd1102df0ab0a69f3ed52cc2d528bce381db93b8887'
            'c15ef2d5b66f1d5988aa2bc318c49025f248d69058533e02a8f0acc86681cc85')

_archstr=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "Linux" || echo -n "ARM/Linux")
_filearch=$([[ "${CARCH}" == 'x86_64' ]] && echo -n "noarch" || echo -n "${CARCH}")

prepare() {
  mkdir "${pkgname}_${pkgver}" "${pkgname}_legacy"
  bsdtar -xf "${_name}${_phase}/${_prefix}/${_archstr}/${pkgname}-${pkgver}-1.${_filearch}.rpm" -C "${pkgname}_${pkgver}"
# The legacy is version of software for support 9305 controllers, after this version the support of this controller is absent
  bsdtar -xf "${_name}28/${_prefix}/${_archstr}/${pkgname}-007.2703.0000.0000-1.${_filearch}.rpm" -C "${pkgname}_legacy"
}

package() {
  install -Dm0755 "${pkgname}_${pkgver}/opt/MegaRAID/${pkgname}/${pkgname}64" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0755 "${pkgname}_legacy/opt/MegaRAID/${pkgname}/${pkgname}64" "${pkgdir}/usr/bin/${pkgname}-legacy"
  install -Dm0755 -d "${pkgdir}/opt/MegaRAID/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/opt/MegaRAID/${pkgname}/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/opt/MegaRAID/${pkgname}/${pkgname}64"

  install -Dm0644 "${_name}${_phase}/${_prefix}/ThirdPartyLicenseNotice.pdf" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
