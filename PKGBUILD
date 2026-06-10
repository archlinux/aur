# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=podman-desktop-git
_pkgname='Podman Desktop'
_flatpakname="io.podman_desktop.${_pkgname// /}"
pkgver=r10517.1c9ae4a
_electronversion=42
_nodeversion=24
pkgrel=1
pkgdesc="A graphical tool for developing on containers and Kubernetes.(Use system-wide electron)"
arch=('any')
url="https://podman-desktop.io/"
_ghurl="https://github.com/podman-desktop/podman-desktop"
license=('Apache-2.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'docker-compose'
    'podman'
    'docker'
    'python'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'pnpm'
    'jq'
    'node-gyp'
)
optdepends=(
    "crc: crc plugin"
    "lima: lima plugin"
    "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
    "trash-cli: file deletion support (trash-put)"
    "libappindicator-gtk3: StatusNotifierItem support"
    "pipewire: WebRTC desktop sharing under Wayland"
    "qt5-base: enable Qt5 with --enable-features=AllowQt"
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git fetch --tags
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    _get_electron_version
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	HOME="${srcdir}/.electron-gyp"
	{
		export PNPM_LINK_WORKSPACE_PACKAGES=true
		export PNPM_FETCH_RETRY_MAXTIMEOUT=10000
		export PNPM_CACHE_DIR="${srcdir}/.pnpm_cache"
		export PNPM_STORE_DIR="${srcdir}/.pnpm_store"
		export PNPM_VIRTUAL_STORE_DIR="${srcdir}/.pnpm_store"
		export PNPM_SHAMEFULLY_HOIST=true
		export PNPM_VIRTUAL_STORE_DIR_MAX_LENGTH=80
		export PNPM_NODE_LINKER=hoisted
		export PNPM_NETWORK_CONCURRENCY=32
	}
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		{
			export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
			export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
			export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
			export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
		}
	fi
    _ensure_local_nvm
    find packages -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/" {} +
    sed -i -e "
        s/run.sh/${pkgname%-git}/g
        s/${_flatpakname}/${pkgname%-git}/g
        /X-Flatpak/d
    " .flatpak.desktop
    sed -i "s/${_flatpakname}/${pkgname%-git}/" .flatpak-appdata.xml
    sed -i "s/\'flatpak\', \'tar.gz\'/\'dir\'/" .electron-builder.config.cjs
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/" package.json
    NODE_ENV=development    pnpm add -D -w node-addon-api
    NODE_ENV=development    pnpm install --no-lockfile
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     pnpm run build:main
    NODE_ENV=production     pnpm run build:preload
    NODE_ENV=production     pnpm run build:preload-docker-extension
    NODE_ENV=production     pnpm run build:preload-webview
    NODE_ENV=production     pnpm run build:preload:types
    NODE_ENV=production     pnpm run build:ui
    NODE_ENV=production     pnpm run build:renderer
    NODE_ENV=production     pnpm run build:extensions
    NODE_ENV=production     pnpm -c exec "electron-builder build --linux dir -c.electronDist=${electronDist} --config .electron-builder.config.cjs --config.asar=false"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -exec dirname {} + | head -n 1)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/.flatpak.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/buildResources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/buildResources/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
