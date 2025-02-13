# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: zhullyb <zhullyb [at] outlook [dot] com>
# Contributor: littzhch <2371050115@qq.com>
# Contributor: Bruce Zhang
pkgname=picgo-electron
_pkgname=PicGo
pkgver=2.3.1
_electronversion=16
_nodeversion=16
pkgrel=2
pkgdesc="A simple & beautiful tool for pictures uploading built by electron-vue.(Use system-wide electron)"
arch=('any')
url="https://github.com/find-xposed-magisk/PicGo"
license=('MIT')
conflicts=(
	"${pkgname%-electron}"
	"${pkgname}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'yarn'
)
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}.sh"
)
sha256sums=('fe6aa3b3fea32c0142506fa2c6d0c6f07c00a0a956dce0eaaaf74a5d382f7ae5'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo -e '\n'
            echo 'registry "https://registry.npmmirror.com"'
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
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g;s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
	NODE_ENV=development    yarn add -D xvfb-maybe
}
build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
    NODE_ENV=production     yarn run build -l --dir
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist_electron/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist_electron/linux-"*/swiftshader/* -t "${pkgdir}/usr/lib/${pkgname}/swiftshader"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/build/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}