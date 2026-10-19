# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Shuyuan Liu <liu_shuyuan at qq dot com>
pkgname=issie
_pkgname=Issie
pkgver=6.3.12
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
    'git'
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('b772614807e311af10cc897fb457cc0e641113b092db01ff3bd33cfb7c9d67ee'
            'dfcd6603d29c7b8d88e019b517a2e5c1a7b5ab905a0961a8b81adfa508b258b8')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
_ensure_local_nvm() {
	local NVM_DIR="${srcdir}/.nvm"
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
	nvm install "${_nodeversion}"
	nvm use "${_nodeversion}"
}
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -printf '%h\n' 2>/dev/null \
		| while read -r d; do [[ -d "${d}/resources" ]] && { echo "$d"; return 0; }; done
}
_get_electron_version() {
	_elec_ver=$(find "$(_get_project_dir)" -name "package.json" ! -path "*/node_modules/*" -print \
		| xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null \
		| grep -oE '[0-9]+' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	(( _elec_ver == _electronversion )) && c=32 || c=31
	echo -e "Electron version: \033[1;${c}m${_elec_ver}$([[ $c -eq 31 ]] && echo " (expected ${_electronversion})")\033[0m"
}
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export npm_config_cache="${HOME}/.npm_cache"
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	export DOTNET_CLI_HOME="${HOME}/.dotnet"
	export npm_config_audit=false
	export npm_config_registry="${NPM_CONFIG_REGISTRY:-${npm_config_registry:-https://registry.npmjs.org}}"
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}" "${DOTNET_CLI_HOME}"
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _ensure_local_nvm
    _set_build_env
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
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
    <add key="huaweicloud" value="https://repo.huaweicloud.com/repository/nuget/v3/index.json" />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
  </packageSources>
</configuration>
EOF
    dotnet tool restore
    dotnet paket install
    export NODE_ENV=development
    npm install
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    npm run compile
    npm run build
    npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname}/"
	rm -rf "${pkgdir}/usr/lib/${pkgname}/default_app.asar"
    install -Dm644 "$(_get_project_dir)/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "$(_get_project_dir)/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
