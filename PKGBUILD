# Maintainer:  Narinas <eatrujillo@protonmail.com>

pkgname=mindomo-bin
_pkgname=mindomo
pkgver=10.1.7
pkgrel=1
pkgdesc="Mindomo is an online collaborative mind mapping, concept mapping and outlining software for visualizing and organizing information."
arch=('x86_64')
url="https://www.mindomo.com"
license=('custom:mindomo')
provides=('mindomo')
conflicts=('mindomo')
_basever=10.1
_app_image="Mindomo_v.${pkgver}_x64.AppImage"
noextract=("${_appimage}")

source_x86_64=("https://www.mindomo.com/download/${_basever}/${_app_image}")

sha256sums_x86_64=('d0a3f12ce9e28f449751a4e964a3b84e2e008bebcc8037e1ab3309f1aa44a357')

prepare() {
   chmod +x "$_app_image"
   ./"${_app_image}" --appimage-extract
}
build() {
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %u|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}
package() {
    install -dm755 "${pkgdir}/opt/${pkgname}/"
    cp -r "${srcdir}/${_app_image}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

