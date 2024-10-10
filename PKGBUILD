# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailspring-bin
_pkgname=Mailspring
pkgver=1.14.0
_electronversion=30
pkgrel=2
pkgdesc="A beautiful, fast and fully open source mail client.Prebuilt version.Use system-wide electron."
arch=('x86_64')
url="https://getmailspring.com/"
_ghurl="https://github.com/Foundry376/Mailspring"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'krb5'
    'db5.3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('66998be9dd1090728ac67f8a1753840de01bd5b169f6ea210686c2bdb944f8bf'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto --password-store=\"gnome-libsecret\"/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/${_pkgname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -Dm644 "${srcdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
    install -Dm644 "${srcdir}/usr/share/lintian/overrides/${pkgname%-bin}" -t "${pkgdir}/usr/share/lintian/overrides"
}