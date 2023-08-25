# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ffbox
_pkgname=FFBox
pkgver=3.0
pkgrel=1
pkgdesc="An user-friendly ffmpeg GUI.一个多媒体转码百宝箱 / 一个 FFmpeg 的套壳"
arch=('any')
url="https://github.com/ttqftech/FFBox"
license=('custom')
conflicts=("${pkgname}")
depends=('bash' 'electron8' 'ffmpeg')
makedepends=('gendesk' 'yarn' 'nvm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('9615592ca3aaf39aec7fe65bdf9da04bacb5835900eda45be5fb5d9fb210a4be'
            '29884b1a180763d67eb9a7eaabaa4e46acbae31d6d9bff14106688ae3cc58628')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    rm -rf yarn.lock
    nvm use 16
    yarn install
    yarn electron:build 
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist_electron/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    gendesk -f -n --categories "AudioVideo;Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/public/images/256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist_electron/linux-unpacked/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}