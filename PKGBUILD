# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=tidgi
pkgname="${_pkgname}-desktop-git"
_appname=TidGi
pkgver=0.11.1.r0.g3e51aec
_electronversion=33
_nodeversion=22
pkgrel=1
pkgdesc="An privatcy-in-mind, automated, auto-git-backup, freely-deployed Tiddlywiki knowledge management Desktop note app, with local REST API.(Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://tidgi.fun/"
_ghurl="https://github.com/tiddly-gittly/TidGi-Desktop"
license=('MPL-2.0')
conflicts=(
    "${pkgname%-git}"
    "${_pkgname}"
)
provides=(
    "${_pkgname}"
    "${pkgname%-git}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'npm'
    'pnpm'
    'nvm'
    'curl'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${_pkgname}-desktop" --comment="${pkgdesc}" --categories="Office" --name="${_appname}" --exec="${pkgname%-git} --no-sandbox %U"
    cd "${srcdir}/${pkgname%-git}.git"
    electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
        echo 'registry=https://registry.npmmirror.com'
        echo 'electron_mirror=https://cdn.npmmirror.com/binaries/electron/'
        echo 'electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/'
        } >> .npmrc
    fi
    sed -i "s/icon\.ico/\icon.png/g" forge.config.js
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    pnpm install --no-frozen-lockfile
    NODE_ENV=production     pnpm run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/out/${_appname}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/out/${_appname}-linux-"*/resources/*.png -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-git}.git/out/${_appname}-linux-"*/resources/{app.asar.unpacked,localization,node_modules,wiki} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build-resources/icon@5x.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}