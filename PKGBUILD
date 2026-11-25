# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=folia-major
_pkgname=Folia
pkgver=0.8.0
_electronversion=43
_nodeversion=24
pkgrel=1
pkgdesc="Local music/navigation/third-party multi-platform online music player focusing on gorgeous lyrics animation effects.专注于绚丽的歌词动画效果的本地音乐/navidrome/第三方多平台在线音乐播放器."
arch=('any')
url="https://folia-site.cielaniska.top/"
_ghurl="https://github.com/chthollyphile/folia-major"
license=('AGPL-3.0-only')
depends=(
    "electron${_electronversion}"
    'nodejs'
    'ffmpeg'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'rustup'
    'curl'
    'jq'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.js"
    "${pkgname}.sh"
)
sha256sums=('cb2ccac2f10c51dbd1a3f4a6a3ca90db3021f8ed1d89ba0cc8b131049d1fabd9'
            'b2190e52307557102005cf35ba6fdc921487428224761ecbc554d4dd91764c2b'
            '739eaf5396ac7f1373d907904f068e8a10a18ef91af7c35ca05adbff46322c97')
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
	local _v=$(find "$(_get_project_dir)" -name package.json ! -path '*/node_modules/*' -exec jq -r '.. | (.electron? // empty) | strings' {} + 2>/dev/null | sed 's/^[^0-9]*//' | grep -E '^[0-9]' | head -1 | sed 's/\..*//')
	_v=${_v:-$(grep -hoE 'electron[@":][^0-9]*[0-9]+\.[0-9.]+' "$(_get_project_dir)"/*lock* 2>/dev/null | grep -oE '[0-9]+\.[0-9.]+' | head -1 | sed 's/\..*//')}
	[[ "$_v" =~ ^[0-9] ]] || return 1
	(( ${_v} == _electronversion )) && echo -e "\033[1;32mElectron version: ${_v}\033[0m" || echo -e "\033[1;31mElectron version: ${_v} (expected ${_electronversion})\033[0m"
}
_set_electron_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
}
_set_npm_build_env() {
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export npm_config_cache="${HOME}/.npm_cache"
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	export npm_config_audit=false
	export npm_config_registry="${NPM_CONFIG_REGISTRY:-${npm_config_registry:-https://registry.npmjs.org}}"
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}"
}
_set_rust_build_env() {
	export HOME="${srcdir}/.home"
	export CARGO_HOME="${HOME}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	mkdir -p "${HOME}" "${CARGO_HOME}"
}
_delete_other_arch_files() {
	local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
	find "$(_get_app_dir)" -mindepth 1 -type d \
		\( -name '*darwin*' -o -name '*android*' -o -name "*bsd*" -o -name "*musl*" -o -name "*loong*" -o -name "*riscv*" -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
	find "$(_get_app_dir)" -mindepth 1 -type f \
		\( -name '*darwin*.node' -o -name '*android*.node' -o -name 'win32*.node' -o -name "*ia32*.node" -o -name "*${_archrem}*.node" \) \
		-prune -exec rm -rf {} +
	rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
_build_windowtolayer() {
    cd "$(_get_project_dir)"
    local _wt_script="$(_get_project_dir)/packaging/linux/build-windowtolayer.mjs"
    local _wt_rev
    _wt_rev="$(grep -oP "const PINNED_REV = '\K[^']+" "${_wt_script}")"
    local _wt_patches
    mapfile -t _wt_patches < <(grep -oP "^\s*'windowtolayer[^']+\.patch'" "${_wt_script}" | sed "s/^ *'//;s/'$//")
    local _wt_dir="$(_get_project_dir)/.windowtolayer-src"
    local _wt_url="https://gitlab.freedesktop.org/mstoeckl/windowtolayer/-/archive/${_wt_rev}/windowtolayer-${_wt_rev}.tar.gz"
    rm -rf "${_wt_dir}"
    mkdir -p "${_wt_dir}"
    curl -fL "${_wt_url}" | tar xz -C "${_wt_dir}" --strip-components=1
    cd "${_wt_dir}"
    git init -q
    git config user.email "aur@aur.archlinux.org"
    git config user.name "AUR Build"
    git add -A
    git commit -q -m "windowtolayer ${_wt_rev}"
    for patch in "${_wt_patches[@]}"; do
        git apply "$(_get_project_dir)/packaging/linux/patches/${patch}"
    done
    cargo build --release --manifest-path "${_wt_dir}/Cargo.toml"
    mkdir -p "$(_get_project_dir)/build"
    cp "${_wt_dir}/target/release/windowtolayer" "$(_get_project_dir)/build/windowtolayer"
    cp "${_wt_dir}/COPYING" "$(_get_project_dir)/build/windowtolayer-COPYING"
    chmod 755 "$(_get_project_dir)/build/windowtolayer"
    cd "$(_get_project_dir)"
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    _set_electron_build_env
    _set_npm_build_env
    _set_rust_build_env
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    cp .env.example .env
    rustup update stable
    rustup default stable
    export NODE_ENV=development
    export npm_config_allow_remote=all
    npm install
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
    _set_electron_build_env
    _set_npm_build_env
    _set_rust_build_env
    export ELECTRON=true
    export NODE_ENV=production
    export NODE_OPTIONS="--max-old-space-size=4096"
    npm run build:vercel-api
    npm run sources:build
    npx vite build
    _build_windowtolayer
    npm run build:wallpaper-helper
    npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST}"
    ln -sf "/usr/bin/ffmpeg" "$(_get_app_dir)/resources/ffmpeg-audio/ffmpeg"
    _delete_other_arch_files
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.js" -t "${pkgdir}/usr/lib/${pkgname}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "$(_get_project_dir)/build/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    install -Dm644 "$(_get_project_dir)/packaging/aur/${pkgname}-bin/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}