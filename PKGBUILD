# Maintainer: Alesar1

_pkgname=telegram-a
realname=telegram-t

pkgname="${_pkgname}"-appimage
pkgver=10.9.48
pkgrel=1
pkgdesc="Official Telegram Web client version A AppImage version"
arch=('x86_64')
url="https://web.telegram.org/a/get/"
license=('GPL3')
depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/Ajaxy/telegram-tt/releases/download/v${pkgver}/Telegram-A-x86_64.AppImage"
               "https://github.com/Ajaxy/telegram-tt/raw/v${pkgver}/LICENSE")
noextract=("${_appimage}")
sha256sums_x86_64=('2364cc436caf038f5751efb1bb56aeb75c266d47bf6676172b75b93e6a49347e'
                   'e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${realname}.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${realname}.desktop"\
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
