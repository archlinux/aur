# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=autocut-client
pkgver=0.1.7
_electronversion=21
_nodeversion=14
pkgrel=4
pkgdesc="Quickly generate video subtitles and edit the video by selecting subtitle clips"
arch=('any')
url="https://github.com/zcf0508/autocut-client"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
    "${pkgname%-client}"
)
makedepends=(
    'npm'
    'pnpm'
    'nvm'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}.sh"
)
sha256sums=('8da25341df954439d26b7921736e0539530f1d6b2bc392c826242a68007df990'
            '6189d92e0326fb33813fb8226c68de6fe3e71fb895303cac7d063fddd006c0c4'
            '12f34587289d05e05c95a2a47884f1674faeb96a27d9d66f954f0bb20490c2e5')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    pnpm install
    pnpm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/v${pkgver}/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/node.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}