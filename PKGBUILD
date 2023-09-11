# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=anubias-bin
_pkgname=Anubias
pkgver=1.0.0_beta1
pkgrel=4
pkgdesc="Develope mobile apps so easy and native with GUI"
arch=('x86_64')
url="https://anubias.app"
_githuburl=https://github.com/4xmen/anubias
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron>=13' 'hicolor-icon-theme' 'glibc' 'java-runtime')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/dl/${_pkgname}-${pkgver//_/-}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('ce38818ef998e4b8b04f2b55afbc8d4aa7510b1a720f795579a7a856a3894307'
            'd389996167147a103273a0a42b2fd895be3f96eeee3bad965e554c9c26807e71')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/resources" "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime"
}