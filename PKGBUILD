# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=autocut-client
pkgver=0.1.7
_electronversion=21
_nodeversion=14
pkgrel=5
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
    'gendesk'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname%-bin}.sh"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "AudioVideo" --name "${pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
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
    install -Dm644 "${srcdir}/${pkgname}.git/release/v${pkgver}/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/node.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}