_pkgname=folo
_Pkgname=Folo
_disname=Folo
major_version=0
minor_version=7
patch_version=0
# phase='beta.0'

pkgname="${_pkgname}"-appimage
replaces=('follow-appimage')
conflicts=('follow-appimage')
pkgver="${major_version}.${minor_version}.${patch_version}"
pkgrel=1
pkgdesc="🧡 Next generation information browser"
arch=('x86_64')
url="https://github.com/RSSNext/Folo"
license=('GPL-3')
options=('!strip' '!debug')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('follow')

source_x86_64=("${_Pkgname}-${major_version}.${minor_version}.${patch_version}-linux-amd64.AppImage::https://github.com/RSSNext/Folo/releases/download/v${major_version}.${minor_version}.${patch_version}/${_Pkgname}-${major_version}.${minor_version}.${patch_version}-linux-x64.AppImage")
sha256sums_x86_64=("04e5f7f53df310247ba715568779bfa9047b6465320ad639dd0375d26cbf986d")

_appimage="${_Pkgname}-${major_version}.${minor_version}.${patch_version}-linux-amd64.AppImage"
noextract=("${_appimage}")

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i \
    -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
    "squashfs-root/${_disname}.desktop"
  # Change Exec
  sed -i \
    -e "s|Exec=Folo --no-sandbox --disable-setuid-sandbox %u|Exec=folo --no-sandbox --disable-setuid-sandbox %u|" \
    "squashfs-root/${_disname}.desktop"

  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${_disname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
#   cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
#   ln -s "$(realpath ${srcdir}/squashfs-root/${_disname}.png --relative-to ${srcdir}/squashfs-root/usr/share/icons)" \
#     "${pkgdir}/usr/share/icons/${_pkgname}.png"


  local source_icon_relative_path="usr/share/icons/hicolor/256x256/apps/${_disname}.png"
  local target_icon_relative_path="usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  local source_icon_full_path="${srcdir}/squashfs-root/${source_icon_relative_path}"
  local target_icon_full_path="${pkgdir}/${target_icon_relative_path}"

  if [ -f "${source_icon_full_path}" ]; then
      echo "Installing and renaming icon: ${source_icon_full_path} -> ${target_icon_full_path}"
      install -Dm644 "${source_icon_full_path}" "${target_icon_full_path}"

      install -d "${pkgdir}/usr/share/icons"

      local link_target_relative_path
      link_target_relative_path=$(realpath --relative-to="${pkgdir}/usr/share/icons" "${target_icon_full_path}")

      echo "Creating symlink: ${pkgdir}/usr/share/icons/${_pkgname}.png -> ${link_target_relative_path}"
      ln -sf "${link_target_relative_path}" "${pkgdir}/usr/share/icons/${_pkgname}.png"

  else
      echo "WARNING: Expected source icon file not found at '${source_icon_full_path}'."
      echo "         Icon might be missing. (Potentially ignorable if this is not an upgrade.)"
  fi

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

  # Symlink license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
