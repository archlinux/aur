# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aniship-bin
pkgver=0.0.4.2
pkgrel=2
pkgdesc="A convenient and functional unofficial client that allows for easy viewing of anime on PCs and laptops."
arch=('x86_64')
url="https://t.me/aniship"
_githuburl="https://github.com/progzone122/AniShip"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron16' 'gcc-libs' 'glibc')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}night/setup-0.0.4-2.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('1fbe0e6388982d71268c4f4f04bf7c3f82ac0a6dee8310f8599d93be565525d2'
            '5fb5356053631c4ac7ad2ab51f0f4738569d918b9c4407f7db64ba05d7be8896')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}-night.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${pkgname%-bin}-night|Icon=${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}-night.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}-night.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}