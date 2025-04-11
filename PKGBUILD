# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=picturama-bin
_pkgname=Picturama
pkgver=1.3.0
_electronversion=9
pkgrel=5
pkgdesc="Digital image organizer powered by the web.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://picturama.github.io/"
_ghurl="https://github.com/picturama/picturama"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-1.3.1.AppImage"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/picturama/picturama/master/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('a40fc27395841cf3220ed7db3ba98717d3b3a24fc1733b81759218fbd28c3e3a'
            'b8ff1b44d19d011a234dc2490176e17231321a397f742088679c6c96555aba25'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun/${pkgname%-bin} %U/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -Pr --no-preserve=ownership "${srcdir}/app.asar.unpacked/node_modules/sqlite3/lib/binding/electron-v9.0-linux-x64" \
        "${srcdir}/app.asar.unpacked/node_modules/sqlite3/lib/binding/electron-v9.4-linux-x64"
    rm -rf "${srcdir}/app.asar.unpacked/node_modules/sqlite3/lib/binding/electron-v9.0-linux-x64"
    find "${srcdir}/app.asar.unpacked/dist" -type f -exec sed -i "s/process.resourcesPath/\"\/usr\/lib\/${pkgname%-bin}\"/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app/migrations/"*.sql -t "${pkgdir}/usr/lib/${pkgname%-bin}/app/migrations"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}