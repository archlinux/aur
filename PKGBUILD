# Maintainer: thynkon <thynkon at protonmail dot com>

pkgname=joplin-appimage
pkgver=2.6.10
pkgrel=3
pkgdesc="The latest stable AppImage of Joplin - a cross-platform note taking and to-do app"
arch=('x86_64')
url="https://github.com/laurent22/joplin"
license=('MIT')
conflicts=('joplin-desktop')
depends=('fuse2')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
_filename=Joplin-$pkgver.AppImage
source=(
  ${url}/releases/download/v${pkgver}/Joplin-${pkgver}.AppImage
  ${url}/raw/v${pkgver}/LICENSE
)
sha512sums=(
  05cecb22db1addf36ec54b08f8891998b59c5c15d62fec73067b371cad298c7916954175f85941b195b6e4a19cdb7e197682ae9e8653e58cb362a0af8e50d872
  SKIP
)
_squashfs_desktop_file="@joplinapp-desktop.desktop"
_desktop_file="/usr/share/applications/joplin.desktop"
_no_desktop_integration_file="/usr/share/appimagekit/no_desktopintegration"

package() {
    chmod +x $_filename
    mkdir -p squashfs-root/usr/share/icons/hicolor/{72x72,16x16}/apps
    ./$_filename --appimage-extract "usr/share/icons/hicolor/*/apps/@joplinapp-desktop.png" > /dev/null 2>&1
    ./$_filename --appimage-extract @joplinapp-desktop.desktop > /dev/null 2>&1
    INSTALL_PATH="/opt/appimages/Joplin.AppImage"
    sed -i -E "s|Exec=AppRun|Exec=${INSTALL_PATH}|" squashfs-root/@joplinapp-desktop.desktop
    sed -i -E "s|Icon=joplin|Icon=@joplinapp-desktop|" squashfs-root/@joplinapp-desktop.desktop

    # install icons
    install -dm755 "$pkgdir/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "$pkgdir/usr/share"
    chmod -R 755 "$pkgdir/usr/share/icons"
    find "$pkgdir/usr/share/icons" -type f -name "@joplinapp-desktop.png" -exec chmod 644 {} \;

    # install .desktop file and image file
    # disable AppimageLauncher integration prompt
    # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
    sed -i -E "s|Exec=/opt/appimages/Joplin.AppImage|Exec=APPIMAGELAUNCHER_DISABLE=1 /opt/appimages/Joplin.AppImage|" "squashfs-root/${_squashfs_desktop_file}"
    install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
    install -Dm755 "$_filename" "$pkgdir$INSTALL_PATH"

    # install license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/joplin-appimage/LICENSE"

    # disable AppImage integration prompt
    # https://github.com/electron-userland/electron-builder/issues/1962
    install -dm755 "$pkgdir/usr/share/appimagekit"
    touch "${pkgdir}/${_no_desktop_integration_file}"
    chmod 644 "${pkgdir}/${_no_desktop_integration_file}"
}
