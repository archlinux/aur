# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pikatorrent-git
_pkgname=PikaTorrent
pkgver=0.9.0.r143.g4f66e77
_electronversion=31
_nodeversion=20
pkgrel=1
pkgdesc="A modern, open source and electric BitTorrent app for mobile, desktop & server."
arch=('any')
url="https://www.pikatorrent.com/"
_ghurl="https://github.com/G-Ray/pikatorrent"
license=('GPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gcc'
    'cmake'
    'curl'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
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
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${pkgname%-git}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
        echo "[url "https://github.moeyy.xyz/https://github.com/"]" > .gitconfig
        echo "    insteadof = https://github.com/" >> .gitconfig
    else
        echo "Your network is OK."
    fi
    sed "s|\"electron\": \"\^31.3.0\"|\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"|g" -i apps/desktop/package.json
    sed "s|desktop run make|desktop run package|g" -i package.json
    NODE_ENV=development    npm install
    NODE_ENV=production     npm run build:desktop
    sed "s|run.sh|${pkgname%-git}|g;s|com.${pkgname%-git}.${_pkgname}|${pkgname%-git}|g" \
        -i "${srcdir}/${pkgname//-/.}/apps/desktop/assets/linux/${pkgname%-git}.desktop"
    sed "s|com.${pkgname%-git}.${_pkgname}|${pkgname%-git}|g" \
        -i "${srcdir}/${pkgname//-/.}/apps/desktop/assets/linux/${pkgname%-git}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/apps/desktop/out/${pkgname%-git}-linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/apps/desktop/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/apps/desktop/assets/linux/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/apps/desktop/assets/linux/${pkgname%-git}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}