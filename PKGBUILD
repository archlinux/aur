# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="anubias-bin"
pkgver=1.0.0beta1
_pkgver=1.0.0-beta1
pkgrel=1
pkgdesc="Develope mobile apps so easy and native with GUI"
arch=('x86_64')
url="https://anubias.app"
_githuburl=https://github.com/4xmen/anubias
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron' 'hicolor-icon-theme' 'glibc' 'java-runtime')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/dl/Anubias-${_pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('ce38818ef998e4b8b04f2b55afbc8d4aa7510b1a720f795579a7a856a3894307'
            '875ca7c1146b056acf7c77170d0651ef92ed27e085140d5adc25e24ad76f0c16')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}