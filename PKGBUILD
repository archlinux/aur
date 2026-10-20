# Maintainer: duanluan <duanluan@outlook.com>

pkgname=zcode
_pkgname=zcode
_appdir=ZCode
pkgver=3.16.2
pkgrel=1
pkgdesc='ZCode desktop app repackaged from official Linux release'
arch=('x86_64' 'aarch64')
url='https://zcode.z.ai/en'
license=('LicenseRef-Proprietary')
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
provides=("zcode-desktop-bin=${pkgver}")
options=('!strip' '!lto')
install="${pkgname}.install"
source=('zcode.desktop')
source_x86_64=("ZCode-${pkgver}-linux-x64.deb::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/linux-x64/ZCode-${pkgver}-linux-x64.deb")
source_aarch64=("ZCode-${pkgver}-linux-arm64.deb::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/linux-arm64/ZCode-${pkgver}-linux-arm64.deb")
noextract=("ZCode-${pkgver}-linux-x64.deb" "ZCode-${pkgver}-linux-arm64.deb")
sha256sums=('510fb413274334e05901d65b28df618b1fb7216d690c136ab55173f9bf1a75e6')
sha256sums_x86_64=('31ba7519cddd732dbb61f7c1e52ef6d26081d1b135fa93950dbc5d400c26abbc')
sha256sums_aarch64=('35bc72a8b9316703eca135f336e486a39740c9a3344423ead2e2038502c17cf0')

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

  install -Dm644 "${srcdir}/zcode.desktop" \
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
