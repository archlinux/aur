# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wubi-dict-editor
_zhname='五笔码表助手'
pkgver=1.3.16
_electronversion=28
_nodeversion=20
pkgrel=1
pkgdesc="Five Pen Watch Assistant for Rime.五笔码表助手 for Rime."
arch=('x86_64')
url="https://github.com/KyleBing/wubi-dict-editor"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'yarn'
    'nvm'
    'gendesk'
    'libicns'
    'curl'
    'git'
    'jq'
    'zip'
)
optdepends=(
    'ibus-rime: Rime input method framework for IBus'
    'fcitx5-rime: Rime input method framework for Fcitx5'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('b1532c3e222256f94e1ecb35ec177100d61c0a819b7fea38d4c0a279423afdcd'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
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
	export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
	export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/global"
	export YARN_LINK_FOLDER="${srcdir}/.yarn/link"
	export YARN_TEMP_FOLDER="${srcdir}/.yarn/tmp"
	export YARN_NETWORK_CONCURRENCY=32
	export YARN_NETWORK_TIMEOUT=600000
	export YARN_CHILD_CONCURRENCY="$(nproc)"
	export YARN_FROZEN_LOCKFILE=true
	export YARN_NONINTERACTIVE=true
	export YARN_NO_PROGRESS=true
	export YARN_IGNORE_ENGINES=true
	export NODE_ENV=production
	export YARN_PRODUCTION=false
	export npm_config_platform=linux
	export npm_config_arch="${CARCH}"
	export NODE_OPTIONS="--max-old-space-size=4096"
	mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}" "${YARN_LINK_FOLDER}" "${YARN_TEMP_FOLDER}"
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
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${pkgname}" \
        --genericname="${_zhname} for Rime" \
        --exec="${pkgname} %U" \
        --custom="Name[zh_CN]=${_zhname}"
    _set_build_env
    _ensure_local_nvm
    icns2png  -d 32 -x assets/img/appIcon/appIcon.icns -o assets/img/appIcon/
    cp assets/img/appIcon/appIcon_16x16x32.png assets/img/appIcon/appicon.png
    sed -i "s/appIcon\/appicon\ico/img\/appIcon\/appicon\.png/g" main.js
    NODE_ENV=development    yarn install
    _use_local_electron_for_forge
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -exec dirname {} + | head -n 1)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname}/"
    _icon_sizes=(16x16 32x32 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/img/appIcon/appIcon_${_icons}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/app/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}