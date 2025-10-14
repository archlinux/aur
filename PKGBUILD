# Maintainer: Vixi <vixi@snowsune.net>
# Adapted from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html


_pkgname=fchat

pkgname="${_pkgname}"-horizon-appimage
pkgver=1.34.1
pkgrel=2
pkgdesc="An Opinionated F-Chat Fork (previously f-chat rising)"
arch=('x86_64')
url="https://github.com/Fchat-Horizon/Horizon"
license=('GPL-3')
provides=(fchat)
conflicts=(fchat)
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/Fchat-Horizon/Horizon/releases/download/v${pkgver}/F-Chat.Horizon-linux-x86_64.AppImage"
               "https://raw.githubusercontent.com/Fchat-Horizon/Horizon/v${pkgver}/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('1d04afcf3ce18d3a012334cbba36af2de40ffaeb5255c8b0c788d2c86bf62038'
                   'SKIP')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
    "squashfs-root/horizon-electron.desktop"
    sed -i -E "s|Icon=.*|Icon=/usr/share/${_pkgname}.png|" \
    "squashfs-root/horizon-electron.desktop"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/horizon-electron.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon image
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/horizon-electron.png" "${pkgdir}/usr/share/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
