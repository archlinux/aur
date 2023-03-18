# Maintainer: bacteriostat <dev dot bacteriostat at aleeas dot com>

pkgname=joplin-beta-appimage
pkgver=2.10.11
pkgrel=1
pkgdesc="The latest beta AppImage of Joplin - a cross-platform note taking and to-do app"
arch=('x86_64')
url="https://github.com/laurent22/joplin"
license=('MIT')
conflicts=('joplin-desktop' 'joplin-appimage' 'joplin-beta')
depends=('fuse2')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  ${url}/releases/download/v${pkgver}/Joplin-${pkgver}.AppImage
  ${url}/raw/v${pkgver}/LICENSE
)
sha512sums=('64e127e5bc1ca154de5415bc6f5ab5f86a7b85c97d401023c76696e334f64ed9e8c843aca06a4d40b5d1018917ac0a6a7695f2e20a0f1b232cb73f1e03b019aa'
            '2f9d3c5993a0d35c37ca4ae4c638de8009f39aab7d9a5e8721d44abcba21a180bf039a7607954c9ab61ef49ec3e9a4ec96630b60ee16610f6ff4018a1f490edb')
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
    sed -i -E "s|Comment=Joplin for Desktop|Comment=Joplin beta for Desktop|" "squashfs-root/${_squashfs_desktop_file}"
    sed -i -E "s|Name=Joplin|Name=Joplin Beta|" "squashfs-root/${_squashfs_desktop_file}"

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
