# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electerm-git
pkgver=r1582.d103404c
pkgrel=1
pkgdesc="Terminal/ssh/telnet/serialport/sftp client(linux, mac, win)"
arch=('any')
url="https://electerm.html5beta.com/"
_githuburl="https://github.com/electerm/electerm"
license=('MIT')
makedepends=('npm' 'git' 'nodejs>=16.0.0' 'gendesk')
depends=('bash' 'electron26' 'glibc' 'gcc-libs' 'lib32-gcc-libs' 'python' 'lib32-glibc' 'java-runtime')
source=("${pkgname//-/.}::git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'a7642e40fc6e1d01926c8f628821735ca7c6bb30d723e379c98dd44b2abe3b33')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    sed "60s|snap|tar.gz|g" -i electron-builder.json
    sed '57,59d' -i electron-builder.json
    sed '16,19d' -i build/bin/build-linux-deb-tar.js
    #npx node build/bin/build-linux-deb-tar.js
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
        -t "${pkgdir}/usr/share/hicolor/scalables/apps"
    gendesk -f -n --categories "System;Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}