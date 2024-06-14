# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ringer-client-desktop
_pkgname=Ringer
pkgver=4.2.0
_electronversion=29
_nodeversion=20
pkgrel=1
pkgdesc="A new cross platform messaging app"
arch=('any')
url="https://github.com/Lif-Platforms/Ringer-Client-Desktop"
license=('GPL-2.0-only')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'python'
)
makedepends=(
    'npm'
    'git'
    'curl'
    'nvm'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname}.git::git+${url}#tag=${pkgver}"
    "${pkgname}.desktop"
    "${pkgname}.sh"
)
sha256sums=('c0411d2a7a4753c8e6c2c8f1963a03d43f5644f93176936ebed96de942b9dbbc'
            '5ae75de25c7204dba7bfbbbe3c9f58cf6f565963359735a471e1f61ee8692181'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
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
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    rm -rf package-lock.json node_modules dist
    NODE_ENV=development npm install
    NODE_ENV=production npx react-app-rewired build
    NODE_ENV=production npx electron-builder -l --dir
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/public/logo512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}