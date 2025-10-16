# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=overte
_pkgname_addition="-nodebug"
pkgname=${_pkgname}-appimage
pkgver=2025.10.1
pkgrel=1
pkgdesc="Overte open source virtual worlds platform. "
arch=('x86_64')
url="https://github.com/overte-org/overte"
license=('Apache-2.0')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://overte-public.fra1.digitaloceanspaces.com/build/overte/release/${pkgver}/Overte-${pkgver}-x86_64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('184e056601c0509e0c339e2ab0c17a0d2b46ed07e88bb6187488ce32049e00a3')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname^} %u|"\
        "squashfs-root/org.overte.interface.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/org.overte.interface.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname^}.desktop"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname^}"
}
