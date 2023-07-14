# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=hyperkeys-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Unleash you keyboard shorcuts"
arch=('x86_64')
url="https://hyperkeys.xureilab.com/"
_githuburl="https://github.com/xurei/hyperkeys"
license=('GPL3')
conflits=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('bash' 'electron20')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/HyperKeys-${pkgver}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('2884e6025aa4dfee198f1279584e8ec798d8f9519cbe8c6ed1f4648b26e63711'
            '6c5542dd0968280fb9c2bce2957dd0b7bb6e8b5ed4c870a7e909bf980d5d2aff')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/squashfs-root/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}