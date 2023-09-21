# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bbg-bin
pkgver=20230820
pkgrel=2
pkgdesc="A static blog generator based on Electron Technology"
arch=('aarch64' 'x86_64')
url="https://bbg.nekomoe.xyz/"
_githuburl="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('asar')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/bbg-contributors/bbg/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('436a6d536138f203ac333858cff92a568be62797752b3adb94bcaa0f6ffe7ef6'
            'f829d8db73a95e76349d8e3c2c2e13b4bdfc802d3f98f9af5bc198464a3a8742')
sha256sums_aarch64=('f51af1e9f386097b40bd8f92f5c00784b8eac88cd3866101d014bad41c21ff0c')
sha256sums_x86_64=('c8b342c0c4e8d60230bfaea9b65a0ed757f32fc82c4ce18b1c1049fa96fff32a')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    chmod a+x "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage"
    "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage|${pkgname%-bin}|g;s|/usr/share/icons/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}