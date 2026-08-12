# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Shuyuan Liu <liu_shuyuan at qq dot com>
pkgname=issie
pkgver=6.0.14
_electronversion=43
_nodeversion=24
pkgrel=1
pkgdesc="An Interactive Schematic Simulator with Integrated Editor."
arch=('any')
url="https://tomcl.github.io/issie"
_ghurl="https://github.com/tomcl/issie"
license=('LGPL-3.0-or-later')
conflicts=("${pkgname}")
depends=(
    'nspr'
    'nss'
    'alsa-lib'
    'gtk3'
    "electron${_electronversion}"
    'python'
)
makedepends=(
    'nvm'
    'npm'
    'dotnet-sdk>=8'
    'gendesk'
    'curl'
    'git'
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
)
sha256sums=('0de8b5b6ade3aabdea308668a7332565c4ee52b0550fa65832bc01bf75de46ca')
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
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
    export DOTNET_CLI_HOME="${srcdir}/.dotnet"
    export NPM_CONFIG_CACHE="${srcdir}/.npm_cache"
    export NPM_CONFIG_MAXSOCKETS=32
    export MSBUILDDISABLENODEREUSE=1
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
            export ELECTRON_BUILDER_BINARIES_MIRROR="https://npmmirror.com/mirrors/electron-builder-binaries/"
        }
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version   
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${pkgname}" \
        --exec="${pkgname} --no-sandbox %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    dotnet tool restore
    dotnet paket install
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     npm run compile
    NODE_ENV=production     npm run build
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST}"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname}"}
    cp -a "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/* "${pkgdir}/usr/lib/${pkgname}"
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome_crashpad_handler chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
        libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
    for _files in "${_file_list[@]}";do
        rm -rf "${pkgdir}/usr/lib/${pkgname%-bin}/${_files}"
        ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${pkgdir}/usr/lib/${pkgname%-bin}/${_files}"
    done
    ln -sf "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
