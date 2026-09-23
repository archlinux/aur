# Maintainer: duanluan <duanluan@outlook.com>

pkgname=mimo-desktop
_pkgname=mimo-desktop
_appdir='Xiaomi MiMo'
pkgver=26.909.91205
pkgrel=1
pkgdesc='Xiaomi MiMo desktop client with the built-in AI coding assistant (official Linux release)'
arch=('x86_64')
url='https://mimo.xiaomimimo.com/desktop/'
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
makedepends=('libarchive')
options=('!strip' '!lto')
source_x86_64=("XiaomiMiMo-${pkgver}-x64.deb::https://mimocode-cdn.xiaomimimo.com/mimocode/mimodesktop/XiaomiMiMo-${pkgver}-x64.deb")
noextract=("XiaomiMiMo-${pkgver}-x64.deb")
sha256sums_x86_64=('00ad0c37f83dbe4118bf2b8f4c3fa9208b1b3af9519bf7b21bab053088058ff7')

package() {
  local _extractdir
  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  bsdtar -C "${_extractdir}" -xf "${srcdir}/XiaomiMiMo-${pkgver}-x64.deb"
  bsdtar -C "${_extractdir}" -xf "${_extractdir}/data.tar.xz"

  install -dm755 \
    "${pkgdir}/opt" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share"

  cp -a "${_extractdir}/opt/${_appdir}" "${pkgdir}/opt/"
  cp -a "${_extractdir}/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${_extractdir}/usr/share/applications/xiaomi-mimo.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i 's|^Exec=.*|Exec=mimo-desktop %U|' \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  ln -s "/opt/${_appdir}/xiaomi-mimo-desktop" "${pkgdir}/usr/bin/${_pkgname}"
  chmod 0755 "${pkgdir}/opt/${_appdir}/chrome-sandbox"

  install -Dm644 "${_extractdir}/opt/${_appdir}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${_extractdir}/opt/${_appdir}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  if [[ -f "${_extractdir}/usr/share/doc/xiaomi-mimo-desktop/changelog.gz" ]]; then
    install -Dm644 "${_extractdir}/usr/share/doc/xiaomi-mimo-desktop/changelog.gz" \
      "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"
  fi
}
