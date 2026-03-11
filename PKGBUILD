pkgname=codex-monitor-bin
pkgver=0.7.62
pkgrel=1
pkgdesc="Tauri desktop app for orchestrating Codex agents across local workspaces (prebuilt RPM)"
arch=('x86_64' 'aarch64')
url="https://github.com/Dimillian/CodexMonitor"
license=('MIT')
depends=(
  'gtk3'
  'hicolor-icon-theme'
  'webkit2gtk-4.1'
)
optdepends=(
  'codex: Codex app-server binary'
  'gh: GitHub issues + PR integration'
)
provides=('codex-monitor')
conflicts=('codex-monitor' 'codex-monitor-git')
options=(!strip)

source=(
  'codex-monitor.desktop'
  "LICENSE::https://raw.githubusercontent.com/Dimillian/CodexMonitor/v${pkgver}/LICENSE"
)
source_x86_64=(
  "Codex.Monitor-${pkgver}-1.x86_64.rpm::https://github.com/Dimillian/CodexMonitor/releases/download/v${pkgver}/Codex.Monitor-${pkgver}-1.x86_64.rpm"
)
source_aarch64=(
  "Codex.Monitor-${pkgver}-1.aarch64.rpm::https://github.com/Dimillian/CodexMonitor/releases/download/v${pkgver}/Codex.Monitor-${pkgver}-1.aarch64.rpm"
)
sha256sums=('a57166e03775a7e875c7f79f89635083b38e0deacae46861297e9ac269b33b4b'
            'df17aae89ce4705d0a6e5f7b46eeea3b9023967ecad948f8779b47039eb55a8b')
sha256sums_x86_64=('a7fba93dcbc403bc725e804e028d93381407bdfecadf78afe93cb2271a9d7262')
sha256sums_aarch64=('2bbab4d90d887928b49ecedb9c30fd6b0c3adf7bd62df264ac70155720065eca')

package() {
  local _rpm
  case "$CARCH" in
    x86_64)
      _rpm="Codex.Monitor-${pkgver}-1.x86_64.rpm"
      ;;
    aarch64)
      _rpm="Codex.Monitor-${pkgver}-1.aarch64.rpm"
      ;;
    *)
      printf 'Unsupported architecture: %s\n' "$CARCH" >&2
      return 1
      ;;
  esac

  bsdtar -xpf "${srcdir}/${_rpm}" -C "${pkgdir}"

  rm -f "${pkgdir}/usr/share/applications/Codex Monitor.desktop"
  install -Dm644 "${srcdir}/codex-monitor.desktop" \
    "${pkgdir}/usr/share/applications/codex-monitor.desktop"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
