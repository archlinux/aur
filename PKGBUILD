# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electerm-git
pkgver=1.40.18.r0.gb48b41f
_electronversion=26
_nodeversion=20
pkgrel=1
pkgdesc="Terminal/ssh/telnet/serialport/sftp client(linux, mac, win)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://electerm.html5beta.com/"
_ghurl="https://github.com/electerm/electerm"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'yarn'
    'git'
    'nvm'
    'gendesk'
    'python-setuptools'
    'gcc'
    'curl'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
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
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="System" --name="${pkgname%-git}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    electronDist="/usr/lib/electron${_electronversion}"
    export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo -e '\n'
            echo 'registry "https://registry.npmmirror.com"'
            echo 'disturl "https://registry.npmmirror.com/-/binary/node/"'
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
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/" package.json
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    NODE_ENV=production     yarn run prepare-build
    NODE_ENV=production     yarn node build/bin/build-common
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" -c.electronVersion="${electronVer}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/dist/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/node_modules/@${pkgname%-git}/${pkgname%-git}-resource/build-res/appx/StoreLogo.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}