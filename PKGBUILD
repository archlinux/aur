pkgname=codex-app-electron-port-bin
pkgver=2026.02.25
pkgrel=2
pkgdesc="Unofficial Electron-port repackaging of Codex desktop app from macOS DMG"
arch=('x86_64')
url="https://github.com/Tomakin/codex-app-electron-port-bin"
license=('custom')
options=('!strip')
depends=('electron' 'bash')
makedepends=('p7zip' 'asar')
optdepends=(
  'nodejs: runtime dependency for Codex CLI and native rebuild helper'
  'pnpm: needed for native module rebuild helper'
  'base-devel: needed for native module rebuild helper'
  'python: needed for native module rebuild helper'
  'sudo: allows native rebuild helper to update files under /opt'
)
install="${pkgname}.install"
source=(
  "Codex.dmg::https://persistent.oaistatic.com/codex-app-prod/Codex.dmg"
  "${pkgname}.sh"
  "${pkgname}-rebuild-native.sh"
  "${pkgname}.desktop"
  "${pkgname}.install"
  "${pkgname}.LICENSE"
)
noextract=('Codex.dmg')
sha256sums=(
  'SKIP'
  '17d9de91630379ca668fcfc97768fd3e24196b5e80f5ea1c5652c7f65d6919b4'
  '4f8046f265b15c285c1a9b0b58aea18d4c25c4dc3581908334c6dadd462f3a19'
  'd127bf3d7be45efc29269658dacc76ec95367c3e9f5b6058a65e3377af5dad8a'
  'f4adaa2f270a869dd2edf38efd62ea6c2a882db621460169b090b7cf466c505b'
  '3d03f0c1bcf7a4567574f1e890ad757e94c0fbcfdad12a3bdfc2b4a20789bf57'
)

_appdir="/opt/${pkgname}"

prepare() {
  cd "${srcdir}"

  rm -rf dmg_extracted app_asar

  msg2 "Extracting DMG"
  7z x "${srcdir}/Codex.dmg" "-odmg_extracted" >/dev/null

  local asar_path="${srcdir}/dmg_extracted/Codex Installer/Codex.app/Contents/Resources/app.asar"
  if [[ ! -f "${asar_path}" ]]; then
    echo "app.asar not found at expected path: ${asar_path}" >&2
    return 1
  fi

  msg2 "Extracting app.asar"
  asar extract "${asar_path}" "${srcdir}/app_asar"
}

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}${_appdir}"
  cp -a app_asar "${pkgdir}${_appdir}/"

  install -Dm755 "${srcdir}/${pkgname}.sh" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}-rebuild-native.sh" \
    "${pkgdir}/usr/bin/${pkgname}-rebuild-native"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
