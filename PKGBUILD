# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=before-dawn
_pkgname="Before Dawn"
pkgver=0.29.0
_electronversion=28
_nodeversion=18
pkgrel=1
pkgdesc="A desktop screensaver app using web technologies"
arch=('any')
url="https://github.com/muffinista/before-dawn"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'gendesk'
    'nvm'
    'git'
    'ruby'
    'base-devel'
    'gcc'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    if [ `curl ifconfig.co/country` = "China" ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
    else
        echo "Your network is OK."
    fi
    npm ci
    npm run pack
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}/"{output,data/savers}
    cp -r "${srcdir}/${pkgname}.git/output/system-savers" "${pkgdir}/usr/lib/${pkgname}/output"
    cp -r "${srcdir}/${pkgname}.git/output/system-savers" "${pkgdir}/usr/lib/${pkgname}/data/savers"
    install -Dm644 "${srcdir}/${pkgname}.git/output/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644  "${srcdir}/${pkgname}.git/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}