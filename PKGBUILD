# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=spotifast-bin
pkgver=0.10.1
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
sha256sums_x86_64=('49393c43162075544a1dad8e2b053a1530c857e25c71b4a9f6e4a5b30e3136d6')
sha256sums_aarch64=('feb8e781b6822b282bfa93d05f033e3253ce62bdce8b6027066072d602898779')

package() {
  local target
  case "$CARCH" in
    x86_64) target="x86_64-unknown-linux-gnu" ;;
    aarch64) target="aarch64-unknown-linux-gnu" ;;
  esac
  local dir="${srcdir}/spotifast-v${pkgver}-${target}"
  [[ -d "$dir" ]] || dir="${srcdir}/fastpotify-v${pkgver}-${target}"

  local binary=spotifast
  [[ -f "${dir}/$binary" ]] || binary=fastpotify
  install -Dm755 "${dir}/$binary" "${pkgdir}/usr/bin/spotifast"
  ln -s spotifast "${pkgdir}/usr/bin/fastpotify"
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
