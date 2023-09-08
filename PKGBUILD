# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electerm-git
pkgver=r1514.02f5accc
pkgrel=1
pkgdesc="Terminal/ssh/telnet/serialport/sftp client(linux, mac, win)"
arch=('any')
url="https://electerm.html5beta.com/"
_githuburl="https://github.com/electerm/electerm"
license=('MIT')
makedepends=('npm' 'git' 'nodejs>=16.0.0' 'gendesk')
depends=('bash' 'electron22' 'glibc' 'gcc-libs' 'lib32-gcc-libs' 'python' 'lib32-glibc' 'java-runtime')
source=("${pkgname//-/.}::git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '01360154611069f84060267fe9a7b9d416a7554678bea6aa32127308979816f4')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    npm install
    npm run prepare-build
    sed "60s|snap|tar.gz|g" -i electron-builder.json
    sed '57,59d' -i electron-builder.json
    sed '16,19d' -i build/bin/build-linux-1.js
    npx node build/bin/build-linux-1.js
    asar extract "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-git}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.asar" -t "${pkgdir}/opt/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/work/app/assets/images/${pkgname%-git}.svg" \
        -t "${pkgdir}/usr/share/hicolor/scalables/apps"
    gendesk -f -n --categories "System;Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}