pkgname=clash-nyanpasu-appimage
_pkgname=clash-nyanpasu
_upstream_tag=v2.0.0-beta.2
_source_url=https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v2.0.0-beta.2/Clash.Nyanpasu_2.0.0-beta.2_amd64.AppImage
pkgver=2.0.0beta.2
pkgrel=1
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​"
arch=('x86_64')
url="https://github.com/LibNyanpasu/clash-nyanpasu"
license=('GPL3')
options=('!strip' '!debug')
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'clash-meta')
makedepends=('desktop-file-utils')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-bin' 'clash-nyanpasu')
provides=('clash-nyanpasu')
optdepends=('clash-rs: custom protocol network proxy, coding with rust')
_appimage="${_pkgname}-${pkgver}-amd64.AppImage"
source_x86_64=("${_appimage}::${_source_url}")
sha256sums_x86_64=('a43c74166aff6b1a7b4531451188871f0036b985d947d685d41fab91d31ecb92')
noextract=("${_appimage}")

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Upstream may change the product name, including spaces and capitalization.
  local -a desktops=(squashfs-root/*.desktop)
  if (( ${#desktops[@]} != 1 )) || [[ ! -f ${desktops[0]} ]]; then
    printf '%s\n' 'Expected one root desktop entry in the AppImage' >&2
    return 1
  fi
  local icon_name
  icon_name=$(sed -n 's/^Icon=//p' "${desktops[0]}")
  if [[ -z $icon_name || $icon_name == */* || $icon_name == *$'\n'* ||
      ! -f "squashfs-root/${icon_name}.png" ]]; then
    printf '%s\n' 'Expected a root PNG matching the desktop Icon field' >&2
    return 1
  fi
  install -m644 "squashfs-root/${icon_name}.png" packaging-icon.png
  sed -i \
    -e "s|^Exec=.*|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
    -e "s|^Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
    "${desktops[0]}"
  desktop-file-validate "${desktops[0]}"
  chmod -R a+rX squashfs-root/usr/share/icons
}

package() {
  local -a desktops=("${srcdir}"/squashfs-root/*.desktop)
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm644 "${desktops[0]}" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -a "${srcdir}/squashfs-root/usr/share/icons/." "${pkgdir}/usr/share/icons/"
  # Install a regular icon file, rather than a symlink into the temporary AppDir.
  install -Dm644 "${srcdir}/packaging-icon.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
  # GPL3 is provided by Arch's licenses package; no dangling private license link.
}
