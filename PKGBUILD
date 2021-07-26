# Maintainer: Joe <kenwood364@gmail.com>
# Adapted from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html


_pkgname=fchat

pkgname="${_pkgname}"-appimage
pkgver=3.0.16
pkgrel=1
pkgdesc="The F-Chat 3.0 client."
arch=('x86_64')
url="https://wiki.f-list.net/F-Chat_3.0/"
license=('MIT')
provides=(fchat)
conflicts=(fchat)
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://client.f-list.net/fchat.AppImage"
               "https://raw.githubusercontent.com/f-list/exported/master/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('SKIP'
                   'SKIP')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|"\
        "squashfs-root/${_pkgname}.desktop" # Adjust bin location
    sed -i -E "s|Icon=icon|Icon=/usr/share/${_pkgname}.png|"\
        "squashfs-root/${_pkgname}.desktop" # Adjust desktop icon
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

    # Icon image
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
