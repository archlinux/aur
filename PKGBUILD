# Maintainer: AzureZeng <weedycn at outlook.com>
# Contributor: chenlong <dragonlayoutt at gmail.com>
# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=another-redis-desktop-manager

pkgname="${_pkgname}-appimage"
pkgver=1.6.1
pkgrel=2
pkgdesc="A faster, better and more stable redis desktop manager"
arch=('x86_64')
url="https://github.com/qishibo/AnotherRedisDesktopManager"
license=("MIT")
depends=('fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"

source_x86_64=(
    "${_appimage}::${url}/releases/download/v${pkgver}/Another-Redis-Desktop-Manager.${pkgver}.AppImage"
    "https://raw.githubusercontent.com/qishibo/AnotherRedisDesktopManager/v${pkgver}/LICENSE"
)
noextract=("${_appimage}")
sha512sums_x86_64=('aa8dbe53aa53d29de3c7c843c353f0c69a50841735562a56b7210c96c1c1f1e39e23e90587a3d633c1429fe1370270b8f6361e392b6a91e50633234c5540d223'
                   'e29fec88dbf2d53b863c1660c30546921288e1abc4006d6d20b04cbc9fe66e83517bde2f595ae39510963fbd36f9f8e27bc3fa2895cac10b416dd6f6d0829072')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Adjust .desktop so it will work outside of AppImage container
    sed -i -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -Dm0644 "${srcdir}/squashfs-root/another-redis-desktop-manager.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/another-redis-desktop-manager.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
