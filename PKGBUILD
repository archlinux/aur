# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aniship-bin
pkgver=0.0.4.2
pkgrel=3
pkgdesc="A convenient and functional unofficial client that allows for easy viewing of anime on PCs and laptops."
arch=('x86_64')
url="https://t.me/aniship"
_githuburl="https://github.com/progzone122/AniShip"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron16')
makedepends=('squashfuse' 'asar')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}night/setup-${pkgver//.2/-2}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('1fbe0e6388982d71268c4f4f04bf7c3f82ac0a6dee8310f8599d93be565525d2'
            '79c7eb23fcafd633fb357bc462ac457d781f027dfe1ccb55ee966dec94c32489')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed -e "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" \
        -e "s|Icon=${pkgname%-bin}-night|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-bin}-night.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -perm 700 -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644  "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    cp -r "${srcdir}/squashfs-root/resources/sources" "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/opt/${pkgname%-bin}/usr/lib"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/opt/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}-night.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}-night.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}