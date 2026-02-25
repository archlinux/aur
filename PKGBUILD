# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mustang
_pkgname=Mustang
pkgver=0.9.17
_electronversion=32
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
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('c7796a3755c5172a0019fa70af68c400d7dc18834a344f2839a4c8e977dbe4f0'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodever}"
    nvm use "${_nodever}"
}
_get_electron_version() {
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${pkgname}-${pkgver}/desktop/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo -e '\n'
            echo 'registry "https://registry.npmmirror.com"'
            echo 'electron_mirror "https://registry.npmmirror.com/-/binary/electron/"'
            echo 'electron_builder_binaries_mirror "https://registry.npmmirror.com/-/binary/electron-builder-binaries/"'
            echo "cacheFolder "${srcdir}"/.yarn/cache"
            echo "pluginsFolder "${srcdir}"/.yarn/plugins"
            echo "globalFolder "${srcdir}"/.yarn/global"
            echo 'useHardlinks true'
            #echo 'buildFromSource true'
            echo 'linkWorkspacePackages true'
            echo 'fetchRetries 3'
            echo 'fetchRetryTimeout 10000'
        } >> .yarnrc
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
        echo '[url "https://github.moeyy.xyz/https://github.com/"]' >> "${srcdir}/${pkgname}-${pkgver}/app/.gitconfig"
        echo '    insteadof = https://github.com/' >> "${srcdir}/${pkgname}-${pkgver}/app/.gitconfig"
        echo app lib desktop desktop/backend runner | xargs -n 1 cp .yarnrc
    fi
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
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_OPTIONS="--max-old-space-size=4096" NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" --config electron-builder.yml
    find "${srcdir}/${pkgname}-${pkgver}/desktop/dist/linux-"*"/resources/app.asar.unpacked" -type d \
        \( -name "darwin-*" -o -name "win32-*" \) -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	find "${srcdir}/${pkgname}-${pkgver}/desktop/dist/linux-"*"/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/${pkgname}-${pkgver}/desktop/dist/linux-"*"/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/${pkgname}-${pkgver}/desktop/dist/linux-"*"/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/desktop/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
