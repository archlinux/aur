# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=aero
pkgname="${_appname}-browser"
_pkgname="AeroBrowser"
pkgver=0.2.2_alpha
_electronversion=23
_nodeversion=18
pkgrel=7
pkgdesc="A fast and lightweight web browser made with electron and react that allows you to navigate the Internet with ease.(Use system-wide electron)"
arch=('any')
url="https://aero-mymeiy532-frostbreker.vercel.app/"
_ghurl="https://github.com/FrostBreker/Aero"
license=('MIT')
conflicts=("${pkgname}")
provides=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'curl'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('77b1cd25139304d506ed5477d2b224dc9352b157d32debb14bd5ad9773760388'
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
        s/@cfgdirname@/${_appname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Network" --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'	
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed "s/https\:\/\/www.google.fr\//about\:blank/g" -i src/App.js
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    NODE_ENV=production     npm run build
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist} -c.electronVersion=${_electronversion} -c.extraMetadata.main=build/electron.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE.MD" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}