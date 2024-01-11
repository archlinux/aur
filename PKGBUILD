# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=insomnium-git
pkgver=0.1.3.r110.gc1df82e
_electronversion=25
_nodeversion=18
pkgrel=1
pkgdesc="A fast local API testing tool that is privacy-focused and 100% local. For testing GraphQL, REST, WebSockets and gRPC.This is a fork of Kong/insomnia"
arch=('x86_64')
url="https://archgpt.dev/insomnium"
_ghurl="https://github.com/ArchGPT/insomnium"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    'electron25'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname//-/.}"
    sed '121,132d' -i packages/insomnia/electron-builder.config.js
    npm ci --cache "${srcdir}/npm-cache"
    npm run app-package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/packages/insomnia/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname//-/.}/packages/insomnia/dist/linux-"*/resources/bin/yarn-standalone.js -t "${pkgdir}/usr/lib/${pkgname%-git}/bin"
    install -Dm644 "${srcdir}/${pkgname//-/.}/packages/insomnia/dist/linux-"*/resources/opensource-licenses.txt -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/packages/insomnia/build/static/insomnia-core-logo_16x.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
}