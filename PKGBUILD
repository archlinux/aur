# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easy-player
_appname=music_player
pkgver=0.1.1
pkgrel=1
pkgdesc="简易的音乐播放器 - 附带歌词功能"
arch=('x86_64')
url="https://github.com/CmarThaa/music_player"
license=('custom')
conflicts=("${pkgname}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('npm' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('093bab97420c97171cd59acb7bc612316ce21a3240e7822e55092d859e038cb1'
            'f9cd5ee858718043ce06afc23860b21319c96c2154dbac49db4d2f4bc07612c7')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    npm install
    sed '19,22d' -i forge.config.js
    npm run make
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${pkgname}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/src/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    gendesk -f -n --icon "${pkgname}" --categories "AudioVideo" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${pkgname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}