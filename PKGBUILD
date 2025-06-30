# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=folo
_pkgname=Folo
pkgver=0.6.1
_electronversion=35
_nodeversion=22
pkgrel=1
pkgdesc="Organizes content into one timeline, keeping you updated on what matters, noise-free. Share lists, explore collections, and enjoy distraction-free browsing.(Prebuilt version.Use system-wide electron)"
arch=('any')
url="https://folo.is/"
_ghurl="https://github.com/RSSNext/folo"
license=('GPL-3.0-only')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'curl'
    'pnpm'
    'python-setuptools'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('b9a0105197bb9e5547a91b0578ece91084565b3e281dd2ed6317c7ab8a2566e3'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
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
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
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
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
        echo "node-linker=hoisted"
        echo "network-concurrency=10"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
        echo 'registry=https://registry.npmmirror.com'
        echo 'electron_mirror=https://cdn.npmmirror.com/binaries/electron/'
        echo 'electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/'
        } >> .npmrc
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    pnpm install
    cd "${srcdir}/${pkgname}-${pkgver}/apps/desktop"
    NODE_ENV=development    pnpm add -D @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}/apps/desktop"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    cp .env.example .env
    NODE_ENV=production     pnpm update:main-hash
    sed -i -e "
        s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g
        s/electron-forge make/electron-forge package/g
    " package.json
    sed -i -e "/^[[:space:]]*plugins:[[:space:]]*\[.*\$/a\\
    {\\
        name: \"@electron-forge/plugin-local-electron\",\\
        config: {\\
            electronPath: \"${electronDist}\"\\
        }\\
    }," forge.config.*
    NODE_ENV=production     pnpm run build:electron
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/apps/desktop/out/${_pkgname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/apps/desktop/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}