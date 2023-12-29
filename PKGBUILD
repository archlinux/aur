# Maintainer: timofei302 <timofei302 at proton dot me>

pkgname=hypersomnia-appimage
pkgver=1.2.8674
pkgrel=1
pkgdesc="Online shooter with relentless dynamics."
arch=('x86_64')
url="https://hypersomnia.xyz"
license=('AGPL3')
conflicts=('hypersomnia-git')
depends=('fuse2')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  ${url}/builds/latest/Hypersomnia.AppImage
)
sha512sums=(
  SKIP
)
_filename="Hypersomnia.AppImage"
_squashfs_desktop_file="Hypersomnia.desktop"
_desktop_file="/usr/share/applications/Hypersomnia-appimage.desktop"
_appimage_name=$(echo "${_filename}"|sed -E 's/-[0-9]*.[0-9]*.[0-9]*//')
_install_path="/opt/hypersomnia/${_appimage_name}"

package() {
    chmod +x "${_filename}"
    mkdir -p squashfs-root/usr/share/icons/hicolor/64x64/apps
    ./${_filename} --appimage-extract "usr/share/icons/hicolor/64x64/apps/Hypersomnia.png" > /dev/null 2>&1
    echo "#\!/usr/bin/env xdg-open
[Desktop Entry]
Type=Application
Categories=Game
Name=Hypersomnia
Comment=Online shooter with relentless dynamics.
Exec=hypersomnia
Icon=Hypersomnia
StartupNotify=false
Terminal=false" >> squashfs-root/Hypersomnia.desktop

    # install icons
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f -name "Hypersomnia.png" -exec chmod 644 {} \;

    # install .desktop file and image file

    install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
    install -Dm777 "${_filename}" "${pkgdir}/${_install_path}"
    chmod 777 -R "${pkgdir}/opt/hypersomnia/" # It is necessary for correct auto-update
    mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    ln -s "${_install_path}" "${pkgdir}/usr/bin/hypersomnia"

    # disable AppImage integration prompt
    # https://github.com/electron-userland/electron-builder/issues/1962
    install -dm755 "${pkgdir}/usr/share/appimagekit"
}
