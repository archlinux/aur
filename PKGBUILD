# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=spotifast-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Native Spotify client"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/spotifast"
license=('MIT')
install="${pkgname}.install"
# alsa-lib and libpulse are linked directly; the rest are dlopened by winit
# and glutin at startup, and this is a GUI-only application, so all of them
# have to be there for it to run at all.
depends=('dbus' 'alsa-lib' 'libpulse' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11')
optdepends=('libxkbcommon-x11: keyboard handling in X11 sessions'
            'pipewire-pulse: PipeWire as the PulseAudio server')
provides=("spotifast=$pkgver")
conflicts=('spotifast' 'spotifast-git')
options=('!debug' '!strip')
_repo="https://github.com/crmne/spotifast"
source_x86_64=("${_repo}/releases/download/v${pkgver}/spotifast-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/spotifast-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('54ad7d1137ab4ec76177298fb226dbfc63999e74dc1d7fd9248dda0009c995b7')
sha256sums_aarch64=('84f926636c960213b4020cac24fe1746ccf52f071f58caf7851d1d67eb5ca855')

package() {
  local target
  case "$CARCH" in
    x86_64) target="x86_64-unknown-linux-gnu" ;;
    aarch64) target="aarch64-unknown-linux-gnu" ;;
  esac
  local dir="${srcdir}/spotifast-v${pkgver}-${target}"

  install -Dm755 "${dir}/spotifast" "${pkgdir}/usr/bin/spotifast"
  install -Dm644 "${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${dir}/packaging/applications/spotifast.desktop" \
    "${pkgdir}/usr/share/applications/spotifast.desktop"
  install -Dm644 "${dir}/packaging/icons/spotifast.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/spotifast.svg"
  # Older release fixtures predate the optional integration.
  if [[ -d "${dir}/contrib/omarchy" ]]; then
    install -Dm644 "${dir}/contrib/omarchy/spotifast.json.tpl" "${pkgdir}/usr/share/spotifast/omarchy/spotifast.json.tpl"
    install -Dm755 "${dir}/contrib/omarchy/spotifast-theme" "${pkgdir}/usr/share/spotifast/omarchy/spotifast-theme"
  fi
}
