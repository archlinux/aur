# Maintainer: chenlong <dragonlayoutt@gmail.com>
# Based  on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html

_pkgname=another-redis-desktop-manager

pkgname="${_pkgname}-appimage"
pkgver=1.5.9
pkgrel=1
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
sha512sums_x86_64=(
    'ed3349c75d13c4bbd777194f8714a26f42d27a41a02658d1a324e40ae3a434c1fca483b817cff4589d4668d83a5b93723e0afbb82e443da3427d6fe39bfd44db'
    'e29fec88dbf2d53b863c1660c30546921288e1abc4006d6d20b04cbc9fe66e83517bde2f595ae39510963fbd36f9f8e27bc3fa2895cac10b416dd6f6d0829072'
)

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
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
            "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}