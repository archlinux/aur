# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="m8c"
pkgname="${_pkgname}-bin"
pkgver=2.2.0+323
_pkgver_tag="${pkgver%+*}"
_pkgver_build="${pkgver##*+}"
pkgrel=1
pkgdesc="A UI for the M8 and M8 Headless portable music DAWs"
arch=('x86_64')
url="https://github.com/laamaa/${_pkgname}"
license=('MIT')
depends=(
  'glibc'
  'libserialport'
  'sdl3'
)
makedepends=(
  'gendesk'
  'patchelf'
)
provides=(
  "${_pkgname}=${_pkgver_tag}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgname}-${_pkgver_tag}-AUDIOGUIDE.md::${url}/raw/refs/tags/v${_pkgver_tag}/AUDIOGUIDE.md"
        "${_pkgname}-${_pkgver_tag}-README.md::${url}/raw/refs/tags/v${_pkgver_tag}/README.md"
        "${_pkgname}-${_pkgver_tag}-LICENSE::${url}/raw/refs/tags/v${_pkgver_tag}/LICENSE")
source_x86_64=("${_pkgname}-${_pkgver_tag}-x86_64.AppImage.zip::${url}/releases/download/v${_pkgver_tag}/${_pkgname}-v${_pkgver_tag}-linux-x86_64.AppImage.zip")
sha256sums=('f30c3ff6bcf5e230375664dc6286bd39a3e66c925975ba9e0ddbc366c0ec6652'
            '3fdbc136a178a9f2bf5a57f13994b17d080d5a1eee31d360ccf981e89ef64187'
            '5c62289a8358388d0e7e459e8ece240c9b3c4af5915539c60e0fe65c76bac6b8')
sha256sums_x86_64=('e18b40b58df7ee000f815493b64eafa2a25d083febf8b8445fe2e6426af0e6c8')

pkgver() {
  local filename build_number
  filename="$(bsdtar -tf "${_pkgname}-${_pkgver_tag}-${CARCH}.AppImage.zip" | grep -E '^m8c-.*-x86_64\.AppImage$')"
  build_number="$(echo "${filename}" | sed -E 's/^m8c-(.*)-x86_64\.AppImage$/\1/')"
  printf '%s+%s' "${_pkgver_tag}" "${build_number}"
}

build() {
  cd "${srcdir}"
  gendesk -f -n \
    --pkgname "${_pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --categories 'Audio'

  chmod +x "${_pkgname}-${_pkgver_build}-${CARCH}.AppImage"
  ./"${_pkgname}-${_pkgver_build}-${CARCH}.AppImage" --appimage-extract > /dev/null
  rm -rf "${_pkgsrc}-${CARCH}"
  mv -f "squashfs-root" "${_pkgsrc}-${CARCH}"

  cd "${_pkgsrc}-${CARCH}/usr/bin"
  patchelf --remove-rpath "${_pkgname}"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -vDm644 "${_pkgname}-${_pkgver_tag}-AUDIOGUIDE.md" "${pkgdir}/usr/share/doc/${_pkgname}/AUDIOGUIDE.md"
  install -vDm644 "${_pkgname}-${_pkgver_tag}-README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgname}-${_pkgver_tag}-LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgsrc}-${CARCH}"
  install -vDm644 "gamecontrollerdb.txt" "${pkgdir}/usr/lib/${_pkgname}/gamecontrollerdb.txt"
  install -vDm644 "icon.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"

  cd "usr/bin"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"

  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
