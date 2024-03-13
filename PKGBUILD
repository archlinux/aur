# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=orca-writer
_pkgname=Orca
pkgver=0.7.0_pre_alpha
_electronversion=18
_nodeversion=18
pkgrel=7
pkgdesc="React Electron App for Writing and Publishing Novels"
arch=('any')
url="https://orcawriter.app/"
_ghurl="https://github.com/zachhannum/orca"
license=('AGPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'orc'
    'libgsf'
    'libvips'
    'libexif'
)
makedepends=(
    'npm'
    'yarn'
    'nvm'
    'gendesk'
    'base-devel'
    'gcc'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver//_/-}"
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
    gendesk -f -n -q --categories="Development" --name="${pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    sed "s|build --publish never|build --dir|g" -i package.json
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/release/build/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/release/build/linux-"*/resources/{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 256x256 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}.git/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}