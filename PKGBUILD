# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mustang
_pkgname=Mustang
pkgver=0.9.33
_electronversion=41
_nodever=24
pkgrel=1
pkgdesc="New full-featured desktop email, chat and video conference client.(Use system-wide electron)"
arch=('any')
url="https://mustang.im/"
_ghurl="https://github.com/mustang-im/mustang"
license=('EUPL-1.2')
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'curl'
    'gendesk'
    'git'
    'yarn'
    'jq'
)
source=("${pkgname}.sh")
sha256sums=('a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodever}"
    nvm use "${_nodever}"
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_set_build_env() {
    export electronDist="/usr/lib/electron${_electronversion}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	export HOME="${srcdir}/.electron-gyp"
	mkdir -p "${srcdir}/.electron-gyp"
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		{
			export YARN_REGISTRY="https://registry.npmmirror.com"
			export ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
			export ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
			export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
			export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
			export YARN_PLUGINS_FOLDER="${srcdir}/.yarn/plugins"
			export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/global"
			export YARN_USE_HARDLINKS=true
			# export YARN_BUILD_FROM_SOURCE=true
			export YARN_LINK_WORKSPACE_PACKAGES=true
			export YARN_FETCH_RETRIES=3
			export YARN_FETCH_RETRY_TIMEOUT=10000
			export YARN_NETWORK_CONCURRENCY=32
		}
		find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
	fi
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}"
    if [[ ! -d "${srcdir}/${pkgname}-${pkgver}" ]]; then
        git clone \
            --depth 1 \
            --branch "v${pkgver}" \
            "${_ghurl}" \
            "${pkgname}-${pkgver}"
    fi
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _set_build_env
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}-${pkgver}/app/build"
    sh "${pkgname}-brand.sh"
    cd "${srcdir}/${pkgname}-${pkgver}/app"
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    cd "${srcdir}/${pkgname}-${pkgver}/lib"
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    cd "${srcdir}/${pkgname}-${pkgver}/desktop"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    cd "${srcdir}/${pkgname}-${pkgver}/desktop/backend"
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    NODE_ENV=development    yarn add -D semver
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}/desktop"
    _set_build_env
    _ensure_local_nvm
    NODE_OPTIONS="--max-old-space-size=4096" NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" --config electron-builder.yml
    local _app_dir=$(_get_app_dir)
    find "${_app_dir}/resources/app.asar.unpacked" -type d \( -name "darwin-*" -o -name "win32-*" \) -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/desktop/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
