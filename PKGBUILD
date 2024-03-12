# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gui-butler
pkgver=2.3.1
_electronversion=25
_nodeversion=18
pkgrel=6
pkgdesc="A wrapper for itch.io's butler which lets you take advantage of the basic features without having to go through a CLI or set up build scripts for each new project."
arch=('x86_64')
url="https://seansleblanc.itch.io/gui-butler"
_ghurl="https://github.com/seleb/gui-butler"
license=('MIT')
conflicts=("${pkgname}")
noextract=("butler-${pkgver}.zip")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'npm'
    'gendesk'
    'nvm'
    'git'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
    "butler-${pkgver}.zip::https://broth.itch.ovh/butler/linux-amd64/LATEST/archive/default"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'b640fceade5cafc7601b0ee57ba13c85913917eb5440375f7a605126f9ca2e1c'
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
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories="Development" --name="${pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    if [ `curl ifconfig.co/country` == "China" ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
    fi
    sed "s|favicon.ico|favicon.png|g" -i package.json
    npm install --force
    npm run build
    install -Dm755 -d "${srcdir}/${pkgname}.git/bin/${pkgname}-linux-x64/resources/app/butler"
    bsdtar -xf "${srcdir}/butler-${pkgver}.zip" -C "${srcdir}/${pkgname}.git/bin/${pkgname}-linux-x64/resources/app/butler"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/bin/${pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/favicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}