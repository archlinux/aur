# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pulsar-git
_pkgname=Pulsar
_debname="dev.${pkgname%-git}_edit.${_pkgname}"
pkgver=1.131.2.r149.g524932a
_electronversion=32
_nodeversion=20
pkgrel=1
pkgdesc="A Community-led Hyper-Hackable Text Editor, Forked from Atom, built on Electron."
arch=('any')
url="https://pulsar-edit.dev/"
_ghurl="https://github.com/pulsar-edit/pulsar"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'python-packaging'
    'ruby'
    'python'
    'python-typing_extensions'
    'perl'
    'libsecret'
    'libxkbfile'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'yarn'
    'jq'
    'python-setuptools'
    'python'
    'python-setuptools'
    'openssl'
    'libssh2'
    'libx11'
    'libxkbfile'
    'libsecret'
    'libxkbcommon'
    'ncurses'
    'libffi'
    'bzip2'
    'zlib'
    'tk'
    'sqlite'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
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
	find "${srcdir}" -type d -name "*-unpacked" -print 2>/dev/null | head -n 1
}
_get_electron_version() {
	_elec_ver=$(find "$(_get_project_dir)" -name "package.json" ! -path "*/node_modules/*" -print \
		| xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null \
		| grep -v '^$' | sed 's/^[^0-9]*//' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
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
	export YARN_CACHE_FOLDER="${HOME}/.yarn/cache"
	export YARN_NETWORK_CONCURRENCY=32
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	export npm_config_registry="${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}"
	export PYTHON=/usr/bin/python3
	export npm_config_python=/usr/bin/python3
	export npm_config_build_from_source=true
	export JOBS="$(nproc)"
	export CC=/usr/bin/gcc
	export CXX=/usr/bin/g++
	export CFLAGS="${CFLAGS:-} -w"
	export CXXFLAGS="${CXXFLAGS:-} -w"
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
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-git}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    _set_build_env
    sed -i -e "
        /'appimage'/d
        /'deb'/d
        /'rpm'/d
        s/'tar.gz'/'dir'/g
        /^let options = {/a\\  electronDist: '${ELECTRON_DIST}',
    " script/electron-builder.js
    # Fix: less/dist is needed at runtime for less-cache to compile stylesheets
    sed -i 's/"!\*\*\/less\/dist"/\/\/ "!**\/less\/dist"/' script/electron-builder.js
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    sed -i "s/${_debname}/${pkgname%-git}/g" "resources/linux/${_debname}.metainfo.xml"
    sed -i -e "
        s/<\%\= appName \%>/${_pkgname}/g
        s/<\%\= description \%>/${pkgdesc}/g
        s/<\%\= installDir \%>\/bin\/<\%\= appFileName \%> --no-sandbox/${pkgname%-git}/
        s/<\%\= iconPath \%>/${pkgname%-git}/
    " "resources/linux/${pkgname%-git}.desktop.in"
    git submodule update --depth=1 --init --recursive
    find "$(_get_project_dir)" -type f -name "yarn.lock" -exec rm -rf {} +
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    export NODE_ENV=development
    yarn install --ignore-engines
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    export TMPDIR="${srcdir}"
    yarn build
    yarn build:apm
    # Fix: git-utils binding.gyp missing net.c on Linux (causes undefined symbol: git_net_url_dispose)
    # net.c is only in Windows sources but netops.c (in common sources) calls git_net_url_dispose from net.c
    sed -i "/netops\.c/a\\        'deps/libgit2/src/net.c'," ppm/node_modules/git-utils/binding.gyp
    cd ppm/node_modules/git-utils && npm rebuild
    cd "$(_get_project_dir)"
    yarn dist
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/default_app.asar"
    local _src="$(_get_project_dir)"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 384x384)
	for _icons in "${_icon_sizes[@]}";do
		install -Dm644 "${_src}/resources/icons/${_icons}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
	done
    install -Dm644 "${_src}/resources/linux/${pkgname%-git}.desktop.in" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${_src}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}