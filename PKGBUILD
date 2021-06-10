# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=xcursor-lambda
pkgver=1.3
pkgrel=1
_ocsid=999496
_fileidx=1
_ocsid_black=999424
_fileidx_black=1
pkgdesc="Recreation of the perspective cursor theme with some changes and a black variant"
arch=('any')
url="https://www.pling.com/p/${_ocsid}/"
depends=('libxcursor')
makedepends=('libxml2')
options=('!debug')
# the acutal download URL changes occasionally, so we have to use the API to fetch it
source=("${pkgname}_dl.xml::https://api.kde-look.org/ocs/v1/content/download/${_ocsid}/${_fileidx}"
        "${pkgname}-black_dl.xml::https://api.kde-look.org/ocs/v1/content/download/${_ocsid_black}/${_fileidx_black}"
        "lambda.index.theme"
        "lambda-black.index.theme")
sha256sums=('SKIP'
            'SKIP'
            '06356d3e024295a514fbe3c51e4c9ab0ac45bca1ae2a78c875cb4a638b30890b'
            '1fa2aee2f4184f514af37ff4d18cb681c3ca524c360895bf9a2b3128d21b33de')

prepare() {
  echo -n ' '; msg "$(gettext "Retrieving sources...")"
  cd "${startdir}"
  _downloadlink=$(xmllint --xpath '//ocs/data/content[@details="download"]/downloadlink/text()' "${srcdir}/${pkgname}_dl.xml")
  _downloadlink_black=$(xmllint --xpath '//ocs/data/content[@details="download"]/downloadlink/text()' "${srcdir}/${pkgname}-black_dl.xml")
  _netfile="${pkgname}.tar.gz::${_downloadlink}"
  _netfile_black="${pkgname}-black.tar.gz::${_downloadlink_black}"
  download_file "${_netfile}"
  download_file "${_netfile_black}"

  echo -n ' '; msg "$(gettext "Validating %s files with %s...")" "source" "sha256sums"
  verify_integrity_one "${_netfile}" sha256 "01d4f40830d20173a69cb8bed0ea26435bce0570d4591a8281bccef870ee5737"
  verify_integrity_one "${_netfile_black}" sha256 "a12187b20c94923d303e799021d44e9cad095adb6b55bcc211baf488d5de0b55"

  echo -n ' '; msg "$(gettext "Extracting sources...")"
  cd "${srcdir}"
  extract_file "${_netfile}"
  extract_file "${_netfile_black}"
}

package() {
  install -d "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/Lambda" "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/Lambda-black" "${pkgdir}/usr/share/icons"
  install -Dm644 "${srcdir}/lambda.index.theme" "${pkgdir}/usr/share/icons/Lambda/index.theme"
  install -Dm644 "${srcdir}/lambda-black.index.theme" "${pkgdir}/usr/share/icons/Lambda-black/index.theme"
}
