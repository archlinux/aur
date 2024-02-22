# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apk-installer
pkgver=1.6.0
_electronversion=10
pkgrel=6
pkgdesc="一款Apk安装器软件,快速安装Apk至手机。"
arch=('any')
url="https://github.com/zhujiaming/apk-installer"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
)
mkdenpends=(
    'nodejs'
    'npm'
    'gendesk'
    'git'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    sed -e 's|"author": "ah_zjm@163.com"|"author": "zhujiaming <ah_zjm@163.com>"|g' \
        -e '4i\  "homepage": "https://github.com/zhujiaming/apk-installer",' \
        -i "${srcdir}/${pkgname}.git/package.json"
    sed 's|"deb", "rpm", "AppImage"|"AppImage"|g' -i "${srcdir}/${pkgname}.git/build.config.js"
    npm install --force
    npx electron-builder --config build.config.js -l
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/packages/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/packages/linux-"*/resources/adb "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/packages/linux-"*/swiftshader/* -t "${pkgdir}/usr/lib/${pkgname}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname}.git/resource/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}