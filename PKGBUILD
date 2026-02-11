# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='arcconf'
_pkgname='Arcconf'
_pkgrel='28200'
pkgver="5.05.00.${_pkgrel}"
_rpmver="5.05-${_pkgrel}"
pkgrel='1'
pkgdesc='Microsemi Adaptec command line interface utility'
arch=('x86_64' 'aarch64')
makedepends=('libarchive')
url='https://microchip.com/en-us/adaptec'
license=('custom')
source=("${pkgname}_B${_pkgrel}.zip::https://microchip.com/bin/mchp/downloadeuladocument.json?path=%2FaemDocuments%2Fdocuments%2Fadaptec%2Fsoftware%2F${pkgname}_B${_pkgrel}.zip"
	"${pkgname}_v3_07_23980.zip::https://microchip.com/bin/mchp/downloadeuladocument.json?path=%2FaemDocuments%2Fdocuments%2Fadaptec%2Fsoftware%2F${pkgname}_v3_07_23980.zip")
sha256sums=('c39cedc54a53f7acaf9483004c1a4319c9722a9029be229a3d6dc6293a97e817'
            '7041ff8dad06dfb1ef3559af60227ac9f864183bbaf0dcbbe0c148293868b873')
noextract=("${source[@]##*/}")

_current_str="${pkgname}_${_pkgrel}"
_legacy_str="${pkgname}_legacy"
_archstr="$([[ "${CARCH}" == 'x86_64' ]] && \
  echo -n "${_current_str}_src/linux_x64/rpm" || \
  echo -n "${_current_str}_src/linuxarm_x64/rpm")"
# The legacy is version of software for HBA1000 Adaptec controlles and older (the 'aacraid' linux driver)
# The 'current' version support HBA1100 Microsemi controllers and higher (the 'smartpqi' linux driver)
_archstr_legacy="$([[ "${CARCH}" == 'x86_64' ]] && \
  echo -n "${_legacy_str}_src/linux_64/rpm" || \
  echo -n "${_legacy_str}_src/linux_64/arm/linuxarm_x64/rpm")"

prepare() {
  mkdir "${_current_str}_src" "${_legacy_str}_src" "${_current_str}" "${_legacy_str}"
  bsdtar xf "${pkgname}_B${_pkgrel}.zip" -C "${_current_str}_src"
  bsdtar xf "${pkgname}_v3_07_23980.zip" -C "${_legacy_str}_src"

  bsdtar xf "${_archstr}/${_pkgname}-${_rpmver}.${CARCH}.rpm" -C "${_current_str}"
  bsdtar xf "${_archstr_legacy}/${_pkgname}-3.07-23980.${CARCH}.rpm" -C "${_legacy_str}"
}

package() {
  install -Dm0755 "${_current_str}/usr/${_pkgname}/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm0644 "${_current_str}/usr/${_pkgname}/License.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm0755 "${_legacy_str}/usr/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}-legacy"
}
