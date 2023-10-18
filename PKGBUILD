# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electerm-git
pkgver=1.34.30.r113a7cfa
pkgrel=1
pkgdesc="Terminal/ssh/telnet/serialport/sftp client(linux, mac, win)"
arch=('any')
url="https://electerm.html5beta.com/"
_githuburl="https://github.com/electerm/electerm"
license=('MIT')
depends=('bash' 'electron26')
makedepends=('npm' 'git' 'nodejs>=16.0.0' 'gendesk')
source=("${pkgname//-/.}::git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'a7642e40fc6e1d01926c8f628821735ca7c6bb30d723e379c98dd44b2abe3b33')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    printf "%s.r%s" "$(git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//g')" "$(git rev-parse --short HEAD)"
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
    asar extract "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-git}/resources"
    install -Dm644 "${srcdir}/${pkgname//-/.}/work/app/assets/images/${pkgname%-git}.svg" \
        -t "${pkgdir}/usr/share/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
