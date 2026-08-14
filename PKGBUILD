# Maintainer: duanluan <duanluan@outlook.com>

pkgname=reasonix-desktop-bin
_pkgname=reasonix-desktop
pkgver=1.25.1
pkgrel=1
pkgdesc='Terminal-native AI coding agent with DeepSeek API (desktop GUI, repackaged from .deb)'
arch=('x86_64')
url='https://github.com/esengine/DeepSeek-Reasonix'
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('reasonix-desktop')
conflicts=('reasonix-desktop' 'deepseek-reasonix-desktop' 'deepseek-reasonix-desktop-bin')
options=('!strip')
source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v${pkgver}/Reasonix-linux-amd64.deb")
sha256sums=('faa962d5d60517ed6ce3494d24ff1d6f4126cab396adbb2a24c4075924a9bfd1')

package() {
  local _extractdir
  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  bsdtar -C "${_extractdir}" -xf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb"
  bsdtar -C "${_extractdir}" -xf "${_extractdir}/data.tar.gz"

  # Install the real binary under /opt/reasonix-desktop
  install -Dm755 "${_extractdir}/usr/bin/reasonix-desktop" \
    "${pkgdir}/opt/reasonix-desktop/reasonix-desktop"

  # Wrapper script — mirrors Wails' own Linux initialisation logic
  # GDK_BACKEND: only force x11 when not on Wayland (Wails does this internally too)
  # WEBKIT_DISABLE_DMABUF_RENDERER: avoids KMS/GBM failures on NVIDIA/mesa combos
  # WEBKIT_DISABLE_COMPOSITING_MODE: forces software compositing (fixes blank webview)
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/reasonix-desktop" <<'SCRIPT'
#!/bin/sh
if [ -z "${GDK_BACKEND:-}" ]; then
	case "${XDG_SESSION_TYPE:-}" in
		wayland) ;;
		*) export GDK_BACKEND=x11 ;;
	esac
fi
export WEBKIT_DISABLE_DMABUF_RENDERER="${WEBKIT_DISABLE_DMABUF_RENDERER:-1}"
export WEBKIT_DISABLE_COMPOSITING_MODE="${WEBKIT_DISABLE_COMPOSITING_MODE:-1}"
exec /opt/reasonix-desktop/reasonix-desktop "$@"
SCRIPT

  # Desktop entry
  install -Dm644 "${_extractdir}/usr/share/applications/reasonix.desktop" \
    "${pkgdir}/usr/share/applications/reasonix.desktop"
  sed -i \
    -e 's/^Name=.*/Name=Reasonix/' \
    -e 's/^Comment=.*/Comment=Terminal-native AI coding agent with DeepSeek API/' \
    -e 's/^Categories=.*/Categories=Development;Utility;/' \
    "${pkgdir}/usr/share/applications/reasonix.desktop"

  # Icon
  install -Dm644 "${_extractdir}/usr/share/pixmaps/reasonix-desktop.png" \
    "${pkgdir}/usr/share/pixmaps/reasonix-desktop.png"
}
