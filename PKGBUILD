# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-web-server
_pkgname="Simple Web Server"
pkgver=1.2.9
_electronversion=26
pkgrel=3
pkgdesc="Create a local web server in just a few clicks with an easy to use interface. A continuation of Web Server for Chrome, built with Electron."
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://simplewebserver.org/"
_ghurl="https://github.com/terreng/simple-web-server"
license=('MIT')
conflits=("${pkgname}")
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
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --categories "Development" --name "${_pkgname}" --exec "${pkgname%-bin}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed "s|--linux targz|--linux AppImage|g" -i package.json
    npm install
    if [ "${CARCH}" == "aarch64" ];then
        npm run make_linux_targz_arm64
    elif [ "${CARCH}" == "i686" ];then
        npm run make_linux_targz_ia3
    elif [ "${CARCH}" == "x86_64" ];then
        npm run make_linux_targz_x64
    fi
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}