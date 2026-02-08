pkgname=codex-monitor-bin
pkgver=0.7.45
pkgrel=1
pkgdesc="Tauri desktop app for orchestrating Codex agents across local workspaces (prebuilt AppImage)"
arch=('x86_64' 'aarch64')
url="https://github.com/Dimillian/CodexMonitor"
license=('MIT')
depends=('hicolor-icon-theme')
optdepends=(
  'codex: Codex app-server binary'
  'gh: GitHub issues + PR integration'
)
provides=('codex-monitor')
conflicts=('codex-monitor' 'codex-monitor-git')
options=(!strip)

source=(
  'codex-monitor.desktop'
  "codex-monitor.png::https://raw.githubusercontent.com/Dimillian/CodexMonitor/v${pkgver}/src-tauri/icons/icon.png"
  "LICENSE::https://raw.githubusercontent.com/Dimillian/CodexMonitor/v${pkgver}/LICENSE"
)
source_x86_64=(
  "Codex.Monitor_${pkgver}_amd64.AppImage::https://github.com/Dimillian/CodexMonitor/releases/download/v${pkgver}/Codex.Monitor_${pkgver}_amd64.AppImage"
)
source_aarch64=(
  "Codex.Monitor_${pkgver}_aarch64.AppImage::https://github.com/Dimillian/CodexMonitor/releases/download/v${pkgver}/Codex.Monitor_${pkgver}_aarch64.AppImage"
)
sha256sums=(
  'a57166e03775a7e875c7f79f89635083b38e0deacae46861297e9ac269b33b4b'
  '2599b7b0fc3313a35af2dbc4cff530f6b545c18da4622161552ae5c0839fafca'
  'df17aae89ce4705d0a6e5f7b46eeea3b9023967ecad948f8779b47039eb55a8b'
)
sha256sums_x86_64=(
  'f3233f612ef8783c04662608838d62f680898b3446bf26827392d36517610a47'
)
sha256sums_aarch64=(
  '3fbe7da8759f5dfd4c99d437db8f03f95f1708d7add3d33476d2bd98e5aa042d'
)

package() {
  local _appimage
  case "$CARCH" in
    x86_64)
      _appimage="Codex.Monitor_${pkgver}_amd64.AppImage"
      ;;
    aarch64)
      _appimage="Codex.Monitor_${pkgver}_aarch64.AppImage"
      ;;
    *)
      printf 'Unsupported architecture: %s\n' "$CARCH" >&2
      return 1
      ;;
  esac

  chmod +x "${srcdir}/${_appimage}"
  (
    cd "${srcdir}"
    "./${_appimage}" --appimage-extract >/dev/null
  )

  install -dm755 "${pkgdir}/opt/codex-monitor"
  cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/codex-monitor/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/codex-monitor" <<'EOF'
#!/bin/sh
exec /opt/codex-monitor/AppRun "$@"
EOF

  install -Dm644 "${srcdir}/codex-monitor.desktop" \
    "${pkgdir}/usr/share/applications/codex-monitor.desktop"
  install -Dm644 "${srcdir}/codex-monitor.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/codex-monitor.png"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
