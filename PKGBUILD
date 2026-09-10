# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=boson-git
pkgver=0.7.0.r0.g6462fa7
_electronversion=41
_nodeversion=24
pkgrel=1
pkgdesc="SDSS observer graphical interface."
arch=('any')
url="https://albireox.github.io/boson/"
_ghurl="https://github.com/albireox/boson"
license=('BSD-3-Clause')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'yarn'
    'git'
    'nvm'
    'gendesk'
    'curl'
    'jq'
    'zip'
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
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export NODE_OPTIONS="--max-old-space-size=4096"
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	export HOME="${srcdir}/.electron-gyp"
	export npm_config_platform=linux
	export npm_config_arch="${CARCH}"
	mkdir -p "${srcdir}/.electron-gyp"
	export NODE_ENV=production
	export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
	export YARN_NODE_LINKER=node-modules
	local mirror_mode="${USE_CHINA_MIRROR:-auto}"
	case "${mirror_mode}" in
		1)
			echo "==> USE_CHINA_MIRROR=1: Enforce npmmirror" >&2
			_apply_china_mirror
			;;
		0)
			echo "==> USE_CHINA_MIRROR=0: Enforce upstream registry" >&2
			;;
		auto)
			echo "==> Auto checking registry.npmjs.org connectivity..." >&2
			if ! timeout 3 bash -c 'exec 3<>/dev/tcp/registry.npmjs.org/443' 2>/dev/null; then
				echo "==> Cannot connect upstream npm, switching to npmmirror" >&2
				_apply_china_mirror
			else
				echo "==> Upstream npm reachable, keep original registry" >&2
			fi
			;;
		*)
			echo "==> Invalid USE_CHINA_MIRROR value, fallback to upstream" >&2
			;;
	esac
}
_apply_china_mirror() {
	export YARN_NPM_REGISTRY_SERVER="https://registry.npmmirror.com"
	export ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
	export ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
	export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
}
_use_new_yarn() {
	_yarnver=`grep "yarn@" package.json | awk '{print $2}' | sed "s/\"//g;s/yarn@//g;s/,//g"`
	corepack enable
	corepack prepare yarn@"${_yarnver}" --activate
}
_use_local_electron_for_forge() {
	local _v="${SYSTEM_ELECTRON_VERSION}"
	local _zd="${srcdir}/electron-zips"
	case "${CARCH}" in
		aarch64)	_arch=arm64	;;
		x86_64)	_arch=x64	;;
	esac
	local _zf="${_zd}/electron-v${_v}-linux-${_arch}.zip"
	install -Dm755 -d "${_zd}"
	( cd "${ELECTRON_DIST}" && zip -r -q -0 "${_zf}" . )
	sed -i "/packagerConfig:[[:space:]]*{/a\\    electronZipDir: '${_zd}'," forge.config.*
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
    " -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${pkgname%-git}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    _use_new_yarn
    NODE_ENV=development    yarn install
    _use_local_electron_for_forge
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname//-/.}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/package.json" "${pkgdir}/usr/share/licenses/${pkgname}"
}
