# Maintainer: Vixi <vixi@snowsune.net>
# Adapted from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html


_pkgname=fchat

pkgname="${_pkgname}"-horizon-appimage
pkgver=2.3.0
pkgrel=1
pkgdesc="The Best F-Chat 3.0 Client, No exceptions! (Appimge release)"
arch=('x86_64')
url="https://github.com/Fchat-Horizon/Horizon"
license=('GPL-3')
provides=(fchat)
conflicts=(fchat)
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/Fchat-Horizon/Horizon/releases/download/v${pkgver}/F-Chat.Horizon-${pkgver}-linux-x86_64.AppImage
"
               "https://raw.githubusercontent.com/Fchat-Horizon/Horizon/v${pkgver}/LICENSE.md"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('c4fc9e3d179a6be1f7566b941d6e680d89be77f117a3b6e9dde8ae883b5a803c'
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
    install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/opt/${pkgname}/LICENSE.md"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/horizon-electron.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon image
    install -Dm644 \
        "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/horizon-electron.png" \
        "${pkgdir}/usr/share/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
