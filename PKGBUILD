# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=vk-messenger-appimage
pkgver=6.0.37.177
pkgrel=1
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
    '2b5043beb658045f8a37f145017899b6d222362bcea2b47567a20dab78d2a805'
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