# Maintainer: Deinara <christiaan.blom at mail dot com>

pkgname=beyondallreason-appimage
pkgver=1.2988.0
pkgrel=3
pkgdesc="The latest release of BYAR-Chobby, the launcher for Beyond All Reason - An open source RTS game built on top of the Spring RTS Engine"
arch=('x86_64')
url="https://www.beyondallreason.info"

license=('GPL' 'CC-BY-SA-4.0' 'CC-BY-NC-ND-4.0')
depends=('sdl2' 'fuse2' 'openal' 'gtk3' 'alsa-lib' 'nss' 'binutils' 'zlib')
options=(!strip !debug) # necessary otherwise the AppImage file in the package is truncated
source=(
  https://github.com/beyond-all-reason/BYAR-Chobby/releases/download/v${pkgver}/Beyond-All-Reason-${pkgver}.AppImage
)
sha512sums=('d549cfce08f9a61ce9e80ce6a33c21302b91a2a656b1987884146c4712c4e5bcbb02e7bb081c276f63222b2664ce819a6371bba54e0bead8198197a70338d0a9')
_filename="Beyond-All-Reason-${pkgver}.AppImage"
_squashfs_desktop_file="beyond-all-reason.desktop"
_desktop_file="/usr/share/applications/beyond-all-reason.desktop"
_appimage_name=$(echo "${_filename}"|sed -E 's/-[0-9]*.[0-9]*.[0-9]*//')
_install_path="/opt/appimages/${_appimage_name}"

package() {

    chmod +x "${_filename}"
    mkdir -p squashfs-root/usr/share/icons/hicolor/256x256/apps
    ./${_filename} --appimage-extract "usr/share/icons/hicolor/0x0/apps/beyond-all-reason.png" > /dev/null 2>&1
    ./${_filename} --appimage-extract beyond-all-reason.desktop > /dev/null 2>&1

    # Change name in .desktop file
    sed -i -E "s|Name=Beyond-All-Reason|Name=Beyond All Reason|" "squashfs-root/${_squashfs_desktop_file}"

    # Add "BAR" as a keyword, allowing to search for "BAR" in the launcher
    echo "Keywords=BAR;" >> "squashfs-root/${_squashfs_desktop_file}"

    # install icons
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons/hicolor/0x0/apps/beyond-all-reason.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f -name "beyond-all-reason.png" -exec chmod 644 {} \;

    # install .desktop file and image file
    # disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
    # disable AppimageLauncher integration prompt
    # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
    sed -i -E "s|Exec=AppRun --no-sandbox %U|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/beyondallreason --no-sandbox|" "squashfs-root/${_squashfs_desktop_file}"
    install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
    install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
    mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    ln -s "${_install_path}" "${pkgdir}/usr/bin/beyondallreason"

    # disable AppImage integration prompt
    # https://github.com/electron-userland/electron-builder/issues/1962
    install -dm755 "${pkgdir}/usr/share/appimagekit"
}

