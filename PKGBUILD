# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
pkgname=doubletake-alchemy-bin
pkgver=0.4.0.alchemy.2
pkgrel=1
pkgdesc='AirPlay sender for Linux with Hyprland extended desktops (alchemy fork, prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/alchemy/doubletake'
license=('LGPL-3.0-or-later')
depends=(
  'bash' 'glibc' 'gstreamer' 'gst-plugins-base' 'gst-plugins-good'
  'gst-plugins-bad' 'gst-plugins-ugly' 'gst-plugin-pipewire'
  'libpulse' 'xdg-desktop-portal' 'systemd' 'coreutils'
)
optdepends=(
  'hyprland: virtual monitors for extend mode'
  'xdg-desktop-portal-hyprland: Hyprland capture and automatic extend selection'
  'xdg-desktop-portal-wlr: capture on other wlroots compositors'
  'gst-plugin-va: VA-API hardware video encoding'
  'xorg-xrandr: primary monitor detection for X11 capture'
  'org.freedesktop.secrets: system keyring credential storage'
)
provides=("doubletake=${pkgver}" "doubletake-alchemy=${pkgver}")
conflicts=('doubletake')
# Release binaries are already stripped. Preserve them byte-for-byte.
options=('!strip' '!debug')
_tag=v${pkgver/.alchemy./-alchemy.}
_release=${url}/releases/download/${_tag}
source_x86_64=("${_release}/doubletake-${_tag}-linux-amd64.tar.gz")
source_aarch64=("${_release}/doubletake-${_tag}-linux-arm64.tar.gz")
sha256sums_x86_64=('fbf27c1c8ad37483a40b5f8f2d287f246131c419b48d93354bda15eec1beedaf')
sha256sums_aarch64=('8bf286cd6733f7607f885d2832c010fb583685a00a3eeedae5e39256e37ac08d')

package() {
  local _arch
  case "$CARCH" in
    x86_64) _arch=amd64 ;;
    aarch64) _arch=arm64 ;;
    *) return 1 ;;
  esac
  cd "doubletake-${_tag}-linux-${_arch}"
  for command in doubletake doubletake-ctl doubletake-test-receiver; do
    install -Dm755 "$command" "${pkgdir}/usr/bin/${command}"
    install -Dm644 "man/man1/${command}.1" "${pkgdir}/usr/share/man/man1/${command}.1"
  done
  for doc in README.md FORK.md VERSION REVISION; do
    install -Dm644 "$doc" "${pkgdir}/usr/share/doc/${pkgname}/${doc}"
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 COPYING.GPL "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.GPL"
}
