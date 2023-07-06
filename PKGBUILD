# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="aniship-bin"
pkgver=0.0.4
pkgrel=1
pkgdesc="A convenient and functional unofficial client that allows for easy viewing of anime on PCs and laptops."
arch=('x86_64')
url="https://t.me/aniship"
_githuburl="https://github.com/progzone122/AniShip"
license=('custom')
conflicts=("${pkgname%-bin}")
depends=('electron' 'gcc-libs' 'glibc')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}-night/setup-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('344a3c493d52a33a1cc522e401f760fce653357ac3dc726b458739d6b1038f2b'
            'dda7e4f0b91ac9ee3b9aa5d72f985899234684e7973442ce9cdc4905da16b72e')
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