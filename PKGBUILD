# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=caprine
pkgname="${_appname}-ng-git"
_pkgname=Caprine
pkgver=2.57.0.r88.gc87530a
_electronversion=22
_nodeversion=16
pkgrel=1
pkgdesc="Elegant Facebook Messenger desktop app - Legacy OS Builds"
arch=('any')
url="https://github.com/Alex313031/caprine-ng"
license=("MIT")
conflicts=(
    "${pkgname%-git}"
    "${_appname}"
)
provides=("${_appname}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'cmake'
    'gcc'
    'curl'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
    "${pkgname%-git}.sh")
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
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    cd "${srcdir}/${pkgname%-git}.git"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    echo 'build_from_source=true'  >> .npmrc
    echo "cache="${srcdir}"/.npm_cache"  >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        echo 'registry=https://registry.npmmirror.com' >> .npmrc
        echo 'disturl=https://registry.npmmirror.com/-/binary/node/' >> .npmrc
        echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/' >> .npmrc
        echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/' >> .npmrc
    else
        echo "Your network is OK."
    fi
    rm -rf dist dist-js node_modules test
    sed "s|\"electron\": \"\([^\"]*\)\"|\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"|g" -i package.json
    NODE_ENV=development    npm install
    NODE_ENV=production     npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}.git/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname%-git}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/packages/rpm/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/license" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}