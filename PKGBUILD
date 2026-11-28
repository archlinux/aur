# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Installs the prebuilt release archive. Update pkgver and both hashes from
# the release's checksums.txt, then regenerate .SRCINFO.
pkgname=zapfast-plus-bin
pkgver=0.23.0
pkgrel=1
pkgdesc="Personal ZapFast fork with GB-inspired privacy, productivity, media and interface options"
arch=('x86_64' 'aarch64')
url="https://github.com/lucasapolinarioo/zapfast-plus"
license=('MIT' 'GPL-2.0-only')
install="${pkgname}.install"
# Nothing beyond libc is linked directly; winit and glutin dlopen these at
# startup, and this is a GUI-only application, so all of them have to be
# there for it to run at all.
depends=('alsa-lib' 'libpipewire' 'libglvnd' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxrandr')
optdepends=('org.freedesktop.secrets: archive encryption key storage'
            'noto-fonts-emoji: colour emoji in messages and reactions'
            'xdg-desktop-portal: the file picker for attachments')
provides=('zapfast-plus' 'zapfast')
conflicts=('zapfast' 'zapfast-bin' 'zapfast-git' 'zapfast-plus' 'zapfast-plus-git')
options=('!debug' '!strip')
_repo="https://github.com/lucasapolinarioo/zapfast-plus"
source_x86_64=("${_repo}/releases/download/v${pkgver}/zapfast-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/zapfast-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('5bad4a9905e423b2101e722fb4942931ff34c2903c1a0d3725501d2017b82a4d')
sha256sums_aarch64=('71db12c536b856a095ddf2d4cbabce357e875574152de6873936632a393092dc')

package() {
  local target
  case "$CARCH" in
    x86_64) target="x86_64-unknown-linux-gnu" ;;
    aarch64) target="aarch64-unknown-linux-gnu" ;;
  esac
  local dir="${srcdir}/zapfast-v${pkgver}-${target}"

  install -Dm755 "${dir}/zapfast" "${pkgdir}/usr/bin/zapfast"
  install -Dm644 "${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${dir}/THIRD-PARTY-NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.md"
  install -Dm644 "${dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${dir}/packaging/applications/zapfast.desktop" \
    "${pkgdir}/usr/share/applications/zapfast.desktop"
  install -Dm644 "${dir}/packaging/icons/zapfast.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/zapfast.svg"
  if [[ -f "${dir}/contrib/omarchy/zapfast.json.tpl" ]]; then
    install -Dm644 "${dir}/contrib/omarchy/zapfast.json.tpl" \
      "${pkgdir}/usr/share/zapfast/omarchy/zapfast.json.tpl"
    install -Dm755 "${dir}/contrib/omarchy/zapfast-theme" \
      "${pkgdir}/usr/share/zapfast/omarchy/zapfast-theme"
  fi
}
