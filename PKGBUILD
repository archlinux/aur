# Maintainer: lynn2004 <ou123699@gmail.com>

pkgname=threadlens-bin
_pkgname=threadlens
pkgver=0.3.0
pkgrel=1
pkgdesc='Find, review, back up, and safely clean up local AI sessions across Codex, Claude, Gemini, and Copilot'
arch=('x86_64')
url='https://github.com/hanityx/threadlens'
license=('MIT')
depends=(
  'fuse2'
  'hicolor-icon-theme'
)
makedepends=(
  'imagemagick'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
install="${_pkgname}.install"

_appimage="ThreadLens-${pkgver}.AppImage"
# KWin/Plasma identifies the AppImage window by this embedded desktop id.
_appimage_desktop='@threadlensdesktop-electron.desktop'
source=(
  "${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
  "${_pkgname}.png"
  "${_pkgname}.desktop"
  "${_pkgname}-appimage.desktop"
  "${_pkgname}.sh"
)
noextract=("${_appimage}")
sha256sums=('09bd6886b8e6dd3aef5fdc2fa69cd449342f808f4d70de759e0ebc02141380d7'
            'fc4fdd931768a69af122a4f7646a139091614d34a0dbe9848d519ba6d2ced7bd'
            '020486af1e1772c72ea2188150e90df7edab8a3b68f6e1ce6d80c00a8079725c'
            '3e68d1dd832531925825bd12a136aff12697be4733db915fe3393ccf2014fef6'
            'f9d8db5a8a9b059910f8695c24e6f62af4b950dd8acd497f0921eb401475f944'
            '284136c640404ebab3e6d2e75f25b8cf9dccd5ed638a842351031cac14fcf07f')

prepare() {
  local _size

  # Generate indexed hicolor sizes from the fixed transparent source icon.
  for _size in 16 32 48 64 128 256 512 1024; do
    magick "${_pkgname}.png" -resize "${_size}x${_size}" "${_pkgname}-${_size}.png"
  done
}

package() {
  local _size

  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"
  install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  # Hidden compatibility entry for KDE Wayland task manager icon matching.
  install -Dm644 "${_pkgname}-appimage.desktop" \
    "${pkgdir}/usr/share/applications/${_appimage_desktop}"
  for _size in 16 32 48 64 128 256 512 1024; do
    install -Dm644 "${_pkgname}-${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${_pkgname}.png"
    # Alias the embedded AppImage icon name to the fixed packaged icon.
    install -Dm644 "${_pkgname}-${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/@threadlensdesktop-electron.png"
  done
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
