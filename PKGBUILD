# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aionui
_pkgname=AionUi
pkgver=2.2.2
_electronversion=37
_nodeversion=22
pkgrel=3
pkgdesc="Free, local, open-source 24/7 Cowork app and OpenClaw for Gemini CLI, Claude Code, Codex, OpenCode, Qwen Code, Goose CLI, Auggie, and more."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.aionui.com/"
_ghurl="https://github.com/iOfficeAI/AionUi"
license=('Apache-2.0')
conflicts=("${pkgname}-bin")
depends=(
    "electron${_electronversion}"
    'python'
    'nodejs'
    'python-typing_extensions'
    'python-packaging'
    'aioncore'
)
makedepends=(
    'bun'
    'nvm'
    'gendesk'
    'curl'
    'git'
    'jq'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('a6049f5b76c7b7891a7caaf7be717d38695698b8d70985ad2a05d83658986873'
            'cebedc3391cbab6d43f37fbf3a87ddaad16597cb5ea487a4d55b1f478d810082')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
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
	export BUN_INSTALL_CACHE_DIR="${HOME}/.bun/cache"
	export BUN_INSTALL_GLOBAL_DIR="${HOME}/.bun/global"
	export BUN_INSTALL_BIN="${HOME}/.bun/bin"
	export BUN_CONFIG_SKIP_SAVE_LOCKFILE=1
	export BUN_CONFIG_SKIP_LOAD_LOCKFILE=1
	export BUN_DISABLE_DOTENV=1
	export DO_NOT_TRACK=1
	export BUN_JOBS="$(nproc)"
	mkdir -p "${HOME}" "${BUN_INSTALL_CACHE_DIR}" "${BUN_INSTALL_GLOBAL_DIR}" "${BUN_INSTALL_BIN}"
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="System" \
        --name="${pkgname}" \
        --exec="${pkgname} %U"
    _ensure_local_nvm
    _set_build_env
    find packages -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname}\'/g" {} +
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    bun install --frozen-lockfile
    bun run postinstall || true
    bunx electron-builder install-app-deps
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    if [[ "${CARCH}" == "x86_64" ]]; then
        TARGET_ARCH="x64"
    elif [[ "${CARCH}" == "aarch64" ]]; then
        TARGET_ARCH="arm64"
    else
        TARGET_ARCH="x64"
    fi
    export CI=true
    export NODE_OPTIONS='--max-old-space-size=8192'
    bunx electron-vite build --config packages/desktop/electron.vite.config.ts
    node scripts/build-mcp-servers.js
    # Skip prepareAioncore (aioncore is provided by system package)
    # Patch afterPack.js to skip bundled-aioncore verification
    sed -i 's/verifyBundledResources(resourcesDir, electronPlatformName, targetArch);/console.log("   Skipping bundled-aioncore verification (system package used)");/' scripts/afterPack.js
    node scripts/prepareHubResources.js
    bunx electron-builder --linux dir --"${TARGET_ARCH}" -c.electronDist="${ELECTRON_DIST}" --config packages/desktop/electron-builder.yml
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir="$(_get_app_dir)"
	rm -rf "${_app_dir}/resources/default_app.asar"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname}/"
    # Replace bundled aioncore with symlink to system package
    local _runtime_key
    if [[ "${CARCH}" == "x86_64" ]]; then
        _runtime_key="linux-x64"
    elif [[ "${CARCH}" == "aarch64" ]]; then
        _runtime_key="linux-arm64"
    fi
    if [[ -n "${_runtime_key}" ]]; then
        rm -rf "${pkgdir}/usr/lib/${pkgname}/bundled-aioncore/${_runtime_key}"
        mkdir -p "${pkgdir}/usr/lib/${pkgname}/bundled-aioncore/${_runtime_key}/managed-resources"
        ln -sf /usr/bin/aioncore "${pkgdir}/usr/lib/${pkgname}/bundled-aioncore/${_runtime_key}/aioncore"
        ln -sf /usr/bin/aioncore "${pkgdir}/usr/lib/${pkgname}/bundled-aioncore/${_runtime_key}/managed-resources/aioncore"
    fi
    local _src="$(_get_project_dir)"
    install -Dm644 "${_src}/resources/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${_src}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
