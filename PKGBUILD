# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electerm-git
_pkgver=1.34.63
pkgver=1.34.63.r0.g68fb0291
pkgrel=1
pkgdesc="Terminal/ssh/telnet/serialport/sftp client(linux, mac, win)"
arch=('any')
url="https://electerm.html5beta.com/"
_githuburl="https://github.com/electerm/electerm"
license=('MIT')
depends=(
    'bash'
    'electron26'
    'lib32-glibc'
    'lib32-gcc-libs'
    'python'
)
makedepends=(
    'npm'
    'git'
    'nodejs>=18.0.0'
    'gendesk'
)
source=(
    "${pkgname//-/.}::git+${_githuburl}.git#tag=v${_pkgver}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '897293c8ec9302f5b69d333f2467a597c6010cee782f0df6c27489cf13345ae7')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --categories "System;Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname//-/.}"
    sed -e "60s|snap|tar.gz|g" -e '57,59d' -i electron-builder.json
    sed '16,19d' -i build/bin/build-linux-deb-tar.js
    rm -rf build/bin/build-linux-rpm-snap.js
    sed "s|pre-test|prepare-test|g" -i package.json
    npm install
    npm run prepare-build
    npm run release
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/work/app/assets/images/${pkgname%-git}.svg" \
        -t "${pkgdir}/usr/share/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}