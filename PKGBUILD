# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=requestly-git
_pkgname=Requestly
pkgver=26.2.20.r1.g811b550
_electronversion=27
_nodeversion=20
pkgrel=1
pkgdesc="Debug your network request across all platforms and browsers using a single app.(Use syetem-wide electron)"
arch=('x86_64')
url="https://requestly.io/"
_ghurl="https://github.com/requestly/requestly-desktop-app"
_proxyurl="https://github.com/requestly/requestly-proxy"
license=('AGPL-3.0-only')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
    'python'
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'git'
    'asar'
    'python-setuptools'
    'curl'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}-proxy::git+${_proxyurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'SKIP'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
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
_get_electron_version() {
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${pkgname//-/.}/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -f -n -q \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        echo "maxsockets=32"
    } >> .npmrc
    if [[ "$(curl -s cip.cc)" == *"中国"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    _ensure_local_nvm
    echo "${srcdir}/${pkgname%-git}-proxy" "${srcdir}/${pkgname//-/.}" | xargs -n 1 cp .npmrc
    cd "${srcdir}/${pkgname%-git}-proxy"
    NODE_ENV=development    npm install
    NODE_ENV=production     npm run build
    cd "${srcdir}/${pkgname//-/.}"
    sed -e "
        s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g
        s/\"electronVersion\": \"[^\"]*\"/\"electronVersion\": \"${SYSTEM_ELECTRON_VERSION}\"/g
        s/icon.icns/icon.png/g
    " -i package.json
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} \;
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npm run build
    NODE_ENV=production     npm exec -c "electron-builder build --linux dir -c.electronDist=${electronDist}"
    asar e "${srcdir}/${pkgname//-/.}/release/build/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/${pkgname//-/.}/release/build/linux-unpacked/resources/app.asar"
    install -Dm644 src/loadingScreen/index.html -t "${srcdir}/app.asar.unpacked/dist/loadingScreen"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname//-/.}/release/build/linux-unpacked/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	find "${srcdir}/${pkgname//-/.}/release/build/linux-unpacked/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-git}" {} +
    if find "${srcdir}/${pkgname//-/.}/release/build/linux-unpacked/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/${pkgname//-/.}/release/build/linux-unpacked/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-git}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512 1024x1024)
    for _icon in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/assets/icons/${_icon}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icon}/apps"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${srcdir}/usr/share/licenses/${pkgname}"
}
