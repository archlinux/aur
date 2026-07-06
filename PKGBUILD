# Maintainer: Wrxn <arch at rnny dot xyz>
_pkgname=Tkmm
pkgname=tkmm-appimage
pkgver=2.1.4
pkgrel=1
pkgdesc="TotK Mod Manager, a mod manager and merger for Tears of the Kingdom"
arch=('x86_64')
url="https://tkmm.org"
_gh="https://github.com/TKMM-Team/Tkmm"
_ghraw="https://raw.githubusercontent.com/TKMM-Team/Tkmm"
license=('MIT')
options=(!strip)
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
_appimage="${pkgname%-appimage}-${pkgver}.AppImage"
source=(
    "${_appimage}::${_gh}/releases/download/v${pkgver}/${_pkgname}-linux-x64.AppImage"
    "LICENSE-${pkgver}::${_ghraw}/v${pkgver}/License.md"
)
noextract=("${_appimage}")
sha256sums=('47137ad4e0648ecb28f66125bbad1692b0cb18bfd4d239f2ba5f94f3b21b8014'
            'f61e96cc0d00ece12e001f021cb5732bb9954dd8dc7c0d9c47e4ba499b18a58c')
prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}
build() {
    sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
        "squashfs-root/${_pkgname}.desktop"

    sed -i -E "s|Path=/usr/bin/Tkmm|Path=/opt/${pkgname}|" "squashfs-root/${_pkgname}.desktop"

    sed -i -E "s|Comment=$|Comment=${pkgdesc}|" "squashfs-root/${_pkgname}.desktop"

    chmod -R a-x+rX squashfs-root/usr
}
package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/opt/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -dm755 "${pkgdir}/usr/share/icons"
    cp -a "${srcdir}/squashfs-root/tkmm.svg" "${pkgdir}/usr/share/icons/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
