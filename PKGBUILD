# Maintainer: BOEHM Guillaume <aur@sl.gboehm.com>

pkgname=simplex-desktop-appimage
pkgver=5.5.5
pkgrel=1
pkgdesc="The latest release of Simplex Desktop, the first messaging platform operating without user identifiers of any kind - 100% private by design!"
arch=('x86_64')
url="https://simplex.chat/"

license=('AGPLv3')
depends=()
options=(!strip) # necessary otherwise the AppImage file in the package is truncated

_appimage_sum="c9e9e037d4ee921fb1188f644d6786558ee9c60e3946a4343583dcb02563c1abd8797f7f0ceda9f6a3da01a35e358816dd74c6a5305a44cb1649cfd92ad4c1a6"
_filename="simplex-desktop-${arch}-${pkgver}-${_appimage_sum}.AppImage"
_squashfs_desktop_file="chat.simplex.app.desktop"
_desktop_file="/usr/share/applications/simplex-desktop.desktop"
_appimage_name=$(echo "${_filename}" | sed -E "s/-${arch}-${pkgver}-${pkgrel}//")
_install_path="/opt/appimages/${_appimage_name}"

source=(
    "${_filename}::https://github.com/simplex-chat/simplex-chat/releases/download/v${pkgver}/simplex-desktop-${arch}.AppImage"
)
sha512sums=("${_appimage_sum}")

package() {

    echo "- Extracting appimage"
    echo "-- Set execution permissions"
    chmod +x "${_filename}"
    # mkdir -p squashfs-root/usr/share/icons/hicolor/256x256/apps
    echo "-- Extracting icon"
    ./${_filename} --appimage-extract "usr/share/icons/simplex.png" > /dev/null 2>&1
    echo "-- Extracting desktop file"
    ./${_filename} --appimage-extract ${_squashfs_desktop_file} > /dev/null 2>&1

    echo "- Install icons"
    install -dm755 "${pkgdir}/usr/share/icons/"
    echo "-- Copy icon file"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons/simplex.png" "${pkgdir}/usr/share/icons/"
    echo "-- Set permissions on folder"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    echo "-- Set permissions on files"
    find "${pkgdir}/usr/share/icons" -type f -name "simplex.png" -exec chmod 644 {} \;

    echo "- Install .desktop file and appimage file"
    # disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
    # disable AppimageLauncher integration prompt
    # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
    echo "-- Change desktop file execution"
    sed -i -E "s|Exec=AppRun --no-sandbox %U|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/simplex --no-sandbox|" "squashfs-root/${_squashfs_desktop_file}"
    echo "-- Install desktop file"
    install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
    echo "-- Install appimage"
    install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
    echo "-- Set permissions for bin folder"
    mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    echo "-- Link appimage to bin/simplex"
    ln -s "${_install_path}" "${pkgdir}/usr/bin/simplex"

    echo "- Disable AppImage integration prompt"
    # disable AppImage integration prompt
    # https://github.com/electron-userland/electron-builder/issues/1962
    install -dm755 "${pkgdir}/usr/share/appimagekit"
}
