# Maintainer: Brian Allred <brian@allred.io>

_pkgname=hdr-launcher

pkgname="${_pkgname}"-appimage
pkgver=0.7.7
pkgrel=1
pkgdesc="Launcher for the HewDraw Remix conversion mod for Super Smash Bros. Ultimate"
arch=('x86_64')
url="https://github.com/techyCoder81/hdr-launcher-react/"
license=('MIT')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="HDRLauncher-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/techyCoder81/hdr-launcher-react/releases/download/v${pkgver}/HDRLauncher-${pkgver}.AppImage"
               "https://raw.githubusercontent.com/techyCoder81/hdr-launcher-react/v${pkgver}/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('6ffcf9f2eb3e459e01fc19e9193655e6680c0405e4d8390f8819e6fd0f3b8c68'
                   '5e98c15fe806a18f79422d2cd0c4587129f4e03081b5ab4c030627d6f6840d68')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract ${_pkgname}.desktop
    ./"${_appimage}" --appimage-extract usr/share/icons
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
        -e "s|HDRLauncher|HDR Launcher|" \
        -e "s|Development|Game|" \
        "squashfs-root/${_pkgname}.desktop"
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
