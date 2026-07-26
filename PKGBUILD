# Maintainer: duanluan <duanluan@outlook.com>

pkgname=zcode-desktop-bin
_pkgname=zcode
_appdir=ZCode
pkgver=3.5.2
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
sha256sums_x86_64=('00c2b3b83fb3c99dcd98d2db78f45bb3dedbc4d415c19874f5d982bc503b5ee1')
sha256sums_aarch64=('a478cdcd7924e550c799fe6a3f89cc1ae0559be5df6d5f732292266ff2771e24')

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
