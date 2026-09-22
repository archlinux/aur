# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=zapfast-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="Fast native WhatsApp client built with Rust and egui"
arch=('x86_64' 'aarch64')
url="https://zapfast.rocks"
license=('MIT')
install="${pkgname}.install"
# Nothing beyond libc is linked directly; winit and glutin dlopen these at
# startup, and this is a GUI-only application, so all of them have to be
# there for it to run at all.
depends=('alsa-lib' 'alsa-plugins' 'libglvnd' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxrandr')
optdepends=('org.freedesktop.secrets: archive encryption key storage'
            'noto-fonts-emoji: colour emoji in messages and reactions'
            'xdg-desktop-portal: the file picker for attachments')
provides=('zapfast' 'fastsapp')
conflicts=('zapfast' 'zapfast-git' 'fastsapp' 'fastsapp-bin' 'fastsapp-git')
replaces=('fastsapp-bin')
options=('!debug' '!strip')
_repo="https://github.com/crmne/zapfast"
source_x86_64=("${_repo}/releases/download/v${pkgver}/zapfast-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/zapfast-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8a91080168c2186f9995950bf4c17ffb031e5edfb5739ca568812351b032ef9c')
sha256sums_aarch64=('26773964919bb61293ead96faeb11af6c38071f6a08b53f90905a93b46ec7e59')

package() {
  local target
  case "$CARCH" in
    x86_64) target="x86_64-unknown-linux-gnu" ;;
    aarch64) target="aarch64-unknown-linux-gnu" ;;
  esac
  local dir="${srcdir}/zapfast-v${pkgver}-${target}"

  install -Dm755 "${dir}/zapfast" "${pkgdir}/usr/bin/zapfast"
  install -Dm644 "${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${dir}/packaging/applications/zapfast.desktop" \
    "${pkgdir}/usr/share/applications/zapfast.desktop"
  install -Dm644 "${dir}/packaging/icons/zapfast.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/zapfast.svg"
  # Releases predating theme integration remain valid packaging inputs.
  if [[ -f "${dir}/contrib/omarchy/zapfast.json.tpl" ]]; then
    install -Dm644 "${dir}/contrib/omarchy/zapfast.json.tpl" \
      "${pkgdir}/usr/share/zapfast/omarchy/zapfast.json.tpl"
    install -Dm755 "${dir}/contrib/omarchy/zapfast-theme" \
      "${pkgdir}/usr/share/zapfast/omarchy/zapfast-theme"
  fi

}
