# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tithree
_pkgname=Tithree
pkgver=1.4.1
_electronversion=25
_nodeversion=18
pkgrel=5
pkgdesc="Tutor's Time Tally.An app for tallying tutor's time spent on tutoring.(Use system-wide electron)"
arch=('any')
url="https://github.com/wpwwhimself/tithree"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'python-setuptools'
    'nodejs'
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'icoutils'
    'curl'
    'git'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('8757b64089d07f53dd52fdb250bfb7b9e1efb1a4a4a1d00755bb3cbe045db720'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        echo "maxsockets=10"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    icotool -i 1 -x  buildResources/icon.ico -o buildResources/icon.png
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npm run build
    NODE_ENV=production     npm exec -c "electron-builder build --linux dir -c.electronDist=${electronDist} --config .electron-builder.config.js --config.asar=false"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/app "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/buildResources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}