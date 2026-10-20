# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=spotifast-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Native Spotify client"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/spotifast"
license=('MIT')
install="${pkgname}.install"
# alsa-lib and libpipewire are linked directly; the rest are dlopened by winit
# and glutin at startup, and this is a GUI-only application, so all of them
# have to be there for it to run at all.
depends=('dbus' 'alsa-lib' 'libpipewire' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11')
optdepends=('libxkbcommon-x11: keyboard handling in X11 sessions'
            'pipewire-pulse: PipeWire as the PulseAudio server')
provides=("spotifast=$pkgver")
conflicts=('spotifast' 'spotifast-git')
options=('!debug' '!strip')
_repo="https://github.com/crmne/spotifast"
source_x86_64=("${_repo}/releases/download/v${pkgver}/spotifast-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/spotifast-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f84bfa47edd188433ba224b19e326e0a368baa459a14d9414de98e59a760dcbc')
sha256sums_aarch64=('67ce36fdec883ea5999b22b24ee8b5118490ba490ce007a20b28d243f69b0ba7')

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
