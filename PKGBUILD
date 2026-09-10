# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-widgets-git
_pkgname='Electron-Widgets'
pkgver=2.1.5.r21.g5be2e0b
_electronversion=38
_nodeversion=22
pkgrel=1
pkgdesc="Allows users to create and manage widgets on their desktops. These widgets enable users to quickly and easily access the information or tools they need."
arch=('any')
url="https://electron-widgets.vercel.app/"
_ghurl="https://github.com/sametcn99/electron-widgets"
license=('GPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'curl'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
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
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export NODE_OPTIONS="--max-old-space-size=4096"
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	export HOME="${srcdir}/.electron-gyp"
	export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
	export NPM_CONFIG_MAXSOCKETS=32
	export npm_config_platform=linux
	export npm_config_arch="${CARCH}"
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
prepare() {
    cd "${srcdir}/${pkgname%-git}.git/apps/desktop"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install --legacy-peer-deps
    _use_local_electron_for_forge
}
build() {
    cd "${srcdir}/${pkgname%-git}.git/apps/desktop"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     npm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/apps/desktop/public//assets/electron.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/apps/desktop/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}