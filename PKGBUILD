# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=overte
pkgname=${_pkgname}-appimage
pkgver=2022.12.1
pkgrel=1
pkgdesc="Overte open source virtual worlds platform. "
arch=('x86_64')
url="https://github.com/overte-org/overte"
license=('APACHE')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/overte-org/overte/releases/download/${pkgver}/Overte-${pkgver}-x86_64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('dd99465cdac958f85be98378b1db6c12e8e19b114bbbe0d69e5ea1fb09fdd948')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname^} %u|"\
        "squashfs-root/${_pkgname^}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname^}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname^}.desktop"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname^}"
}
