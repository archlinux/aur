# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=elevate-git
pkgver=r4063.ba534053
pkgrel=1
pkgdesc="A sport app to "Elevate" your training experience and goals! Track your fitness and progressions over time. Analyse deeper your activities. And more..."
arch=('any')
url="https://thomaschampagne.github.io/elevate-docs/"
_githuburl="https://github.com/thomaschampagne/elevate"
license=('MIT')
makedepends=('npm' 'git' 'nodejs>=16' 'gendesk')
depends=('bash' 'electron17' 'hicolor-icon-theme')
source=("git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '6abbee57f24ea2af0a67dab357ba0b4961cafcd319040411ea3195c7e7706b74')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${pkgname%-git}"
    npm install
    cd "${srcdir}/${pkgname%-git}/desktop"
    npm run build:package:linux
}
package() {
    asar extract "${srcdir}/${pkgname%-git}/desktop/package/linux-unpacked/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/${pkgname%-git}/desktop/package/linux-unpacked/resources/app.asar.unpacked" "${srcdir}"
    asar pack "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-git}.asar"
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.asar" -t "${pkgdir}/opt/${pkgname%-git}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname%-git}/desktop/package/.icon-set/icon_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    gendesk -f -n --categories "Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
