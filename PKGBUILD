# Maintainer: thynkon <thynkon at protonmail dot com>

pkgname=joplin-appimage
pkgver=3.0.15
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
  ace649b9e4c4039e0e85f6fee6a9e39b850601ae493a4b98451f651ca24fd9177fad89b5b81cb116b3b41c82b7ccd76f870f0293ca8398d20cdb74e992b9b0c8
  SKIP
)
_filename="Joplin-${pkgver}.AppImage"
_squashfs_desktop_file="@joplinapp-desktop.desktop"
_desktop_file="/usr/share/applications/joplin.desktop"
_appimage_name=$(echo "${_filename}"|sed -E 's/-[0-9]*.[0-9]*.[0-9]*//')
_install_path="/opt/appimages/${_appimage_name}"

package() {
    chmod +x "${_filename}"
    mkdir -p squashfs-root/usr/share/icons/hicolor/{72x72,16x16}/apps
    ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/@joplinapp-desktop.png" > /dev/null 2>&1
    ./${_filename} --appimage-extract @joplinapp-desktop.desktop > /dev/null 2>&1
    sed -i -E "s|Exec=AppRun|Exec=${_install_path}|" "squashfs-root/${_squashfs_desktop_file}"
    sed -i -E "s|Icon=joplin|Icon=@joplinapp-desktop|" "squashfs-root/${_squashfs_desktop_file}"

    # install icons
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f -name "@joplinapp-desktop.png" -exec chmod 644 {} \;

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

    # disable AppImage integration prompt
    # https://github.com/electron-userland/electron-builder/issues/1962
    install -dm755 "${pkgdir}/usr/share/appimagekit"
}
