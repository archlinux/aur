# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quicknote
pkgver=2.0.1
pkgrel=2
pkgdesc="Helps to paste some random text or take some notes right from your taskbar!"
arch=('x86_64')
url="https://srilakshmikanthanp.github.io/quicknote/"
_ghurl="https://github.com/srilakshmikanthanp/quicknote"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron22'
)
makedepends=(
    'gendesk'
    'npm'
    'yarn'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '7eb797ecd49936f493a1444e48591cd51c464f4ee590e3a2750808980d5be6ea')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    rm -rf package-lock.json yarn.lock
    yarn install --no-lockfile
    yarn package
    cp -r "${srcdir}/${pkgname}-${pkgver}/assets" "${srcdir}/${pkgname}-${pkgver}/out/quicknote-linux-x64/resources/app"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/quicknote-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/out/quicknote-linux-x64/resources/${pkgname}".* -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/images/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}