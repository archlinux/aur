# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aingdesk
_pkgname=AingDesk
pkgver=1.2.2
_electronversion=31
_nodeversion=20
pkgrel=1
pkgdesc="a simple and easy-to-use AI assistant that supports knowledge bases, model APIs, sharing, internet search, and intelligent agents.(Use system-wide electron)"
arch=('any')
url="https://www.aingdesk.com/"
_ghurl="https://github.com/aingdesk/AingDesk"
license=('MIT')
depends=(
    "electron${_electronversion}"
    'python'
    'python-requests'
)
optdepends=(
    'ollama: Use your local LLMs'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('fdc9922531063de623f0bb6ef6f294d852bf778067c775774e296b5ce4c4fc0c'
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
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
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
        cp .npmrc frontend
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install
    cd "${srcdir}/${pkgname}-${pkgver}/frontend"
    sed -i "/rollup-win32-x64-msvc/d" package.json
    NODE_ENV=development    npm install
    NODE_ENV=development    npm add -D rollup
}
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npm run build-frontend
    NODE_ENV=production     npm run build-electron
    NODE_ENV=production     npm run encrypt
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist} --config=cmd/builder-linux.json"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/out/linux-"*/resources/{app.asar.unpacked,extraResources} "${pkgdir}/usr/lib/${pkgname}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icons/${_icons}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
