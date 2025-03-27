# Maintainer: Mercas <me@smj.im>
pkgname=cursor-bin-extracted
pkgver="0.48.2"
_build_hash=7d6318dfcfbf7c12a87e33c06978f23167a6de3c
pkgrel=1
pkgdesc='Cursor - The AI Code Editor (extracted from Appimage)'
arch=('x86_64')
url='https://www.cursor.com/'
license=('custom')
conflicts=('cursor-bin')
depends=('libnotify' 'nss' 'libxss' 'libxtst' 'libsecret' 'gtk3' 'libappindicator-gtk3')
source_x86_64=("cursor-${pkgver}.Appimage::https://downloads.cursor.com/production/${_build_hash}/linux/x64/Cursor-${pkgver}-x86_64.AppImage")
sha256sums_x86_64=('3972fd0be1a7abc9eb8c28ef6717072ca932a0ad4146c13ed09eb58fdd871689')
options=('!strip' '!debug')

prepare() {
  # Make AppImage executable and extract it
  chmod +x "${srcdir}/cursor-${pkgver}.Appimage"
  "${srcdir}/cursor-${pkgver}.Appimage" --appimage-extract

  # Check if extraction was successful
  if [[ ! -d "${srcdir}/squashfs-root" ]]; then
    error "Failed to extract AppImage"
    exit 1
  fi

  # Update desktop file with correct paths
  awk '{
    gsub(/co\.anysphere\.cursor/, "cursor");
    gsub(/Icon=cursor/, "Icon=cursor");
    print
  }' "${srcdir}/squashfs-root/cursor.desktop" >"${srcdir}/squashfs-root/cursor.desktop.tmp" &&
    mv "${srcdir}/squashfs-root/cursor.desktop.tmp" "${srcdir}/squashfs-root/cursor.desktop"
}

package() {
  # Create necessary directories
  install -d "${pkgdir}/opt/cursor"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"

  # Install desktop entry
  install -Dm644 "${srcdir}/squashfs-root/cursor.desktop" "${pkgdir}/usr/share/applications/cursor.desktop"

  # Install all icons
  local icon_dir="${srcdir}/squashfs-root/usr/share/icons/hicolor"
  if [ -d "$icon_dir" ]; then
    for size in $(find "$icon_dir" -type d -name "*x*"); do
      size_dir=$(basename "$size")
      install -d "${pkgdir}/usr/share/icons/hicolor/${size_dir}/apps"
      install -m644 "${icon_dir}/${size_dir}/apps/cursor.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size_dir}/apps/cursor.png"
    done
  fi

  # Copy all files from squashfs-root to /opt/cursor
  cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/cursor/"

  # Create symlink for the binary
  ln -sf "/opt/cursor/usr/share/cursor/cursor" "${pkgdir}/usr/bin/cursor"

  # Fix permissions
  chmod -R 755 "${pkgdir}/opt/cursor"
}

clean() {
  rm -rf "${srcdir}/squashfs-root"
}
