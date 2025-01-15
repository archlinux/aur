# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lynxhub
_pkgname=LynxHub
pkgver=2.1.0
_electronversion=33
_nodeversion=20
pkgrel=1
pkgdesc="Manage and launch all your AI from a single dashboard.(Use system-wide electron)"
arch=('any')
url="https://github.com/KindaBrazy/LynxHub"
license=('GPL-3.0-or-later')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'libsecret'
    'python'
)
makedepends=(
    'npm'
    'gcc'
    'cmake'
    'nvm'
    'curl'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/V${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('688977896ce48719a76b004714ab02e738ca8eaf0379f9308bc5981fd5e16599'
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
        s/@cfgdirname@/${pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${_pkgname}-${pkgver}"
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
    sed -i "s/'red'/'default'/g" src/renderer/src/App/Components/Modals/Warning/WarningModal.tsx
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    NODE_ENV=production     npm run build
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist} --config electron-builder.config.cjs"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/build/icons/512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
