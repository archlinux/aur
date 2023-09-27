# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easy-player
_appname=music_player
pkgver=0.1.4
pkgrel=1
pkgdesc="简易的音乐播放器 - 附带歌词功能"
arch=('x86_64')
url="https://github.com/CmarThaa/music_player"
license=('custom')
conflicts=("${pkgname}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('npm' 'nodejs>=18' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('d4cb1f21f8ece4e70610e6766b40de3feb835d45b01d11ecfd3ca295d473b19d'
            'a3a392825088465742231ff27d30ab0f53536d6864170ad8ad79f236b7aa21b1')
prepare() {
    gendesk -q -f -n --categories "AudioVideo" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    npm install
    sed '20,23d' -i forge.config.js
    npm run make
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/src/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${pkgname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}