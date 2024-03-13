# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=picturama-bin
_pkgname=Picturama
pkgver=1.3.0
_electronversion=9
pkgrel=2
pkgdesc="Digital image organizer powered by the web"
arch=("x86_64")
url="https://picturama.github.io/"
_ghurl="https://github.com/picturama/picturama"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
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
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-bin} %U|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/app.asar.unpacked/node_modules/sqlite3/lib/binding/electron-v9.0-linux-x64" \
        "${srcdir}/app.asar.unpacked/node_modules/sqlite3/lib/binding/electron-v9.4-linux-x64"
    rm -rf "${srcdir}/app.asar.unpacked/node_modules/sqlite3/lib/binding/electron-v9.0-linux-x64"
    sed "s|dbMigrationsFolder:a+\"\/migrations|dbMigrationsFolder:a+\"\/..\/..\/..\/${pkgname%-bin}/app/migrations|g" \
        -i "${srcdir}/app.asar.unpacked/dist/background.js"
    sed "s|dbMigrationsFolder:a+\"\/migrations|dbMigrationsFolder:a+\"\/..\/..\/..\/${pkgname%-bin}/app/migrations|g" \
        -i "${srcdir}/app.asar.unpacked/dist/app.js"
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