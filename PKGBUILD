# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-music-player
_appname=EMP
_pkgname=emp
pkgver=0.8.8
pkgrel=2
pkgdesc="A functional music player for FLAC, mp3, and m4a audio. "
arch=("any")
url="https://github.com/kevinfrei/EMP"
license=("CC0-1.0")
conflicts=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron25')
makedepends=('yarn' 'npm' 'gendesk' 'nodejs>=20.3.1' 'asar')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('f720b3a2d18a83b33462201ac545d60d736b62dbeabd1c6273ec6189bb3d6e5e'
            'b0919bac8ece8b1a9fc23d6decf527f88998e94f26cbf45ff6119ac84f50f1bb')
prepare() {
    gendesk -q -f -n --categories "AudioVideo" --name "EMP: Electron Music Player" --exec "${_pkgname}"
}
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    if [ -d .git ];then
        rm -rf .git
        mkdir .git
    else
        mkdir .git
    fi
    sed '9i\  "repository": "github:kevinfrei/EMP",' -i package.json
    sed "s|\"./\"|\"https://github.com/kevinfrei/EMP\"|g" -i package.json
    yarn
    yarn run build
    asar e "${srcdir}/${_appname}-${pkgver}/release/${pkgver}/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${_appname}-${pkgver}/release/${pkgver}/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    cp -r "${srcdir}/${_appname}-${pkgver}/public" "${srcdir}/app.asar.unpacked"
    echo "process.env['ELECTRON_DISABLE_SECURITY_WARNINGS'] = 'true';" >> "${srcdir}/app.asar.unpacked/dist-electron/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/dist/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}