# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=live2d-kanban-desktop
pkgver=2.8.0
_electronversion=22
_nodeversion=16
pkgrel=2
pkgdesc="An AI Based live2d Kanban for Desktop Users Using Electron.基于Electron制作的桌面看板娘，支持日程提醒、小窗模式、ChatGPT集成、网页搜索、本地moc模型加载与独立设置界面等"
arch=('x86_64')
url="http://studio.zerolite.cn/post/338/waifuproject2-live2d-kanban-desktop/"
_ghurl="https://github.com/JimHans/live2d-kanban-desktop"
license=('GPL3')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'python'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
)
source=(
    "${pkgname}.git::git+${_ghurl}#tag=v${pkgver}"
    "live2dcubismcore.min-${pkgver}.js::https://cubism.live2d.com/sdk-web/cubismcore/live2dcubismcore.min.js"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '942783587666a3a1bddea93afd349e26f798ed19dcd7a52449d0ae3322fcff7c'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    #_ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    cp assets/applogo256.png assets/applogo.png
    npm install --no-package-lock
    npm run pack-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/live2dcubismcore.min-${pkgver}.js" "${pkgdir}/usr/lib/${pkgname}/live2dcubismcore.min.js"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/assets/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}