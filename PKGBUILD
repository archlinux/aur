# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Pieter Verweij <git at pieterv24 dot dev>

_pkgname=vial
_Pkgname=Vial

pkgname="${_pkgname}"-appimage
pkgname=vial-appimage
pkgver=0.7.5
pkgrel=2
pkgdesc="Vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QMK fork for configuring your keyboard in real time, similar to VIA."
arch=('x86_64')
url="https://get.vial.today/"
license=("GPL2")
options=(!strip)
provides=("vial=${pkgver}")
conflicts=(vial)
depends=(fuse2)
_appimage="${_Pkgname}-${pkgver}-x86_64.AppImage"
source_x86_64=("${_appimage}::https://github.com/vial-kb/vial-gui/releases/download/v${pkgver}/${_Pkgname}-v${pkgver}-x86_64.AppImage"
               "59-vial.rules")
noextract=("${_appimage}")
sha256sums_x86_64=('b0df22fcc38f85a2d9e2224d2b3fcc76944819365557f1b9a83ee8f880fc7403'
                   'b732cc95f26691f2c8c28a8cad0450559528838b44351abf66d2c96991cd4f11')
prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=Vial|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_Pkgname}|"\
        "squashfs-root/${_Pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_Pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_Pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_Pkgname}"

    # Create udev rule
    install -Dm644 "$srcdir/59-vial.rules" "$pkgdir/usr/lib/udev/rules.d/59-vial.rules"
}

