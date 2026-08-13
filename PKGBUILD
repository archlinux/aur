# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Shuyuan Liu <liu_shuyuan at qq dot com>
pkgname=issie
_pkgname=Issie
pkgver=6.0.16
_electronversion=43
_nodeversion=24
pkgrel=1
pkgdesc="An Interactive Schematic Simulator with Integrated Editor."
arch=('any')
url="https://tomcl.github.io/issie"
_ghurl="https://github.com/tomcl/issie"
license=('LGPL-3.0-or-later')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'nvm'
    'npm'
    'dotnet-sdk>=8'
    'gendesk'
    'curl'
    'git'
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('b14f3f67cf228f713ecd555f775e01c755e5d04251ed6e16085aa4d1bb5e1f1a'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
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
    export DOTNET_CLI_HOME="${srcdir}/.dotnet"
    export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
    export NPM_CONFIG_MAXSOCKETS=32
    export MSBUILDDISABLENODEREUSE=1
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
            export ELECTRON_BUILDER_BINARIES_MIRROR="https://npmmirror.com/mirrors/electron-builder-binaries/"
            export NUGET_PLUGIN_HANDSHAKE_TIMEOUT_IN_SECONDS=30
            export NUGET_PLUGIN_REQUEST_TIMEOUT_IN_SECONDS=30
        }
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
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
        --categories="Development" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    # Fix: Add 'path' to webpack externals so it's available at runtime for __static template literal
    sed -i '/usb: "commonjs2 usb",/a\    path: "commonjs2 path",' webpack.config.main.js
    # Fix: Add BannerPlugin to inject path require at the top of the bundle
    sed -i '/plugins: \[/a\    new webpack.BannerPlugin({ banner: "const path = require('\''path'\'');", raw: true, entryOnly: true }),' webpack.config.main.js
    # Fix: Replace process.resourcesPath with hardcoded /usr/lib/issie for Arch Linux packaging
    sed -i 's|``process``?resourcesPath|"/usr/lib/issie"|g' src/Main/Main.fs
    # Also replace in webpack static path definition (need to keep quotes)
    sed -i "s|process\.resourcesPath|'/usr/lib/issie'|g" webpack.config.main.js
    # Fix: Use ELECTRON_IS_DEV env var instead of process.defaultApp for dev mode detection
    sed -i 's#let isDev = (``process``?defaultApp = true)#let isDev = (Api.``process``?env?ELECTRON_IS_DEV = "0" |> not)#g' src/Main/Main.fs
    # Configure NuGet China mirror - modify the config file that dotnet creates
    mkdir -p "${DOTNET_CLI_HOME}/.nuget/NuGet"
    cat > "${DOTNET_CLI_HOME}/.nuget/NuGet/NuGet.Config" << 'EOF'
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <add key="nuget.cn" value="https://nuget.cdn.azure.cn/v3/index.json" />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
  </packageSources>
</configuration>
EOF
    dotnet tool restore
    dotnet paket install
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     npm run compile
    NODE_ENV=production     npm run build
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname}/"
	rm -rf "${pkgdir}/usr/lib/${pkgname}/default_app.asar"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}