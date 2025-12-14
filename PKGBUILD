# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

_pkgname=discord-bot-client

pkgname="${_pkgname}"-appimage
pkgver=3.8.2
pkgrel=1
pkgdesc="A patched version of discord, with bot login & Vencord support"
arch=('x86_64')
url="https://github.com/aiko-chan-ai/DiscordBotClient/"
license=('GPL-3.0-or-later')
depends=('zlib' 'fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/aiko-chan-ai/DiscordBotClient/releases/download/v${pkgver}/DiscordBotClient-linux-x86_64.AppImage"
               "https://raw.githubusercontent.com/aiko-chan-ai/DiscordBotClient/refs/tags/v${pkgver}/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('55c98a63b5288ef37797768af1bda347bcbd8bb12734060ea104d61d7dad5d0c'
                   '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

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
