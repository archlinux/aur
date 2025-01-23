# Maintainer: w0rty <mawo97 at gmail.com>

pkgname=bananas-appimage
pkgver=0.0.22 # renovate: datasource=github-releases depName=mistweaverco/bananas
pkgrel=1
pkgdesc="cross-platform, p2p screen sharing made simple"
arch=('x86_64')
url="https://github.com/mistweaverco/bananas"
license=('MIT')
options=(!strip)
depends=('zlib' 'hicolor-icon-theme' 'glibc')
source=(
  "${url}/releases/download/v${pkgver}/bananas_x86_64.AppImage"
  "${url}/raw/v${pkgver}/LICENSE"
  )

sha256sums=('7236bd1210a9357d6d556d86085f7d79ef8fc2e476f2f677ccfab75c6210acc0'
            '5ba8d10757c4ce9b880422e3746897d89b27647febd1f70ab5021f9ac10ade95')

_filename="bananas_x86_64.AppImage"
_squashfs_desktop_file="bananas.desktop"
_desktop_file="/usr/share/applications/bananas.desktop"
_appimage_name=$(echo "${_filename}")
_install_path="/opt/appimages/${_appimage_name}"

package() {
    chmod +x "${_filename}"
    mkdir -p squashfs-root/usr/share/icons/hicolor/{64x64,32x32}/apps
    ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/.png" > /dev/null 2>&1
    ./${_filename} --appimage-extract bananas.desktop > /dev/null 2>&1
    sed -i -E "s|Exec=AppRun|Exec=${_install_path}|" "squashfs-root/${_squashfs_desktop_file}"
    sed -i -E "s|Icon=bananas|Icon=bananas|" "squashfs-root/${_squashfs_desktop_file}"

    # install icons
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f -name "bananas.png" -exec chmod 644 {} \;

    # install .desktop file and image file
    # disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
    # disable AppimageLauncher integration prompt
    # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
    sed -i -E "s|Exec=${_install_path}|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/bananas|" "squashfs-root/${_squashfs_desktop_file}"
    install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
    install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
    mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    ln -s "${_install_path}" "${pkgdir}/usr/bin/bananas"

    # install license file
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/bananas-appimage/LICENSE"

    # disable AppImage integration prompt
    # https://github.com/electron-userland/electron-builder/issues/1962
    install -dm755 "${pkgdir}/usr/share/appimagekit"
}
