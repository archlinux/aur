# Maintainer: BOEHM Guillaume <aur@mail.gboehm.com>

pkgname=joal-desktop-appimage
pkgver=2.0.17
pkgrel=1
pkgdesc="A desktop application for JOAL. Plug and play, no additional download or configuration needed."
arch=('x86_64')
url="https://github.com/anthonyraymond/joal-desktop"

license=('MIT')
depends=()
makedepends=(
  'fuse2'
)
# !strip necessary otherwise the AppImage file in the package is truncated
# !debug seems necessary on some systems too: https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/19
options=(!strip !debug)

_filename="JoalDesktop-${pkgver}-linux-${arch}.AppImage"
_squashfs_desktop_file="joal-desktop.desktop"
_destination_desktop_filename="joal-desktop.desktop"
_appimage_name=$(echo "${_filename}" | sed -E "s/-${pkgver}-linux-${arch}//")
_install_path="/opt/appimages/${_appimage_name}"

source=(
    "${url}/releases/download/v${pkgver}/${_filename}"
    "${url}/raw/v${pkgver}/LICENSE"
)
sha512sums=(
    96a1d4cdf5b1cb9adba0241acddf6f75e26e4089c45993a671babea7223ac0ff5ee6057cd10d6b174d08fd444fe7ff358f3a82f294da80224c5fb030d9024981
    SKIP
)

package() {

    echo "- Extracting appimage"
    echo "-- Set execution permissions"
    chmod +x "${_filename}"
    echo "-- Extracting icon"
    ./${_filename} --appimage-extract "usr/share/icons" > /dev/null 2>&1
    echo "-- Extracting desktop file"
    ./${_filename} --appimage-extract ${_squashfs_desktop_file} > /dev/null 2>&1
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/joal-desktop|" "squashfs-root/${_squashfs_desktop_file}"

    echo "- Create icons folder"
    install -dm755 "${pkgdir}/usr/share/icons/"
    echo "-- Copy icon files"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    echo "-- Set permissions on folder"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    echo "-- Set permissions on files"
    find "${pkgdir}/usr/share/icons" -type f -name "joal-desktop.png" -exec chmod 644 {} \;

    echo "- Install .desktop file and appimage file"
    # disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
    # disable AppimageLauncher integration prompt
    # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
    echo "-- Install desktop file"
    install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/usr/share/applications/${_destination_desktop_filename}"
    echo "-- Install appimage"
    install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
    echo "-- Set permissions for bin folder"
    mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    echo "-- Link appimage to bin/joal-desktop"
    ln -s "${_install_path}" "${pkgdir}/usr/bin/joal-desktop"

    echo "- Install licence file"
    # install license file
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/joal-desktop/LICENSE"

    echo "- Disable AppImage integration prompt"
    # disable AppImage integration prompt
    # https://github.com/electron-userland/electron-builder/issues/1962
    install -dm755 "${pkgdir}/usr/share/appimagekit"
}
