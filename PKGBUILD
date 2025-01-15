# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=vk-messenger-appimage
pkgver=6.0.51.318
pkgrel=0
pkgdesc="VK Messenger for Linux in the appimage package format"
arch=('x86_64')
url="https://vk.me/app"
license=('custom')
replaces=("vk-messenger")
options=(!strip)

_app_name="vk-messenger"
_appimage_name=${_app_name}".AppImage"
_install_path="/opt/${pkgname}/"

source=(
    https://upload.object2.vk-apps.com/vk-me-desktop-dev-5837a06d-5f28-484a-ac22-045903cb1b1a/latest/${_appimage_name}
)
noextract=("${_appimage_name}")
sha256sums=(
    '01b4b67a7320a8c405d5aecd324ffe73a4e27b0fd7173e27a2d5ec2d75a44cd5'
)

prepare() {
    cd ${srcdir}
    chmod a+x ${_appimage_name}
    ./"${_appimage_name}" --appimage-extract > /dev/null
    sed 's|Exec=AppRun|Exec='${_install_path}${_appimage_name}'|g' -i "${srcdir}/squashfs-root/${_app_name}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${_appimage_name}" "${pkgdir}${_install_path}${_appimage_name}"
    mkdir -p "${pkgdir}/usr/share/icons/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons"  "${pkgdir}/usr/share/"
    install -Dm644 "${srcdir}/squashfs-root/${_app_name}.desktop" -t "${pkgdir}/usr/share/applications"
}
