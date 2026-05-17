# Maintainer: 00ein00 <einthegrimangel at memeware dot net>

pkgname=simplex-desktop-appimage-bin
pkgver=6.5.2
pkgrel=1
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

  # Extracts by default into "${srcdir}/squashfs-root"
  ./simplex-desktop-x86_64.AppImage --appimage-extract
}

package() {
  # Install the AppImage binary
  install -Dm755 "${srcdir}/simplex-desktop-x86_64.AppImage" \
    "${pkgdir}/opt/simplex-desktop/simplex-desktop.AppImage"

  # Symlink into PATH
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/simplex-desktop/simplex-desktop.AppImage "${pkgdir}/usr/bin/simplex-desktop"

  local desktop_file
  desktop_file=$(find "${srcdir}/squashfs-root" -maxdepth 1 -name "*.desktop" -print -quit)

  if [ -n "${desktop_file}" ]; then
    install -Dm644 "${desktop_file}" "${pkgdir}/usr/share/applications/simplex-desktop.desktop"

    sed -i 's|^Exec=.*|Exec=simplex-desktop %U|' "${pkgdir}/usr/share/applications/simplex-desktop.desktop"
    sed -i 's|^Icon=.*|Icon=simplex-desktop|' "${pkgdir}/usr/share/applications/simplex-desktop.desktop"
  fi

  if [ -d "${srcdir}/squashfs-root/usr/share/icons/hicolor" ]; then
    cp -r "${srcdir}/squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons/"
  else
    local icon_file
    icon_file=$(find "${srcdir}/squashfs-root" -maxdepth 1 -type f \( -name "simplex-desktop.png" -o -name "simplex-desktop.svg" -o -name ".DirIcon" \) -print -quit)

    if [ -n "${icon_file}" ]; then
      if [[ "${icon_file}" == *.svg ]]; then
        install -Dm644 "${icon_file}" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/simplex-desktop.svg"
      else
        install -Dm644 "${icon_file}" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/simplex-desktop.png"
      fi
    fi
  fi
}
