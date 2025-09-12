# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=vk-messenger-appimage
pkgver=6.0.54.338
pkgrel=2
pkgdesc="VK Messenger for Linux in the appimage package format"
arch=('x86_64')
url="https://vk.me/app"
license=('custom')
replaces=("vk-messenger")
options=(!strip)

_app_name="vk-messenger"
_filename="${_app_name}.AppImage"
_squashfs_desktop_file="${_app_name}.desktop"
_squashfs_icon_file="${_app_name}.png"
_install_path="/opt/appimages"

source=(
    https://upload.object2.vk-apps.com/vk-me-desktop-dev-5837a06d-5f28-484a-ac22-045903cb1b1a/latest/${_filename}
)
noextract=("${_filename}")
sha256sums=('54c7354eab6d6689b49e5846809abfa691e0c2fc457ca2dd9aebc8f82a3e21a2')

prepare() {
    cd ${srcdir}
    chmod a+x ${_filename}
    ./"${_filename}" --appimage-extract > /dev/null
    sed 's|Exec=AppRun|Exec='${_install_path}${_filename}'|g' -i "${srcdir}/squashfs-root/${_squashfs_desktop_file}"
}

package() {
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}${_install_path}${_appimage_name}"

    # install icons
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f -name "${_squashfs_icon_file}" -exec chmod 644 {} \;

    # install appication desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_squashfs_desktop_file}" -t "${pkgdir}/usr/share/applications"
}
