# Maintainer: yurzhang <yurzhang at 163 dot com>

pkgname=cch
_pkgname="CodeForces Contest Helper v2"
pkgver=2.0BETA37
pkgrel=1
pkgdesc="A powerful contest helper for CodeForces, developed by NW.js"

arch=(x86_64 i686)
url="https://github.com/CodeforcesContestHelper/CCHv2"
license=(GPL3)
depends=(
  "libxrandr"
  "nss"
  "libxkbcommon"
  "libcups"
  "at-spi2-core"
  "libxcomposite"
  "pango"
  "mesa"
  "alsa-lib"
)

options=('!strip')
install="${pkgname}.install"

_orgname="CodeforcesContestHelper"
_pkgver="v2.0-beta-37"
source_x86_64=(https://github.com/${_orgname}/CCHv2/releases/download/${_pkgver}/CCHv2.${_pkgver}.linux64.tar.gz)
source_i686=(https://github.com/${_orgname}/CCHv2/releases/download/${_pkgver}/CCHv2.${_pkgver}.linux32.tar.gz)
sha256sums_x86_64=('9b7efacea92736d7797d0da1d502dd976b1b5c442a429bc64bce829367dfaa9d')
sha256sums_i686=('48cc8d4cd85ad8d695bba3fde24fc16b82ad2ff65de64fb6e81b5c9c9b45c7b2')

package() {
  _arch=linux64
  if [ "${CARCH}" = "i686" ]; then
    _arch=linux32
  fi

  # create directories
  for dir in lib locales pnacl
  do
    install -d "${pkgdir}/opt/${pkgname}/${dir}"
  done

  # install ./lib
  install -m755 "${srcdir}/build/${_pkgname}/${_arch}/lib/"* "${pkgdir}/opt/${pkgname}/lib"
  install -m644 "${srcdir}/build/${_pkgname}/${_arch}/lib/vk_swiftshader_icd.json" "${pkgdir}/opt/${pkgname}/lib"

  # install ./locales
  install -m644 "${srcdir}/build/${_pkgname}/${_arch}/locales/"* "${pkgdir}/opt/${pkgname}/locales"

  # install ./pnacl
  install -m644 "${srcdir}/build/${_pkgname}/${_arch}/pnacl/"* "${pkgdir}/opt/${pkgname}/pnacl"
  install -m755 "${srcdir}/build/${_pkgname}/${_arch}/pnacl/"*"_nexe" "${pkgdir}/opt/${pkgname}/pnacl"

  # install .
  install -m755 "${srcdir}/build/${_pkgname}/${_arch}/${_pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

  for file in chrome_crashpad_handler chromedriver minidump_stackwalk nacl_helper nacl_helper_bootstrap nacl_irt_x86_64.nexe nwjc
  do
    install -m755 -t "${pkgdir}/opt/${pkgname}" "${srcdir}/build/${_pkgname}/${_arch}/${file}"
  done

  for file in credits.html icudtl.dat nw_100_percent.pak nw_200_percent.pak resources.pak v8_context_snapshot.bin
  do
    install -m644 -t "${pkgdir}/opt/${pkgname}" "${srcdir}/build/${_pkgname}/${_arch}/${file}"
  done
}
