# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hihat
pkgver=2.3.4
_electronversion=42
_nodeversion=24
pkgrel=1
pkgdesc="A minimalist offline music library player for desktop, built on Electron, React, and Material UI.Use system-wide electron."
arch=('any')
url="https://github.com/johnnyshankman/hihat"
license=('MIT')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'curl'
    'jq'
)
source=("${pkgname}.sh")
sha256sums=('a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}"
    if [[ ! -d "${srcdir}/${pkgname}-${pkgver}" ]]; then
        git clone \
            --depth 1 \
            --branch "${pkgver}" \
            "${url}" \
            "${pkgname}-${pkgver}"
    fi
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${pkgname}" \
        --exec="${pkgname} %U"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    local HOME="${srcdir}/.electron-gyp"
    export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
    export NPM_CONFIG_MAXSOCKETS=32
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
        }
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    _ensure_local_nvm
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install --legacy-peer-deps
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npx ts-node ./.erb/scripts/clean.js dist
    NODE_ENV=production     npm run build
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
