# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pandora-box
_pkgname=Pandora-Box
pkgver=1.0.22
_electronversion=41
_nodeversion=26
export ELECTRON_SKIP_BINARY_DOWNLOAD=1
pkgrel=1
pkgdesc="A Simple Mihomo GUI.(Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/snakem982/Pandora-Box"
license=('GPL-3.0-only')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'go'
    'git'
    'wget'
    'curl'
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('27d61201b04d92204b0b2716b418b55a89483c2eea8b4928bcbcaa3db477cf56'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_set_build_env() {
    export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
    export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
    export NPM_CONFIG_MAXSOCKETS=32
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
            export ELECTRON_BUILDER_BINARIES_MIRROR="https://npmmirror.com/mirrors/electron-builder-binaries/"
        }
        export GOPROXY=https://goproxy.cn,direct
        _DLURL="ghfast.top/https://github.com"
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    else
        _DLURL="github.com"
    fi
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s|export default defineConfig({});|export default defineConfig({\n  build: {\n    rollupOptions: {\n      external: [/node_modules/],\n    },\n  },\n});|" vite.main.config.ts
    sed -i "s|    plugins: \[vue(),|    optimizeDeps: {\n        include: ['element-plus'],\n    },\n    plugins: [vue(),|" vite.config.ts
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s|extraResource,|extraResource,\n        electronZipDir: '${srcdir}/electron-zip',|" forge.config.ts
    sed -i "s|\"vite\": \"7\.3\.1\"|\"vite\": \"^5.4.0\"|; s|\"@vitejs/plugin-vue\": \"6\.0\.1\"|\"@vitejs/plugin-vue\": \"^5.2.0\"|" package.json
    find src-electron -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname}\'/g" {} +
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install --legacy-peer-deps
    cd "${srcdir}/${pkgname}-${pkgver}/src-go"
    go mod tidy
    wget -O internal/em/geoip.metadb "https://${_DLURL}/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.metadb"
    wget -O internal/em/GeoSite.dat "https://${_DLURL}/MetaCubeX/meta-rules-dat/releases/download/latest/geosite.dat"
    wget -O internal/em/GeoLite2-ASN.mmdb "https://${_DLURL}/MetaCubeX/meta-rules-dat/releases/download/latest/GeoLite2-ASN.mmdb"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}/src-go"
    _set_build_env
    _ensure_local_nvm
    _VERSION="$(git describe --tags --abbrev=0)"
    go build -tags=with_gvisor -trimpath \
        -ldflags "-s -w -X github.com/snakem982/pandora-box/api.Version=${_VERSION}" \
        -o px
    cd "${srcdir}/${pkgname}-${pkgver}"
    NODE_ENV=production    npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}