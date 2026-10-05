# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=chatwithwork-local-agent-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Chat with Work: desktop app, terminal interface and local background agent"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/chatwithwork-local-agent"
license=('MIT OR Apache-2.0')
install="${pkgname}.install"
depends=('glibc' 'gcc-libs' 'libglvnd' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libxkbcommon' 'libxkbcommon-x11' 'wayland')
optdepends=('org.freedesktop.secrets: store the device key in your keyring'
            'xdg-desktop-portal: native folder picker'
            'systemd: start the agent now and at login with cww daemon install')
provides=('cww' 'cww-app' 'chatwithwork-local-agent')
conflicts=('cww' 'chatwithwork-local-agent' 'chatwithwork-local-agent-git')
options=('!debug' '!strip')
_repo="https://github.com/crmne/chatwithwork-local-agent"
source_x86_64=("${_repo}/releases/download/v${pkgver}/cww-app-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/cww-app-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9aeaaf01c23a1f7443df353e3bf34a40b69f6f1b0cc275e9038924cc53e38813')
sha256sums_aarch64=('7090938f18e7312566d1fdb90f95e31d8a7692aaeae6e713e667766fa0369279')

package() {
  local target
  case "$CARCH" in
    x86_64) target="x86_64-unknown-linux-gnu" ;;
    aarch64) target="aarch64-unknown-linux-gnu" ;;
  esac
  local dir="${srcdir}/cww-app-v${pkgver}-${target}"
  install -Dm755 "${dir}/cww" "${pkgdir}/usr/bin/cww"
  install -Dm755 "${dir}/cww-app" "${pkgdir}/usr/bin/cww-app"
  install -Dm644 "${dir}/cww-app.desktop" "${pkgdir}/usr/share/applications/cww-app.desktop"
  install -Dm644 "${dir}/cww-app.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cww-app.svg"
  install -Dm644 "${dir}/packaging/systemd/cww.service" "${pkgdir}/usr/lib/systemd/user/cww.service"
  install -Dm644 "${dir}/README.md" "${dir}/PROTOCOL.md" "${dir}/SECURITY.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "${dir}/LICENSE-MIT" "${dir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
