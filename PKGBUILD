# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tropy-git
_pkgname=Tropy
_appname="org.${pkgname%-git}.${_pkgname}"
pkgver=1.18.0.beta.6.r8.gfd9c828
_electronversion=44
_nodeversion=24
pkgrel=1
pkgdesc="Explore your research photos."
arch=('any')
url="https://tropy.org/"
_ghurl="https://github.com/tropy/tropy"
license=('AGPL-3.0-or-later')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'libvips'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'jq'
    'zip'
)
optdepends=(
    'libheif: for heif support'
    'poppler-glib: for pdf support')
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_app_dir() {
	find "${srcdir}" -type d -name "node_modules" -prune -o -type f -name "resources.pak" -print0 | xargs -0 dirname | head -n 1
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
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export npm_config_cache="${HOME}/.npm_cache"
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	export npm_config_audit=false
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}"
}
_use_local_electron_zip() {
    local _v="${SYSTEM_ELECTRON_VERSION}"
    local _zd="${srcdir}/electron-zips"
    case "${CARCH}" in
        aarch64)    _arch=arm64 ;;
        x86_64)     _arch=x64 ;;
    esac
    local _zf="${_zd}/electron-v${_v}-linux-${_arch}.zip"
    if [[ ! -f "${_zf}" ]]; then
        install -Dm755 -d "${_zd}"
        ( cd "${ELECTRON_DIST}" && zip -r -q -0 "${_zf}" . )
    fi
    export ELECTRON_ZIP_DIR="${_zd}"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}-beta/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Graphics" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"    
    _ensure_local_nvm
    _set_build_env
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    find src -type f -exec sed -i "s/process.execPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -i "s/${_appname}/${pkgname%-git}/g" res/{linux/"${_appname}.metainfo.xml",mime/"${pkgname%-git}.xml"}
    export	NODE_ENV=development
    npm install --legacy-peer-deps
    _use_local_electron_zip
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    _set_build_env
    export	NODE_ENV=production
    export  SHARP_FORCE_GLOBAL_LIBVIPS=true
    #node scripts/rebuild.js --force --global-libvips
    local _app_name="${pkgname%-git}"
    npx @electron/packager . "${pkgname%-git}" \
        --platform=linux \
        --arch=x64 \
        --out=dist \
        --overwrite \
        --no-prune \
        --electron-zip-dir="${ELECTRON_ZIP_DIR}" \
        --asar \
        --asar.unpack="**/{lib/node/**/*,lib/sharp-libvips-*/**/*,res/{icons,keymaps,plugins,views}/**/*,package.json,LICENSE*}"
    local _dist_dir="dist/${_app_name}-linux-x64"
    local _resources="${_dist_dir}/resources"
    mkdir -p "${_resources}/icons/hicolor"
    cp -r "res/icons/beta/tropy" "${_resources}/icons/hicolor/"
    for _type in mtpy tpy ttp; do
        if [[ -d "res/icons/mime/${_type}" ]]; then
            mkdir -p "${_resources}/icons/hicolor/${_type}"
            cp -r "res/icons/mime/${_type}"/* "${_resources}/icons/hicolor/${_type}/" 2>/dev/null || true
        fi
    done
    mkdir -p "${_resources}/mime/packages"
    cp "res/mime/tropy.xml" "${_resources}/mime/packages/${_appname}.xml"
    local _app_dir=$(_get_app_dir)
    case "${CARCH}" in
        aarch64)    _arch_rem=x64 ;;
        x86_64)     _arch_rem=arm ;;
    esac
    find "${_app_dir}" \
        \( -name "*darwin*" -o -name "*win32*" -o -name "*${_arch_rem}*" \) \
        -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    icon_sizes=(16x16 24x24 32x32 40x40 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/res/icons/beta/${pkgname%-git}/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/res/mime/${pkgname%-git}.xml" -t "${pkgdir}/usr/share/mime/packages"
    install -Dm644 "${srcdir}/${pkgname//-/.}/res/linux/${_appname}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname%-git}.metainfo.xml"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
