# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=chatwithwork-desktop-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Chat with Work Desktop: the desktop app, terminal interface and background agent"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/chatwithwork-desktop"
license=('MIT OR Apache-2.0')
install="${pkgname}.install"
depends=('alsa-lib' 'libpipewire' 'glibc' 'gcc-libs' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'dbus')
optdepends=('org.freedesktop.secrets: store the device key in your keyring'
            'xdg-desktop-portal: native folder picker'
            'sane: scan with a USB scanner'
            'tesseract: make scans searchable (with tesseract-data-<language>)'
            'systemd: start the agent now and at login with cww daemon install')
provides=('cww' 'cww-app' 'chatwithwork-desktop')
conflicts=('cww' 'chatwithwork-desktop' 'chatwithwork-desktop-git')
options=('!debug' '!strip')
_repo="https://github.com/crmne/chatwithwork-desktop"
source_x86_64=("${_repo}/releases/download/v${pkgver}/cww-app-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/cww-app-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('21e9dbed0712d2309cb52bc7853f6e427adf32ee01a37c5db50013461058b2dd')
sha256sums_aarch64=('d7d2c29b8cd119995388efc7b86071d8d9404e902db8a4fba5123005c4c7c20c')

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
