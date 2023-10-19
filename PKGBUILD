# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=elevate-git
pkgver=7.0.0.beta.5.r7.gba534053
pkgrel=1
pkgdesc="A sport app to 'Elevate' your training experience and goals! Track your fitness and progressions over time. Analyse deeper your activities. And more..."
arch=('any')
url="https://thomaschampagne.github.io/elevate-docs/"
_githuburl="https://github.com/thomaschampagne/elevate"
license=('MIT')
depends=('bash' 'electron17' 'hicolor-icon-theme')
makedepends=('npm' 'git' 'nodejs>=16' 'gendesk')
source=("${pkgname//-/.}::git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '56d7c956d9b4e37347d3218d2634a1a2580942a546ddb957c47c6294991ea963')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    printf "%s" "$(git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//g')"
}
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname//-/.}"
    npm install
    cd "${srcdir}/${pkgname//-/.}/desktop"
    npm run build:package:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/desktop/package/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-git}/resources"
    cp -r "${srcdir}/${pkgname//-/.}/desktop/package/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname%-git}/resources"
    install -Dm644 "${srcdir}/${pkgname//-/.}/desktop/package/linux-unpacked/swiftshader/"* -t "${pkgdir}/opt/${pkgname%-git}/swiftshader"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/desktop/package/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}