# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Pieter Verweij <git at pieterv24 dot dev>

_pkgname=eh-vial
_Pkgname=Vial
_Pkgname_EH=EH-Vial

pkgname="${_pkgname}"-appimage
# pkgname=vial-appimage
pkgver=0.7.5_eh_2026_03_28
pkgver_eh=0.7.5-eh-2026-03-28
pkgrel=1
pkgdesc="Vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QMK fork for configuring your keyboard in real time, similar to VIA. ErgoHaven edition"
arch=('x86_64')
url="https://vial.ergohaven.xyz"
license=("GPL2")
options=(!strip)
provides=("vial=${pkgver}")
conflicts=(vial)
depends=(fuse2)
_appimage="Vial-x86_64.AppImage"
source_x86_64=("${_appimage}::https://github.com/ergohaven/vial-gui/releases/download/${pkgver_eh}/Vial-x86_64.AppImage"
               "59-vial.rules")
noextract=("${_appimage}")
sha256sums_x86_64=('50c9d707d7389a5a838d64b4375ca9f77b92987472e9660e0af1af0bb9589ca4'
                   'b732cc95f26691f2c8c28a8cad0450559528838b44351abf66d2c96991cd4f11')
prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=Vial|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_Pkgname_EH}|"\
        "squashfs-root/${_Pkgname}.desktop"
    sed -i -E "s|Name=Vial|Name=${_Pkgname_EH}|"\
        "squashfs-root/${_Pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_Pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_Pkgname_EH}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_Pkgname_EH}"

    # Create udev rule
    install -Dm644 "$srcdir/59-vial.rules" "$pkgdir/usr/lib/udev/rules.d/59-vial.rules"
}

