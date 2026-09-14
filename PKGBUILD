# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=zapfast-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="Fast native WhatsApp client built with Rust and egui"
arch=('x86_64' 'aarch64')
url="https://zapfast.rocks"
license=('MIT')
install="${pkgname}.install"
# Nothing beyond libc is linked directly; winit and glutin dlopen these at
# startup, and this is a GUI-only application, so all of them have to be
# there for it to run at all.
depends=('alsa-lib' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11')
optdepends=('libxkbcommon-x11: keyboard handling in X11 sessions'
            'noto-fonts-emoji: colour emoji in messages and reactions'
            'xdg-desktop-portal: the file picker for attachments')
provides=('zapfast' 'fastsapp')
conflicts=('zapfast' 'zapfast-git' 'fastsapp' 'fastsapp-bin' 'fastsapp-git')
replaces=('fastsapp-bin')
options=('!debug' '!strip')
_repo="https://github.com/crmne/zapfast"
source_x86_64=("${_repo}/releases/download/v${pkgver}/zapfast-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/zapfast-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('bdb09dd5384e382ad5eba2fac39161c8ccf9f105b9eaee9452cda41441d39b9f')
sha256sums_aarch64=('2683987268bf5e7bf805f0431daa88576a8cf884508c0e9835cc604f27148a34')

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
}
