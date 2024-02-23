# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electerm-git
pkgver=1.38.19.r0.gfc55a17a
_electronversion=26
pkgrel=1
pkgdesc="Terminal/ssh/telnet/serialport/sftp client(linux, mac, win)"
arch=('x86_64')
url="https://electerm.html5beta.com/"
_ghurl="https://github.com/electerm/electerm"
license=('MIT')
depends=(
    "electron${_electronversion}"
    'python>=3'
    'java-runtime'
)
makedepends=(
    'npm'
    'git'
    'yarn'
    'nodejs'
    'gendesk'
    'python-setuptools'
    'node-gyp'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n --categories="System" --name="${pkgname%-git}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
    sed -e "61s|snap|AppImage|g" -e '58,60d' -i electron-builder.json
    yarn install --cache-folder "${srcdir}/.yarn_cache" --no-lockfile
    yarn run prepare-build
    npx node build/bin/build-linux-deb-tar
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/work/app/assets/images/${pkgname%-git}-tray@3x.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}