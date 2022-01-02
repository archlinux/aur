# Maintainer: Joe <kenwood364@gmail.com>
# Adapted from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html


_pkgname=fchat

pkgname="${_pkgname}"-rising-appimage
pkgver=1.16.2
pkgrel=1
pkgdesc="A heavily customized version of the mainline F-Chat 3.0 client."
arch=('x86_64')
url="https://github.com/mrstallion/fchat-rising/"
license=('MIT')
provides=(fchat)
conflicts=(fchat)
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/mrstallion/fchat-rising/releases/download/v${pkgver}/F-Chat-Rising-${pkgver}-linux.AppImage"
               "https://raw.githubusercontent.com/mrstallion/fchat-rising/v${pkgver}/LICENSE"
              )
noextract=("${_appimage}")
sha256sums_x86_64=('ae4a4edaa311d66a969ea8f6c99ffb74f40fb9a3352eb5ae1bfdd2f01171cef3'
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