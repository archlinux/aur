# Maintainer: 00ein00 <einthegrimangel at memeware dot net>

pkgname=simplex-desktop-appimage-bin
pkgver=6.5.2
pkgrel=2
pkgdesc='SimpleX Chat, the first messaging network operating without user identifiers of any kind (pre-compiled AppImage)'
arch=('x86_64')
url='https://simplex.chat/'
license=('AGPL-3.0-or-later')
depends=('fuse2')
provides=('simplex-desktop')
conflicts=('simplex-desktop' 'simplex-desktop-bin')
options=('!strip')
source=("simplex-desktop-x86_64.AppImage::https://github.com/simplex-chat/simplex-chat/releases/download/v${pkgver}/simplex-desktop-x86_64.AppImage")
sha256sums=('71a44bd3d3ca277dd71d145e679a92a5f80a1f4c292711921d77c0f37b33e541')

prepare() {
  cd "${srcdir}"
  chmod +x simplex-desktop-x86_64.AppImage

  # Extract AppImage
  ./simplex-desktop-x86_64.AppImage --appimage-extract
}

package() {
  # Install AppImage binary
  install -Dm755 "${srcdir}/simplex-desktop-x86_64.AppImage" \
    "${pkgdir}/opt/simplex-desktop/simplex-desktop.AppImage"

  # Symlink into PATH
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/simplex-desktop/simplex-desktop.AppImage "${pkgdir}/usr/bin/simplex-desktop"

  # Locate and install the upstream .desktop file
  local desktop_file
  desktop_file=$(find "${srcdir}/squashfs-root" -maxdepth 2 -name "*.desktop" -print -quit)

  if [ -n "${desktop_file}" ]; then
    install -Dm644 "${desktop_file}" "${pkgdir}/usr/share/applications/simplex-desktop.desktop"

    sed -i 's|^Exec=.*|Exec=simplex-desktop %U|' "${pkgdir}/usr/share/applications/simplex-desktop.desktop"
    sed -i 's|^Icon=.*|Icon=simplex-desktop|' "${pkgdir}/usr/share/applications/simplex-desktop.desktop"
  fi

  local icon_file=""

  icon_file=$(find "${srcdir}/squashfs-root" -type f \( -name "simplex.png" -o -name "simplex-desktop.png" -o -name "simplex.svg" -o -name "simplex-desktop.svg" \) -print -quit)

  if [ -z "${icon_file}" ] && [ -f "${srcdir}/squashfs-root/.DirIcon" ]; then
    icon_file="${srcdir}/squashfs-root/.DirIcon"
  fi

  if [ -z "${icon_file}" ]; then
    icon_file=$(find "${srcdir}/squashfs-root" -maxdepth 1 -type f \( -name "*.png" -o -name "*.svg" \) -print -quit)
  fi

  if [ -n "${icon_file}" ]; then
    if [[ "${icon_file}" == *.svg ]]; then
      install -Dm644 "${icon_file}" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/simplex-desktop.svg"
    else
      install -Dm644 "${icon_file}" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/simplex-desktop.png"
      install -Dm644 "${icon_file}" "${pkgdir}/usr/share/pixmaps/simplex-desktop.png"
    fi
  else
    echo "Warning: No usable app icon asset was resolved from the AppImage payload."
  fi
}
