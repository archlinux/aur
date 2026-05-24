# Maintainer: thynkon <thynkon at protonmail dot com>

pkgname=joplin-appimage
pkgver=3.6.14
pkgrel=1
pkgdesc="The latest stable AppImage of Joplin - a cross-platform note taking and to-do app"
arch=('x86_64')
url="https://github.com/laurent22/joplin"
license=('MIT')
conflicts=('joplin-desktop')
depends=('fuse2')
options=(!strip)
source=(
  ${url}/releases/download/v${pkgver}/Joplin-${pkgver}.AppImage
  ${url}/raw/v${pkgver}/LICENSE
)
sha512sums=(
  c445a41671c2c8cec6a04373adbe32880310fe4945a26b6e3978781212af1bb580c3f06bb8fcb187b524f0312fc3e89efdb8238aac97a4cb741b869f2163355d
  SKIP
)
_filename="Joplin-${pkgver}.AppImage"
_squashfs_desktop_file="joplin.desktop"
_squashfs_icon_file="joplin.png"
_desktop_file="/usr/share/applications/joplin.desktop"
_appimage_name=$(echo "${_filename}" | sed -E 's/-[0-9]*.[0-9]*.[0-9]*//')
_install_path="/opt/appimages/${_appimage_name}"

package() {
  chmod +x "${_filename}"
  mkdir -p squashfs-root/usr/share/icons/hicolor/{72x72,16x16}/apps
  ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/${_squashfs_icon_file}" >/dev/null 2>&1
  ./${_filename} --appimage-extract "${_squashfs_desktop_file}" >/dev/null 2>&1
  sed -i -E "s|Exec=AppRun|Exec=${_install_path}|" "squashfs-root/${_squashfs_desktop_file}"
  sed -i -E "s|Icon=joplin|Icon=joplin|" "squashfs-root/${_squashfs_desktop_file}"

  # install icons
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
  chmod -R 755 "${pkgdir}/usr/share/icons"
  find "${pkgdir}/usr/share/icons" -type f -name "${_squashfs_icon_file}" -exec chmod 644 {} \;

  # install .desktop file and image file
  # disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
  # disable AppimageLauncher integration prompt
  # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
  sed -i -E "s|Exec=${_install_path}|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/joplin-desktop|" "squashfs-root/${_squashfs_desktop_file}"
  install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
  install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
  mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
  ln -s "${_install_path}" "${pkgdir}/usr/bin/joplin-desktop"

  # install license file
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/joplin-appimage/LICENSE"
}
