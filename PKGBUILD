# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=chatwithwork-desktop-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Chat with Work Desktop: the desktop app, terminal interface and background agent"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/chatwithwork-desktop"
license=('GPL-3.0-only')
install="${pkgname}.install"
depends=('alsa-lib' 'libpipewire' 'glibc' 'gcc-libs' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'dbus' 'bubblewrap' 'slirp4netns' 'util-linux' 'iptables-nft')
optdepends=('org.freedesktop.secrets: store the device key in your keyring'
            'xdg-desktop-portal: native folder picker'
            'sane: scan with a USB scanner'
            'cups: print with your printers'
            'tesseract: make scans searchable (with tesseract-data-<language>)'
            'systemd: start the agent now and at login with cww daemon install')
provides=('cww' 'cww-app' 'chatwithwork-desktop')
conflicts=('cww' 'chatwithwork-desktop' 'chatwithwork-desktop-git')
options=('!debug' '!strip')
_repo="https://github.com/crmne/chatwithwork-desktop"
source_x86_64=("${_repo}/releases/download/v${pkgver}/cww-app-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/cww-app-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6c6219f81bd941d546ee82a7921bb8a51410e33b23a5c268b582c39c42abea45')
sha256sums_aarch64=('ca1018292abec4dd319ccee908f9249808558d860c78ef692c1ae6411953be57')

package() {
  local target
  case "$CARCH" in
    x86_64) target="x86_64-unknown-linux-gnu" ;;
    aarch64) target="aarch64-unknown-linux-gnu" ;;
  esac
  local dir="${srcdir}/cww-app-v${pkgver}-${target}"
  install -dm755 "${pkgdir}/usr/lib/chatwithwork"
  cp -R "${dir}/browser-engine" "${pkgdir}/usr/lib/chatwithwork/"
  install -Dm755 "${dir}/cww" "${pkgdir}/usr/bin/cww"
  install -Dm755 "${dir}/cww-app" "${pkgdir}/usr/bin/cww-app"
  install -Dm644 "${dir}/cww-app.desktop" "${pkgdir}/usr/share/applications/cww-app.desktop"
  install -Dm644 "${dir}/cww-app.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cww-app.svg"
  install -Dm644 "${dir}/packaging/systemd/cww.service" "${pkgdir}/usr/lib/systemd/user/cww.service"
  install -Dm644 "${dir}/README.md" "${dir}/PROTOCOL.md" "${dir}/SECURITY.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "${dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
