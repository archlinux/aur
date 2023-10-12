# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quicknote
pkgver=2.0.1
pkgrel=1
pkgdesc="Helps to paste some random text or take some notes right from your taskbar!"
arch=('x86_64')
url="https://srilakshmikanthanp.github.io/quicknote/"
_githuburl="https://github.com/srilakshmikanthanp/quicknote"
license=('MIT')
conflicts=("${pkgname}")
depends=('bash' 'electron22')
makedepends=('gendesk' 'npm' 'yarn' 'asar')
source=("${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/v${pkgver}.zip"
    "${pkgname}.sh")
sha256sums=('da26ce6469649434b5cf024bd1d5cc6c927e5bdbdd5c92d0001f28569cdb44a3'
            '7eb797ecd49936f493a1444e48591cd51c464f4ee590e3a2750808980d5be6ea')
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    rm -rf package-lock.json yarn.lock
    yarn
    yarn package
    cp -r "${srcdir}/${pkgname}-${pkgver}/assets" "${srcdir}/${pkgname}-${pkgver}/out/quicknote-linux-x64/resources/app"
    asar p "${srcdir}/${pkgname}-${pkgver}/out/quicknote-linux-x64/resources/app" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/quicknote-linux-x64/resources/${pkgname}".* -t "${pkgdir}/opt/${pkgname}/resources"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/images/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}