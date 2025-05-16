# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hiregpt
_pkgname=HireGPT
pkgver=0.2.0
_electronversion=23
_nodeversion=20
pkgrel=12
pkgdesc="Job application made easy with OpenAI GPT model.(Use system-wide electron)"
arch=('any')
url="https://github.com/jaejaywoo/HireGPT"
license=('MIT')
conflits=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'python-flask'
    'python-werkzeug'
    'python-openai'
)
makedepends=(
    'npm'
    'gendesk'
    'nvm'
    'curl'
    'python'
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
sha256sums=('b1521f434447122ce6c101e62a38d299312f44446a4dfbdccc823317e0f38596'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -q -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
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
    sed -i -e "
        /\@electron-forge/d
        s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g
    " package.json
    NODE_ENV=development    npm install --legacy-peer-deps
    NODE_ENV=development    npm add -D electron-builder
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}