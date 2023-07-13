# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="fairshare-bin"
pkgver=2.1.0
pkgrel=1
pkgdesc="Simplifying the curation and sharing of biomedical research data and software according to applicable FAIR guidelines"
arch=('x86_64')
url="https://fairdataihub.org/fairshare"
_githuburl="https://github.com/fairdataihub/FAIRshare"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron25' 'zlib' 'glibc' 'bash')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/FAIRshare-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/fairdataihub/FAIRshare/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('9c6bf87ec638dcb3dc44de81e268a57453f26c4e345023a3664ed0f744c2a7c3'
            'f53ab2779598ebdd8bef9425c402eed3cac0e2a6dc3ec5cbda5a07de0bdcf7dc'
            'cea3d411d1b900fcc4e01c415e2e57c4d3e29a3dbf98ea6b6edebbc30b7b5ff5')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
