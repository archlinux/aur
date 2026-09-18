# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flyenv-git
_pkgname=FlyEnv
pkgver=4.18.3.r12.g163389f
_electronversion=39
_nodeversion=22
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
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
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
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	_ev="$(electron${_electronversion} -v)"
	export SYSTEM_ELECTRON_VERSION="${_ev#v}"
	export HOME="${srcdir}/.electron-gyp"
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_DATA_HOME="${srcdir}/.local/share"
	export npm_config_platform=linux
	export npm_config_arch="${CARCH}"
	export NODE_OPTIONS="--max-old-space-size=4096"
	export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
	export YARN_NETWORK_CONCURRENCY=32
	local _yarnver _yarnmajor=0
	_yarnver="$(node -p "require('./package.json').packageManager?.split('@')[1]?.split('-')[0] || ''" 2>/dev/null)"
	_yarnmajor="${_yarnver%%.*}"
	_yarnmajor="${_yarnmajor:-0}"
	if [[ "${_yarnmajor}" -ge 2 ]] 2>/dev/null || [[ -f .yarnrc.yml ]]; then
		export XDG_STATE_HOME="${srcdir}/.local/state"
		export YARN_ENABLE_GLOBAL_CACHE=false
		export YARN_ENABLE_MIRROR=false
		export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/berry"
		export YARN_NODE_LINKER=node-modules
		export YARN_NM_MODE=hardlinks-local
		export YARN_ENABLE_TELEMETRY=false
		export YARN_ENABLE_SCRIPTS=true
		export YARN_ENABLE_IMMUTABLE_INSTALLS=false
		export YARN_ENABLE_PROGRESS_BARS=false
		export YARN_ENABLE_COLORS=false
		export YARN_HTTP_TIMEOUT=600000
		export YARN_HTTP_RETRY=5
		export COREPACK_HOME="${srcdir}/.corepack"
		mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}"
		install -dm755 "${srcdir}/.bin"
		corepack enable --install-directory "${srcdir}/.bin"
		export PATH="${srcdir}/.bin:${PATH}"
		corepack prepare "yarn@${_yarnver}" --activate
	else
		export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/global"
		export YARN_LINK_FOLDER="${srcdir}/.yarn/link"
		export YARN_TEMP_FOLDER="${srcdir}/.yarn/tmp"
		export YARN_NETWORK_TIMEOUT=600000
		export YARN_CHILD_CONCURRENCY="$(nproc)"
		export YARN_FROZEN_LOCKFILE=true
		export YARN_NONINTERACTIVE=true
		export YARN_NO_PROGRESS=true
		export YARN_IGNORE_ENGINES=true
		export NODE_ENV=production
		export YARN_PRODUCTION=false
		mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}" "${YARN_LINK_FOLDER}" "${YARN_TEMP_FOLDER}"
	fi
    export GOPATH="${srcdir}/go"
	export GOMODCACHE="${GOPATH}/pkg/mod"
	export GOBIN="${GOPATH}/bin"
	export GOCACHE="${srcdir}/go-build"
	export GOENV="${srcdir}/go/env"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export CGO_ENABLED=1
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export GOTOOLCHAIN=local
	export GOWORK=off
	mkdir -p "${GOMODCACHE}" "${GOBIN}" "${GOCACHE}" "${XDG_CONFIG_HOME}" "${XDG_CACHE_HOME}" "$(dirname "${GOENV}")"
	: > "${GOENV}"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-git}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
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
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/;s/git pull \&\& //" package.json
    sed -i -e "
        s/target: 'deb'/target: 'dir'/g
        s/target: 'rpm'/target: 'dir'/g
    " configs/electron-builder.linux.ts
    # Add electronDist to use system electron39
    sed -i "/electronVersion: '39.8.10',/a\\  electronDist: '${ELECTRON_DIST}'," configs/electron-builder.linux.ts
    NODE_ENV=development    yarn install
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
    cd "${srcdir}/${pkgname//-/.}/src/helper-go"
    sed -i "s/CGO_ENABLED=0/CGO_ENABLED=1/g" build-os.sh
    chmod +x ./build-os.sh
    bash ./build-os.sh
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    _set_build_env
    NODE_ENV=production     yarn run clean:dev
    NODE_ENV=production     yarn run clean
    NODE_ENV=production     npx esbuild --platform=node --bundle --packages=external --inject:scripts/shim-dynamic-require.mjs --format=esm scripts/app-builder.ts --outfile=electron/app-builder.mjs
    NODE_ENV=production     node electron/app-builder.mjs
    case "${CARCH}" in
        aarch64)
            _archbuild=linux-arm64-unpacked
            _arch7z=arm64
            ;;
        x86_64)
            _archbuild=linux-unpacked
            _arch7z=x64
            ;;
    esac
    local _app_dir=$(_get_app_dir)
    rm -rf "${_app_dir}/resources/app.asar.unpacked/node_modules/7zip-bin/"{linux/{arm,ia32,"${_arch7z}"},mac}
    ln -sf "/usr/bin/7za" "${_app_dir}/resources/app.asar.unpacked/node_modules/7zip-bin/linux/${_arch7z}/7za"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
