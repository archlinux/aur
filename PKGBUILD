# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wrkspace-git
_pkgname=Wrkspace
pkgver=1.2.8.beta.r0.gb2908f1
_electronversion=25
_nodeversion=20
pkgrel=1
pkgdesc="Simplify the project launching. Manage Docker containers, execute terminal commands, navigate project pages, and open projects instantly with your preferred text editor – all with a single click."
arch=('any')
url="https://wrkspace.co/"
_ghurl="https://github.com/mfcmatheus/wrkspace"
license=('AGPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}-bin"
)
makedepends=(
    'npm'
    'yarn'
    'git'
    'nvm'
    'gendesk'
    'base-devel'
    'gcc'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
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
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Development" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    sed "s|AppImage|dir|g" -i package.json
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/release/build/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/release/build/linux-"*/resources/{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname%-git}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}