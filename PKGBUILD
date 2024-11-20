# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=weakauras-companion
_pkgname=WeakAuras-Companion
pkgver=5.2.7
_electronversion=32
_nodeversion=22
pkgrel=1
pkgdesc="A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.(Use system-wide electron)"
arch=('any')
url="https://weakauras.wtf/"
_ghurl="https://github.com/WeakAuras/WeakAuras-Companion"
license=('GPL-2.0-only')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'gcc'
    'cmake'
    'nvm'
    'curl'
    'pnpm'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('d5b9337328cdc57e55791031458cbc229ce882804cf396619321e15388f8688e'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Game" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
        echo 'registry=https://registry.npmmirror.com'
        echo 'electron_mirror=https://cdn.npmmirror.com/binaries/electron/'
        echo 'electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/'
        } >> .npmrc
    fi
    sed -i "s/on(\"minimize\",/on(\"will-resize\",/g" electron/main/index.ts
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/\/\${version}//g" electron-builder.json
    install -Dm755 -d .git
    NODE_ENV=development    pnpm install
    NODE_ENV=production     pnpm run lint:fix
    NODE_ENV=production     pnpm vue-tsc
    NODE_ENV=production     pnpm vite build
    NODE_ENV=production     pnpm -c exec "electron-builder --linux dir -c.electronDist=${electronDist} --config electron-builder.json"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/release/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/release/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/public/bigicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}