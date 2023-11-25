# Maintainer: BOEHM Guillaume <aur@sl.gboehm.com>

pkgname=simplex-desktop-appimage
pkgver=5.4.0
pkgrel=3
pkgdesc="The latest release of Simplex Desktop, the first messaging platform operating without user identifiers of any kind - 100% private by design!"
arch=('x86_64')
url="https://simplex.chat/"

license=('AGPLv3')
depends=()
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
    https://github.com/simplex-chat/simplex-chat/releases/download/v${pkgver}/simplex-desktop-${arch}.AppImage
)
sha512sums=('e84bea553c798d2fd36fb78543e515bcce3d4606a91b736b771ba7174dfd433c99b28aed0edbf13f702f385e40f18cbf0ea9658f9bcfc9ab50bf2c4fb9fd0937')
_filename="simplex-desktop-${arch}.AppImage"
_squashfs_desktop_file="chat.simplex.app.desktop"
_desktop_file="/usr/share/applications/simplex-desktop.desktop"
_appimage_name=$(echo "${_filename}"|sed -E 's/-[0-9]*.[0-9]*.[0-9]*//')
_install_path="/opt/appimages/${_appimage_name}"

package() {

    chmod +x "${_filename}"
    # mkdir -p squashfs-root/usr/share/icons/hicolor/256x256/apps
    ./${_filename} --appimage-extract "usr/share/icons/simplex.png" > /dev/null 2>&1
    ./${_filename} --appimage-extract ${_squashfs_desktop_file} > /dev/null 2>&1

    # install icons
    install -dm755 "${pkgdir}/usr/share/icons/"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons/simplex.png" "${pkgdir}/usr/share/icons/"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f -name "simplex.png" -exec chmod 644 {} \;

    # install .desktop file and image file
    # disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
    # disable AppimageLauncher integration prompt
    # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
    sed -i -E "s|Exec=AppRun --no-sandbox %U|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/simplex --no-sandbox|" "squashfs-root/${_squashfs_desktop_file}"
    install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
    install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
    mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    ln -s "${_install_path}" "${pkgdir}/usr/bin/simplex"

    # disable AppImage integration prompt
    # https://github.com/electron-userland/electron-builder/issues/1962
    install -dm755 "${pkgdir}/usr/share/appimagekit"
}
