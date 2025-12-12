# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=max-appimage
pkgver=25.12.0.510
pkgrel=1

pkgdesc="MAX messenger."
arch=("x86_64")
url='https://max.ru'
license=("custom:max")
categories=("network")
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
optdepends=(
    'libappindicator-gtk3: tray icon'
    'libayatana-appindicator: tray icon'
)
options=('!strip')

_app_name="MAX"
_filename="${_app_name}.AppImage"
_squashfs_desktop_file="${_app_name}.desktop"
_squashfs_icon_file="${_app_name}.png"
_install_path="/opt/appimages"

source_x86_64=("http://download.max.ru/electron/${_filename}")
sha256sums_x86_64=('2a62165974fce37f268037823178cfaac4e5f81c215d5df8564109fff7378281')

prepare() {
    chmod a+x ${srcdir}/${_filename}
    ${srcdir}/${_filename} --appimage-extract > /dev/null
    sed -i -E "s|Exec=AppRun|Exec=${_install_path}/${_filename}|" "squashfs-root/${_squashfs_desktop_file}"
}

package() {
    install -Dm755 "${srcdir}"/${_filename} "${pkgdir}"/${_install_path}/${_filename}

    # install icons
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"
    find "${pkgdir}/usr/share/icons" -type f -name "${_squashfs_icon_file}" -exec chmod 644 {} \;

    # install appication desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_squashfs_desktop_file}" -t "${pkgdir}/usr/share/applications"
}
