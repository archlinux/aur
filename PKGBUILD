# Maintainer: AzureZeng <weedycn at outlook.com>
# Contributor: chenlong <dragonlayoutt at gmail.com>
# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=another-redis-desktop-manager

pkgname="${_pkgname}-appimage"
pkgver=1.7.0
pkgrel=1
pkgdesc="A faster, better and more stable redis desktop manager"
arch=('x86_64')
url="https://github.com/qishibo/AnotherRedisDesktopManager"
provides=('another-redis-desktop-manager' 'another-redis-desktop-manager-appimage')
conflicts=('another-redis-desktop-manager')
license=("MIT")
depends=('fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"

source=(
    "https://raw.githubusercontent.com/qishibo/AnotherRedisDesktopManager/v${pkgver}/LICENSE"
)

source_x86_64=(
    "${_appimage}::${url}/releases/download/v${pkgver}/Another-Redis-Desktop-Manager-linux-${pkgver}-x86_64.AppImage"
)

noextract=("${_appimage}")
sha512sums=('e29fec88dbf2d53b863c1660c30546921288e1abc4006d6d20b04cbc9fe66e83517bde2f595ae39510963fbd36f9f8e27bc3fa2895cac10b416dd6f6d0829072')
sha512sums_x86_64=('37c4719c99ad59440823a19c09e2a1bbd3660880cb29113b8c4c9d212524ce339e19a2caeb425899e09cd9299afde54f71fed520478b009d38763520085efa64')

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
