# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=spotifast-bin
pkgver=0.9.0
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
provides=("spotifast=$pkgver" "fastpotify=$pkgver" "fastpotify-bin=$pkgver")
conflicts=('fastpotify' 'fastpotify-bin' 'fastpotify-git' 'spotifast' 'spotifast-git')
replaces=('fastpotify-bin')
options=('!debug' '!strip')
_repo="https://github.com/crmne/spotifast"
source_x86_64=("${_repo}/releases/download/v${pkgver}/spotifast-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/spotifast-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('137f79127b5209ca33684810d8c65347db2cbd915896a8ee6b44092cca04a1e9')
sha256sums_aarch64=('0c3bc9c5b68bf3324a57854497166bf2c15720136be3f4e467166b233ea24466')

package() {
  local target
  case "$CARCH" in
    x86_64) target="x86_64-unknown-linux-gnu" ;;
    aarch64) target="aarch64-unknown-linux-gnu" ;;
  esac
  local dir="${srcdir}/fastpotify-v${pkgver}-${target}"

  install -Dm755 "${dir}/fastpotify" "${pkgdir}/usr/bin/fastpotify"
  ln -s fastpotify "${pkgdir}/usr/bin/spotifast"
  install -Dm644 "${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # Historical releases retain their matching launcher/window identity.
  local desktop=spotifast
  if [[ ! -f "${dir}/packaging/applications/spotifast.desktop" ]]; then
    desktop=fastpotify
  fi
  install -Dm644 "${dir}/packaging/applications/${desktop}.desktop" \
    "${pkgdir}/usr/share/applications/${desktop}.desktop"
  install -Dm644 "${dir}/packaging/icons/${desktop}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${desktop}.svg"
  # Older release fixtures predate the optional integration.
  if [[ -d "${dir}/contrib/omarchy" ]]; then
    install -Dm644 "${dir}/contrib/omarchy/spotifast.json.tpl" "${pkgdir}/usr/share/spotifast/omarchy/spotifast.json.tpl"
    install -Dm755 "${dir}/contrib/omarchy/spotifast-theme" "${pkgdir}/usr/share/spotifast/omarchy/spotifast-theme"
  fi
}
