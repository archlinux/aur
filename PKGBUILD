# Maintainer: Tymon3310 <aur@tymon3310.dev>

_pkgname=vial-keychron
_Pkgname=Vial

pkgname="${_pkgname}-bin"
pkgver=0.8.2
pkgrel=1
pkgdesc="Vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QMK fork for configuring your keyboard in real time, similar to VIA. Keychron branch."
arch=('x86_64')
url="https://github.com/Tymon3310/vial-gui"
license=("GPL-2.0-only")
options=(!strip !debug)
provides=("vial" "vial-keychron")
conflicts=("vial" "vial-appimage" "vial-git" "vial-keychron-git")
depends=("zlib" "fuse2" "hicolor-icon-theme")
_appimage="Vial-x86_64.AppImage"
source_x86_64=("${_appimage}::https://github.com/Tymon3310/vial-gui/releases/download/v${pkgver}/Vial-x86_64.AppImage"
               "59-vial.rules")
noextract=("${_appimage}")
sha256sums_x86_64=('3035b3424f94b0c1b2d937f0f942499b38bd5b3f804b70f351c88b9ed9c2c2ae'
                   'a6af0820ee6960dccab9ce0df0a898ccd0a50fecd992e341656dd1af78680502')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=Vial|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        "squashfs-root/${_Pkgname}.desktop"
}

package() {
    # Install the raw AppImage to /opt
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    # Install Desktop file from the extracted AppImage
    install -Dm644 "${srcdir}/squashfs-root/${_Pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Install Icon image from the extracted AppImage
    install -Dm644 "${srcdir}/squashfs-root/Vial.png" \
            "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/Vial.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Create udev rule
    install -Dm644 "$srcdir/59-vial.rules" "$pkgdir/usr/lib/udev/rules.d/59-vial.rules"
}
