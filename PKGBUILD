# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electerm-git
pkgver=1.37.16.r0.g76ce47d9
_electronversion=26
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
    'nodejs'
    'gendesk'
    'python-setuptools'
)
source=(
    "${pkgname%-git}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '77191a31f26538ee07706723db533a5d829878e1aa2e838c63dc03a2bf6c3c12')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --categories "System;Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    sed "s|@electronversion@|${_electronversion}|" -i "${srcdir}/${pkgname%-git}.sh"
    cd "${srcdir}/${pkgname%-git}"
    sed "s|pre-test|prepare-test|g" -i package.json
    sed -e "60s|snap|tar.gz|g" -e '57,59d' -i electron-builder.json
    sed '16,19d' -i build/bin/build-linux-deb-tar.js
    rm -rf build/bin/build-linux-rpm-snap.js
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    npm install
    npm run prepare-build
    npm run release
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