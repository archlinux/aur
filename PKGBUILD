# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=calmly-writer-bin
_pkgname="Calmly Writer"
pkgver=2.0.54
pkgrel=3
pkgdesc="Calmly Writer is an editor designed to focus on what you want to tell, with a simple, unobtrusive and ease-to-use user interface."
arch=('aarch64' 'x86_64')
url="https://www.calmlywriter.com"
license=('custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron24' 'hicolor-icon-theme')
makedepends=('asar')
source_aarch64=("${pkgname%-bin}_${pkgver}-aarch64.deb::${url}/releases/linux/deb/arm64/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}_${pkgver}-x86_64.deb::${url}/releases/linux/deb/x64/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("LICENSE.html::${url}/eula.htm"
    "${pkgname%-bin}.sh")
sha256sums=('79f277c107ca3402d156db2ced6ea619a966216097c8d4d17692bada193b3edb'
            'df7583360a6f6607332c59670fc00f758f6bfc5ec2167b36e556f67e6446bd10')
sha256sums_aarch64=('dd7606298580fbf26c3882cdf83286db563680c9ef757cdceba6a605d8bbf11e')
sha256sums_x86_64=('91432bec316b83ef3a0e47815c4db9ec38903704e19c61e29f32782f327a3897')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}