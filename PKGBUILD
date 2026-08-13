# Maintainer: duanluan <duanluan@outlook.com>

pkgname=zcode-desktop-bin
_pkgname=zcode
_appdir=ZCode
pkgver=3.7.6
pkgrel=1
pkgdesc='ZCode desktop app repackaged from official Linux release'
arch=('x86_64' 'aarch64')
url='https://zcode.z.ai/en'
license=('custom')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'hicolor-icon-theme'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: system tray indicator support'
)
makedepends=('libarchive')
provides=('zcode')
conflicts=('zcode')
options=('!strip' '!lto')
install="${pkgname}.install"
source_x86_64=("ZCode-${pkgver}-linux-x64.deb::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/linux-x64/ZCode-${pkgver}-linux-x64.deb")
source_aarch64=("ZCode-${pkgver}-linux-arm64.deb::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/linux-arm64/ZCode-${pkgver}-linux-arm64.deb")
noextract=("ZCode-${pkgver}-linux-x64.deb" "ZCode-${pkgver}-linux-arm64.deb")
sha256sums_x86_64=('7b960c18bdf87a799795dea3ce372e945df65414b164d9b7a41136bb5029eb86')
sha256sums_aarch64=('d853d961827ee08bc329be9a11769b4eb4ff19b16cd1cf8ce601ad80a3dda02c')

package() {
  local _extractdir _deb_arch

  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT
  case "${CARCH}" in
    x86_64) _deb_arch='x64' ;;
    aarch64) _deb_arch='arm64' ;;
  esac

  bsdtar -C "${_extractdir}" -xf "${srcdir}/ZCode-${pkgver}-linux-${_deb_arch}.deb"
  bsdtar -C "${_extractdir}" -xf "${_extractdir}/data.tar.xz"

  install -dm755 \
    "${pkgdir}/opt" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share"

  cp -a "${_extractdir}/opt/${_appdir}" "${pkgdir}/opt/"
  cp -a "${_extractdir}/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${_extractdir}/usr/share/applications/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  ln -s "/opt/${_appdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  chmod 0755 "${pkgdir}/opt/${_appdir}/chrome-sandbox"

  install -Dm644 "${_extractdir}/opt/${_appdir}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${_extractdir}/opt/${_appdir}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  if [[ -f "${_extractdir}/usr/share/doc/${_pkgname}/changelog.gz" ]]; then
    install -Dm644 "${_extractdir}/usr/share/doc/${_pkgname}/changelog.gz" \
      "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"
  fi
}
