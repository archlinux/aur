# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electerm-git
pkgver=1.37.80.r1.gf0419ac4
_electronversion=26
_nodeversion=18
pkgrel=1
pkgdesc="Terminal/ssh/telnet/serialport/sftp client(linux, mac, win)"
arch=('any')
url="https://electerm.html5beta.com/"
_ghurl="https://github.com/electerm/electerm"
license=('MIT')
depends=(
    "electron${_electronversion}"
    'lib32-glibc'
    'lib32-gcc-libs'
    'python'
    'java-runtime'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'python-setuptools'
)
source=(
    "${pkgname%-git}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
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
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "System;Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
    sed "s|pre-test|prepare-test|g" -i package.json
    sed -e "60s|snap|tar.gz|g" -e '58,60d' -i electron-builder.json
    sed '16,19d' -i build/bin/build-linux-deb-tar.js
    rm -rf build/bin/build-linux-rpm-snap.js
    npm install
    npm run prepare-build
    npm run release -l
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/work/app/assets/images/${pkgname%-git}.svg" \
        -t "${pkgdir}/usr/share/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}