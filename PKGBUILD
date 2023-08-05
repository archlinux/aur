# Maintainer: Daniel Head <archlinux at danhead dot me>

pkgname=playback-appimage
pkgver=1.0.2
pkgrel=1
pkgdesc="Playback software for Epilogue's GB Operator"
arch=('x86_64')
url="https://www.epilogue.co"
license=()
options=(!strip)
source=(
  https://epilogue.nyc3.digitaloceanspaces.com/releases/software/Playback/version/${pkgver}/release/linux/Playback.AppImage
)
sha512sums=(
  2df674ebfd99c76a24ef56ca58821dd2ff45659fc62a5065276aacf595cc99e3ee312f9d81e06b166c93d78d02158c6fc522ccca1a3538ad9ffba5e49e083f88
)
_filename="Playback.AppImage"
_squashfs_desktop_file="Playback.desktop"
_desktop_file="/usr/share/applications/playback.desktop"
_appimage_name="Playback.AppImage"
_install_path="/opt/appimages/${_appimage_name}"

package() {
    chmod +x "${_filename}"
    ./${_filename} --appimage-extract "usr/share/icons/hicolor/*/apps/Playback.png" > /dev/null 2>&1
    ./${_filename} --appimage-extract Playback.desktop > /dev/null 2>&1

    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f -name "Playback.png" -exec chmod 644 {} \;

    install -Dm644 "squashfs-root/${_squashfs_desktop_file}" "${pkgdir}/${_desktop_file}"
    install -Dm755 "${_filename}" "${pkgdir}/${_install_path}"
    mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
    ln -s "${_install_path}" "${pkgdir}/usr/bin/Playback"
}
