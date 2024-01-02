# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aihub
_pkgname=AIHub
pkgver=1.1.9
_electronversion=28
pkgrel=1
pkgdesc="A collection of large model capabilities, AI capabilities Electron client, with a minimalist interface, will support more AI capabilities in the future.一款集合众多大模型能力、AI能力的Electron客户端，具有极简的界面，将在未来支持更多AI能力."
arch=('any')
url="https://github.com/classfang/AIHub"
license=('Apache')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nodejs'
    'gendesk'
    'git'
)
source=(
    "${pkgname}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}"
    sed '/- snap/d;/- deb/d' -i electron-builder.yml
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644  "${srcdir}/${pkgname}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/dist/linux-unpacked/resources/app.asar.unpacked/resources/"* -t "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644  "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}