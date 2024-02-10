# Maintainer: senft <senftt@gmail.com>

_pkgname=en-croissant

pkgname="${_pkgname}"-appimage
pkgver=0.9.0
pkgrel=1
pkgdesc="A Modern Chess Database"
arch=('x86_64')
url="https://github.com/franciscoBSalgueiro/en-croissant"
license=('GPL-3.0')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"

source_x86_64=("${_appimage}::https://github.com/franciscoBSalgueiro/en-croissant/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('4e3d760ca28358a126dfc45924a2fad14b223ac18b7c7641053a40adbe0f822f')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

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
