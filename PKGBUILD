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
_nodeversion=20
pkgrel=1
pkgdesc="A terminal built on web technologies."
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
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="System" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        sed -i "/npmjs/d" .yarnrc
        {
            echo -e '\n'
            echo 'registry "https://registry.npmmirror.com"'
            #echo 'disturl "https://registry.npmmirror.com/-/binary/node/"'
            echo 'electron_mirror "https://registry.npmmirror.com/-/binary/electron/"'
            echo 'electron_builder_binaries_mirror "https://registry.npmmirror.com/-/binary/electron-builder-binaries/"'
            echo "cacheFolder "${srcdir}"/.yarn/cache"
            echo "pluginsFolder "${srcdir}"/.yarn/plugins"
            echo "globalFolder "${srcdir}"/.yarn/global"
            echo 'useHardlinks true'
            #echo 'buildFromSource true'
            echo 'linkWorkspacePackages true'
            echo 'fetchRetries 3'
            echo 'fetchRetryTimeout 10000'
        } >> .yarnrc
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g;s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
    fi
    icotool -i 5 -x build/canary.ico -o "${pkgname%-git}.png"
    install -Dm755 -d "${srcdir}/${pkgname//-/.}/node_modules/electron/dist/"{x64,arm64}
    touch "${srcdir}/${pkgname//-/.}/node_modules/electron/dist/"{x64,arm64}/snapshot_blob.bin
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache" --unsafe-perm
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        sed -i "s/github\.com/mirrors\.ghproxy\.com\/https:\/\/github.com/g" node_modules/electron-mksnapshot/download-mksnapshot.js
    fi
    NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-git}"}
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname//-/.}/dist/linux-"*/* "${pkgdir}/usr/lib/${pkgname%-git}"
    ln -sf "/usr/lib/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
