# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apk-installer
pkgver=1.6.0
pkgrel=4
pkgdesc="一款可运行于windows、macos的Apk安装器软件,快速安装Apk至手机。"
arch=('any')
url="https://github.com/zhujiaming/apk-installer"
license=('ISC')
conflicts=("${pkgname}")
depends=('bash' 'electron10' 'java-runtime')
mkdenpends=('nodejs' 'npm' 'gendesk' 'asar')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('f58d1e672a98961307577251a5952521f723607d4920138e1d325bf14297c52c'
            'bc5e84d645e5c04223ac6543b066340297aa1c84c23082d6d269acc228b07ea3')
prepare() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -e 's|"author": "ah_zjm@163.com"|"author": "zhujiaming <ah_zjm@163.com>"|g' \
        -e '4i\  "homepage": "https://github.com/zhujiaming/apk-installer",' \
        -i "${srcdir}/${pkgname}-${pkgver}/package.json"
    sed 's|"deb", "rpm", "AppImage"|"AppImage"|g' -i "${srcdir}/${pkgname}-${pkgver}/build.config.js"
    npm install --force
    npx electron-builder --config build.config.js --linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    cp -r "${srcdir}/${pkgname}-${pkgver}/packages/linux-unpacked/resources/adb" "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resource/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}