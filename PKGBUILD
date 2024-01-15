# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ffbox
_pkgname=FFBox
pkgver=3.0
_electronversion=8
_nodeversion=16
pkgrel=4
pkgdesc="An user-friendly ffmpeg GUI.一个多媒体转码百宝箱/一个 FFmpeg 的套壳"
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
    'nvm'
    'git'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
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
    _ensure_local_nvm
    gendesk -f -n -q --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    yarn install --no-lockfile --cache-folder "${srcdir}/.yarn_cache"
    yarn run electron:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist_electron/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/public/images/256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.git/dist_electron/linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}