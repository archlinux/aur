# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-music-player
_appname=EMP
_pkgname=emp
pkgver=0.8.8
pkgrel=3
pkgdesc="A functional music player for FLAC, mp3, and m4a audio. "
arch=("any")
url="https://github.com/kevinfrei/EMP"
license=("custom:CC0-1.0")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'electron25'
)
makedepends=(
    'yarn'
    'npm'
    'gendesk'
    'nvm'
    'git'
    'asar'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'c4f3efa59117d7153c132d82a8fe1758e8be1e71c0973bc870ec79502f8587dd')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 18
    nvm use 18
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --categories "AudioVideo" --name "EMP: Electron Music Player" --exec "${_pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -e '9i\  "repository": "github:kevinfrei/EMP",' -e "s|\"./\"|\"https://github.com/kevinfrei/EMP\"|g" -i package.json
    yarn
    yarn run build
    asar e "${srcdir}/${pkgname}-${pkgver}/release/${pkgver}/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    echo "process.env['ELECTRON_DISABLE_SECURITY_WARNINGS'] = 'true';" >> "${srcdir}/app.asar.unpacked/dist-electron/main.js"
    cp -r "${srcdir}/${pkgname}-${pkgver}/public" "${srcdir}/app.asar.unpacked"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/${pkgver}/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}