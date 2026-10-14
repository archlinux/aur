# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flyenv-git
_pkgname=FlyEnv
pkgver=4.20.1.r2.g4f216d5
_electronversion=39
_nodeversion=24
pkgrel=1
pkgdesc="A modern alternative to XAMPP, MAMP, Laragon and Laravel Herd, with runtimes, databases, web servers, local sites, HTTPS, AI coding tools and MCP."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.flyenv.com/"
_ghurl="https://github.com/xpf0000/FlyEnv"
license=('BSD-3-Clause')
depends=(
    "electron${_electronversion}"
    '7zip'
)
makedepends=(
    'git'
    'yarn'
    'curl'
    'gendesk'
    'nvm'
    'go'
    'jq'
)
optdepends=(
    'ollala'
    'apache'
    'caddy'
    'consul'
    'nginx'
    'tomcat10'
    'bun'
    'deno'
    'erlang'
    'go'
    'jdk-openjdk'
    'nodejs'
    'perl'
    'php'
    'python'
    'ruby'
    'rust'
    'mariadb'
    'mysql'
    'mongodb'
    'postgresql'
    'etcd'
    'memcached'
    'rabbitmq'
    'redis'
    'mailpit'
    'dnsmasq'
    'bind'
    'pure-ftpd'
    'minio'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'dfcd6603d29c7b8d88e019b517a2e5c1a7b5ab905a0961a8b81adfa508b258b8')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
pkgver() {
	cd "$(_get_project_dir)"
	set -o pipefail
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
    export HOME="${srcdir}/.home"
    export GOPATH="${HOME}/go"
	export GOCACHE="${HOME}/go-build"
	export GOENV="${HOME}/go/env"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export GOTOOLCHAIN=local
	export GOWORK=off
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export YARN_CACHE_FOLDER="${HOME}/.yarn/cache"
	export YARN_NETWORK_CONCURRENCY=32
    mkdir -p "${HOME}" "${GOCACHE}" "${XDG_CONFIG_HOME}" "${XDG_CACHE_HOME}" "$(dirname "${GOENV}")"
    : > "${GOENV}"
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	export npm_config_registry="${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}"
	local _yarnver _yarnmajor=0
	_yarnver="$(node -p "require('./package.json').packageManager?.split('@')[1]?.split('-')[0] || ''" 2>/dev/null)"
	_yarnmajor="${_yarnver%%.*}"
	_yarnmajor="${_yarnmajor:-0}"
	if [[ "${_yarnmajor}" -ge 2 ]] 2>/dev/null || [[ -f .yarnrc.yml ]]; then
		export XDG_STATE_HOME="${HOME}/.local/state"
		export YARN_ENABLE_GLOBAL_CACHE=false
		export YARN_ENABLE_MIRROR=false
		export YARN_GLOBAL_FOLDER="${HOME}/.yarn/berry"
		export YARN_NODE_LINKER=node-modules
		export YARN_NM_MODE=hardlinks-local
		export YARN_ENABLE_TELEMETRY=false
		export YARN_ENABLE_SCRIPTS=true
		export YARN_HTTP_TIMEOUT=600000
		export YARN_HTTP_RETRY=5
		export YARN_NPM_REGISTRY_SERVER="${YARN_NPM_REGISTRY_SERVER:-${NPM_CONFIG_REGISTRY:-https://registry.yarnpkg.com}}"
		mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}" "${COREPACK_HOME}"
	else
		export YARN_GLOBAL_FOLDER="${HOME}/.yarn/global"
		export YARN_LINK_FOLDER="${HOME}/.yarn/link"
		export YARN_TEMP_FOLDER="${HOME}/.yarn/tmp"
		export YARN_NETWORK_TIMEOUT=600000
		export YARN_CHILD_CONCURRENCY="$(nproc)"
		export YARN_FROZEN_LOCKFILE=true
		export YARN_IGNORE_ENGINES=true
		export YARN_PRODUCTION=false
		mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}" "${YARN_LINK_FOLDER}" "${YARN_TEMP_FOLDER}" "${COREPACK_HOME}"
	fi
	local _reg="${NPM_CONFIG_REGISTRY:-https://registry.yarnpkg.com}"
	_reg="${_reg%/}"
	if [[ -f .yarnrc ]]; then
		sed -i "s|^registry .*|registry \"${_reg}\"|" .yarnrc
	fi
	if [[ -f yarn.lock ]] && grep -q 'resolved "https://registry.yarnpkg.com' yarn.lock; then
		sed -i "s|https://registry.yarnpkg.com/|${_reg}/|g" yarn.lock
	fi
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-git}/
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_build_env
    sed -i "s/'deb'/'dir'/;s/'rpm'/'dir'/" configs/electron-builder.ts
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    sed -i -e "
        s/target: 'deb'/target: 'dir'/g
        s/target: 'rpm'/target: 'dir'/g
    " configs/electron-builder.linux.ts
    # Add electronDist to use system electron39
    sed -i "/electronVersion: '39.8.10',/a\\  electronDist: '${ELECTRON_DIST}'," configs/electron-builder.linux.ts
    export NODE_ENV=development
    yarn install
    # Init notarize.ts File
    if [ -f build/notarize.ts ];then
        rm -rf build/notarize.ts
    fi
    mkdir -p build
    {
        echo 'export default async function notarizing() {'
        echo '  return;'
        echo '}'
    } >> build/notarize.ts
    # Build Go helper
    cd "$(_get_project_dir)/src/helper-go"
    sed -i "s/CGO_ENABLED=0/CGO_ENABLED=1/g" build-os.sh
    chmod +x ./build-os.sh
    bash ./build-os.sh
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    yarn run clean:dev
    yarn run clean
    npx esbuild --platform=node --bundle --packages=external --inject:scripts/shim-dynamic-require.mjs --format=esm scripts/app-builder.ts --outfile=electron/app-builder.mjs
    node electron/app-builder.mjs
    local _arch7z=$([[ "${CARCH}" == "aarch64" ]] && echo arm64 || echo x64)
    local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm64)
    rm -rf "$(_get_app_dir)/resources/app.asar.unpacked/node_modules/7zip-bin/"{linux/{arm,ia32,"${_archrem}"},mac}
    ln -sf "/usr/bin/7za" "$(_get_app_dir)/resources/app.asar.unpacked/node_modules/7zip-bin/linux/${_arch7z}/7za"
    rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "$(_get_project_dir)/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}