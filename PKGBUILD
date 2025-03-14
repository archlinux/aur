# Maintainer: Mercas <me@smj.im>
pkgname=cursor-bin-extracted
pkgver="0.47.4"
_build_hash=8f8a2000673d2c48f6cac5eea2f3f9f2ed5e4ec2
pkgrel=1
pkgdesc='Cursor - The AI Code Editor (extracted from Appimage)'
arch=('x86_64')
url='https://www.cursor.com/'
license=('custom')
conflicts=('cursor-bin')
depends=('libnotify' 'nss' 'libxss' 'libxtst' 'libsecret' 'gtk3' 'libappindicator-gtk3')
source_x86_64=("cursor-${pkgver}.Appimage::https://downloads.cursor.com/production/client/linux/x64/appimage/Cursor-${pkgver}-${_build_hash}.deb.glibc2.25-x86_64.AppImage")
sha256sums_x86_64=('782eb284fa07ea1e76684bf4e17bef1526f6807fa9fb8aa52d0b2b9f5a16173b')
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
  }' "${srcdir}/squashfs-root/cursor.desktop" > "${srcdir}/squashfs-root/cursor.desktop.tmp" && \
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
  chmod 755 "${pkgdir}/usr/bin/cursor"
}

clean() {
  rm -rf "${srcdir}/squashfs-root"
}
