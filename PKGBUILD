# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=draw.io
pkgname="${_pkgname//./}-desktop-git"
pkgver=31.4.5.r1.gf5cc222
_electronversion=44
_nodeversion=24
pkgrel=1
pkgdesc="A diagramming and whiteboarding desktop app based on Electron that wraps the core draw.io editor."
arch=('any')
url="https://www.diagrams.net/"
_ghurl="https://github.com/jgraph/drawio-desktop"
license=('Apache-2.0')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'pnpm'
    'npm'
    'nvm'
    'libicns'
    'imagemagick'
    'curl'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.xml"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a4e054e91cdbea6fe37c0767460816a951bc7876b5855752898f6575d15f23e6'
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
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
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
	export npm_config_cache="${srcdir}/.npm_cache"
	export npm_config_maxsockets=32
	export npm_config_audit=false
	export npm_config_fund=false
	export npm_config_progress=false
	export NODE_OPTIONS="--max-old-space-size=4096"
	export npm_config_node_options="--max-old-space-size=4096"
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Graphics" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U" \
        --mimetypes="application/vnd.jgraph.mxfile;application/vnd.ms-visio.drawing.main+xml"
    _set_build_env
    _ensure_local_nvm
    sed -i "/StartupWMClass/d" electron-builder-linux-mac.json
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    git submodule update --depth=1 --init --recursive
    cd "${srcdir}/${pkgname%-git}.git/drawio"
    rm -rf docs etc src/main/java src/main/webapp/connect src/main/webapp/service-worker* src/main/webapp/workbox-*
    cd "${srcdir}/${pkgname%-git}.git/drawio/src/main/webapp/js"
    rm -rf atlas-viewer.min.js atlas.min.js cryptojs deflate dropbox embed* freehand integrate.min.js jquery jszip \
        mermaid onedrive orgchart reader.min.js rough sanitizer shapes.min.js simplepeer spin viewer-static.min.js viewer.min.js
    cd "${srcdir}/${pkgname%-git}.git"
    NODE_ENV=development    npm install --legacy-peer-deps
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=development    npm run sync
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config=electron-builder-linux-mac.json"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 96x96 128x128 192x192 256x256 512x512 720x720 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/build/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-git}.xml" -t "${pkgdir}/usr/share/mime/packages"
}
