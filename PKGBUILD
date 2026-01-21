# Maintainer: roukaixin <a3427173515@gmail.com>

_pkgname=termora
_u_pkgname=Termora
pkgname=${_pkgname}-appimage
pkgver=1.0.17
pkgrel=3
pkgdesc="Termora is a cross-platform terminal emulator and SSH client, available on Windows, macOS, and Linux."
arch=('x86_64' 'aarch64')
url="https://github.com/TermoraDev/termora"

license=("AGPL-3.0-only" "LicenseRef-Proprietary")


source=("LICENSE::https://raw.githubusercontent.com/TermoraDev/termora/${pkgver}/README.md")

source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x86-64.AppImage")
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-aarch64.AppImage")
sha256sums=('195f85095c638be287eb653ff9bbb80d3dc1507528f72402e38dbaf31c57ce05')
sha256sums_x86_64=('87eb74468455c69bb2411c592e2c09d90f10af859ff8fa29ff1cc6141940e4a4')
sha256sums_aarch64=('0827e39143dd616320d7c49c9c98b3352cfe48a4183952420fc75ecd0d581ea0')

_appimage="${pkgname}-${pkgver}-${CARCH}.AppImage"
noextract=("${_appimage}")

makedepends=("desktop-file-utils")

conflicts=("termora-bin")


options+=("!strip" "!debug")


prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract ${_u_pkgname}.desktop
    ./"${_appimage}" --appimage-extract lib/${_u_pkgname}.png
}

build() {
    desktop-file-edit \
       --set-key=Exec --set-value="env DESKTOPINTEGRATION=false /usr/bin/termora %U" \
       --set-key=Icon --set-value="/usr/share/icons/${_pkgname}.png" \
        squashfs-root/${_u_pkgname}.desktop
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_u_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    install -Dm644 "${srcdir}/squashfs-root/lib/${_u_pkgname}.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    # install -Dm755 "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    ln -rs "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    # install -Dm755 "${srcdir}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname"
    ln -rs "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    
}

