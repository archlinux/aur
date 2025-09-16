# Maintainer: Todd E Johnson <todd@toddejohnson.net>

pkgname=xlights-appimage
pkgver=2025.09
pkgrel=1
pkgdesc="Sequencer for Lights"
arch=('x86_64')
url="https://github.com/xLightsSequencer/xLights"
license=('GPL3')
conflicts=('xlights')
depends=('fuse2')
options=(!strip)
source=(
  ${url}/releases/download/${pkgver}/xLights-${pkgver}-x86_64.AppImage
)
sha512sums=('a8b490e0ef378d8b50dba836dc23d121fe0ecbf6b63c83006a86d1df3797b77f99ab36c5560596fcf0dbcbe952deb0dd85a06f63400cc7d26da09064da9b939b')
_filename="xLights-${pkgver}-x86_64.AppImage"
_squashfs_desktop_file="usr/share/applications/xlights.desktop"
_desktop_file="/usr/share/applications/xlights.desktop"
_appimage_name=$(echo "${_filename}"|sed -E 's/-[0-9]*.[0-9]*.[0-9]*//')
_install_path="/opt/appimages/${_appimage_name}"

package() {
    chmod +x "${_filename}"
    mkdir -p squashfs-root/usr/share/icons/hicolor/{64x64,16x16}/apps
    ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/xlights.png" > /dev/null 2>&1
    ./${_filename} --appimage-extract ${_squashfs_desktop_file} > /dev/null 2>&1

    # install icons
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f -name "xlights.png" -exec chmod 644 {} \;

    # install .desktop file and image file
    # disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
    # disable AppimageLauncher integration prompt
    # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
    sed -i -E "s|Exec=xLights|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/xLights|" "squashfs-root/${_squashfs_desktop_file}"
    install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
    install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
    mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    ln -s "${_install_path}" "${pkgdir}/usr/bin/xLights"

    # disable AppImage integration prompt
    # https://github.com/electron-userland/electron-builder/issues/1962
    install -dm755 "${pkgdir}/usr/share/appimagekit"
}
