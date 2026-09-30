# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
pkgname=doubletake-alchemy-bin
pkgver=0.4.0.alchemy.5
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
sha256sums_x86_64=('ff60045c443c49e5b98810a42e7f35b2495fab54036eb16d187716899b66a1b2')
sha256sums_aarch64=('06cf355fe462e5dfc4394767a078ec3ea0c83a90ee7591c3bb335b6859f62936')

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
