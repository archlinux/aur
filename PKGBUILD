# Maintainer: skychan <diufanshu@gmail.com>

pkgname=futubull-appimage

pkgver=15.13.11208
pkgrel=1
pkgdesc="Futubull (富途牛牛) for Linux (AppImage) - Trade HK, US, CN (A-shares), options, ETFs across global markets platform"
arch=('x86_64')
url="https://github.com/skychan/futubull-appimage.git"
license=('MIT')
options=(!strip)
source=("https://softwaredownload.futunn.com/FTNN_desktop_${pkgver}_amd64.AppImage")
sha512sums=('SKIP')

_filename="FTNN_desktop_${pkgver}_amd64.AppImage"
_squashfs_desktop_file="FTNN.desktop"
_squashfs_icon_file="FTNN.png"
_appimage_name="Futubull"
_install_path="/opt/appimages/${_appimage_name}"
_desktop_file="/usr/share/applications/${_squashfs_desktop_file}"

package() {
    chmod +x "${_filename}"

    # Extract desktop and icon files from AppImage
    ./${_filename} --appimage-extract "${_squashfs_desktop_file}" >/dev/null 2>&1
    ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/${_squashfs_icon_file}" >/dev/null 2>&1

    # Fix .desktop Exec and Icon paths
    sed -i -E "s|Exec=.*|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/futubull|" "squashfs-root/${_squashfs_desktop_file}"
    sed -i -E "s|Icon=.*|Icon=${_squashfs_icon_file}|" "squashfs-root/${_squashfs_desktop_file}"

    # Install AppImage binary
    install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "${_install_path}" "${pkgdir}/usr/bin/futubull"

    # Install desktop entry
    install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"

    # Install icons
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f -name "${_squashfs_icon_file}" -exec chmod 644 {} \;

    # Disable AppImageLauncher integration prompts
    install -dm755 "${pkgdir}/usr/share/appimagekit"

}

