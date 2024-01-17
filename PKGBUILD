# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Butui Hu <hot123tea123@gmail.com>
pkgname=motrix-git
_pkgname=Motrix
pkgver=1.8.19.r30.g7012040
_electronversion=22
_nodeversion=16
pkgrel=1
pkgdesc="A full-featured download manager that supports downloading HTTP, FTP, BitTorrent, Magnet, etc."
arch=('any')
url="https://motrix.app/"
_ghurl="https://github.com/agalwood/Motrix"
_giteeurl="https://gitee.com/mirrors/motrix"
license=('MIT')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'yarn'
    'npm'
    'nvm'
    'curl'
)
source=(
    "${pkgname//-/.}::git+${_giteeurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    #_ensure_local_nvm
    gendesk -q -f -n --categories "Network" --name "${_pkgname}" --exec "${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed '161,180d' -i electron-builder.json
    #yarn install --cache-folder "${srcdir}/.yarn_cache"
    #yarn lint:fix
    yarn run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    case "${CARCH}" in
        x86_64)
            _architecture="linux-unpacked"
        ;;
        aarch64)
            _architecture="linux-arm64-unpacked"
        ;;
        armv7h)
            _architecture="linux-armv7l-unpacked"
        ;;
    esac
    install -Dm644 "${srcdir}/${pkgname//-/.}/release/${_architecture}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname//-/.}/release/${_architecture}/resources/engine/aria2c" -t "${pkgdir}/usr/lib/${pkgname%-git}/engine"
    install -Dm644 "${srcdir}/${pkgname//-/.}/release/${_architecture}/resources/engine/aria2.conf" -t "${pkgdir}/usr/lib/${pkgname%-git}/engine"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/static/512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}