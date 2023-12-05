# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ffbox
_pkgname=FFBox
pkgver=3.0
_electronversion=8
pkgrel=3
pkgdesc="An user-friendly ffmpeg GUI.一个多媒体转码百宝箱 / 一个 FFmpeg 的套壳"
arch=('any')
url="https://github.com/ttqftech/FFBox"
license=('custom')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
makedepends=(
    'gendesk'
    'yarn'
    'npm'
    'nodejs'
    'nvm'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install 16
    nvm use 16
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories "AudioVideo;Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn config set cache-folder "${srcdir}/.yarn_cache"
    yarn install --no-lockfile
    yarn electron:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/images/256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist_electron/linux-unpacked/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}