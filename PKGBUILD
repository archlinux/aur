# Maintainer: Joe Pizzimenti <joe.pizzimenti2@gmail.com>

_pkgname=eglantine
pkgname="eglantine-pgo-bin"
pkgver=0.1.0_rc3
_tag="v${pkgver//_/-}"
pkgrel=1
pkgdesc="The Eglantine Nintendo Switch 2 emulator AppImage (PGO build)."
arch=('x86_64')
url="https://github.com/Eglantine-Community/Eglantine"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'fuse2')
conflicts=('eglantine' 'eglantine-bin' 'eglantine-git')
provides=('eglantine')
options=(!strip)

_appimage="${_pkgname}-linux-x86_64-pgo.AppImage"
source_x86_64=(
    "${_appimage}::https://github.com/Eglantine-Community/Eglantine/releases/download/${_tag}/${_appimage}"
)
sha256sums_x86_64=('bda2b1bc32e9fd9273477a265b49d5d11829a6f8fec71b6d53f617bd27d5185a')

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

package() {
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  local desktop_file=$(find squashfs-root -maxdepth 1 -name "*.desktop" | head -n 1)
  local icon_file=$(find squashfs-root -maxdepth 1 \( -name "*.svg" -o -name "*.png" \) | head -n 1)

  if [ -n "$desktop_file" ]; then
    sed -i \
      -e "s|^Exec=.*|Exec=/usr/bin/${_pkgname} %U|" \
      -e "s|^Icon=.*|Icon=${_pkgname}|" \
      "$desktop_file"
    install -Dm644 "$desktop_file" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  fi

  if [ -n "$icon_file" ]; then
    local ext="${icon_file##*.}"
    install -Dm644 "$icon_file" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.${ext}"
  fi

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

post_install() {
  update-desktop-database -q /usr/share/applications
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor || true
}

post_upgrade() {
  post_install
}

post_remove() {
  post_install
}
