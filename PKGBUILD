# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apk-installer
pkgver=1.6.0
pkgrel=4
pkgdesc="一款可运行于windows、macos的Apk安装器软件,快速安装Apk至手机。"
arch=('any')
url="https://github.com/zhujiaming/apk-installer"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron10'
    'java-runtime'
)
mkdenpends=(
    'nodejs'
    'npm'
    'gendesk'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'c5d20773888fa2483956696b14936f0458d0968180e229a7f05c76628eb8577b')
build() {
    gendesk -f -n -q --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -e 's|"author": "ah_zjm@163.com"|"author": "zhujiaming <ah_zjm@163.com>"|g' \
        -e '4i\  "homepage": "https://github.com/zhujiaming/apk-installer",' \
        -i "${srcdir}/${pkgname}-${pkgver}/package.json"
    sed 's|"deb", "rpm", "AppImage"|"AppImage"|g' -i "${srcdir}/${pkgname}-${pkgver}/build.config.js"
    npm install --force  --cache "${srcdir}/npm-cache"
    npx electron-builder --config build.config.js -l
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/packages/linux-unpacked/resources/adb" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/linux-unpacked/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resource/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}