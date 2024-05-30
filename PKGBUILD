# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributer: Bet4 <0xbet4@gmail.com>
# Contributer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: ahrs <Forward dot to at hotmail dot co dot uk>
# Contributor: Aaron Abbott <aabmass@gmail.com>
# Contributer: fleischie
# Contributer: auk
pkgname=hyper-git
_pkgname=Hyper
pkgver=4.0.0.canary.5.r405.g2a7bb18
_electronversion=22
_nodeversion=18
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('any')
url="https://hyper.is/"
_ghurl="https://github.com/vercel/hyper"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    'nodejs'
    'gtk3'
    'alsa-lib'
    'nspr'
    'nss'
)
makedepends=(
    'git'
    'npm'
    'yarn'
    'nvm'
    'libarchive'
    'libicns'
    'icoutils'
    'python>=3.8'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    #git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="System" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    install -Dm755 -d "${srcdir}/${pkgname//-/.}/node_modules/electron/dist"
    touch "${srcdir}/${pkgname//-/.}/node_modules/electron/dist/snapshot_blob.bin"
    icotool -i 5 -x build/canary.ico -o "${pkgname%-git}.png"
    yarn install --cache-folder "${srcdir}/.yarn_cache" --unsafe-perm
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        sed "s|github.com|mirrors.ghproxy.com\/github.com|g" -i node_modules/electron-mksnapshot/download-mksnapshot.js
    fi
    yarn run build
    npx electron-builder build -l --dir
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-git}",usr/bin}
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/dist/linux-"*/* "${pkgdir}/opt/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}