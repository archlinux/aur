# Maintainer: thynkon <thynkon at protonmail dot com>

pkgname=mp3-tagger-appimage
pkgver=0.1.4
pkgrel=1
pkgdesc="An Electron app to edit metadata of mp3 files with online search capability"
arch=('x86_64' 'i686')
url="https://github.com/Mohammadreza99A/mp3-tagger"
license=('MIT')
conflicts=("mp3-tagger")
depends=('fuse2')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  ${url}/releases/download/v${pkgver}/Mp3Tagger-${pkgver}.AppImage
  ${url}/raw/v${pkgver}/LICENSE
)
sha256sums=('227fbe13b0a0c1fa0d29aebe8c7452dc2a7b4f8c9bfa2a91171138d0f2d0c25c'
            'c12e900f2ab9f0bd46d2d0151974ed36561450db63c83c46bf70934eb455a8d7')
_filename="Mp3Tagger-${pkgver}.AppImage"
_squashfs_desktop_file="mp3-tagger.desktop"
_desktop_file="/usr/share/applications/mp3-tagger.desktop"
_appimage_name=$(echo "${_filename}"|sed -E 's/-[0-9]*.[0-9]*.[0-9]*//')
_install_path="/opt/appimages/${_appimage_name}"

package() {
    chmod +x "${_filename}"
    mkdir -p squashfs-root/usr/share/icons/hicolor/{72x72,16x16}/apps
    ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/mp3-tagger.png" > /dev/null 2>&1
    ./${_filename} --appimage-extract mp3-tagger.desktop > /dev/null 2>&1
    sed -i -E "s|Exec=AppRun|Exec=${_install_path}|" "squashfs-root/${_squashfs_desktop_file}"
    sed -i -E "s|Icon=mp3-tagger|Icon=mp3-tagger|" "squashfs-root/${_squashfs_desktop_file}"

    # install icons
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f -name "mp3-tagger.png" -exec chmod 644 {} \;

    # install .desktop file and image file
    # disable appimage desktop integration: https://github.com/AppImage/AppImageSpec/blob/master/draft.md#desktop-integration
    # disable AppimageLauncher integration prompt
    # https://github.com/TheAssassin/AppImageLauncher/issues/78#issuecomment-466390939
    sed -i -E "s|Exec=${_install_path}|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/mp3-tagger|" "squashfs-root/${_squashfs_desktop_file}"
    install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
    install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
    mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    ln -s "${_install_path}" "${pkgdir}/usr/bin/mp3-tagger"

    # install license file
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/mp3-tagger-appimage/LICENSE"

    # disable AppImage integration prompt
    # https://github.com/electron-userland/electron-builder/issues/1962
    install -dm755 "${pkgdir}/usr/share/appimagekit"
}

