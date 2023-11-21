# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=passbox
pkgver=1.0.0
pkgrel=2
pkgdesc="A versatile toolbox primarily designed for password management and note-taking."
arch=('x86_64')
url="https://github.com/zzk13180/passbox"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'electron24'
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'npm'
    'pnpm>=8.7.6'
    'nodejs>=20.6.3'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '3243538d610f6d2a73d07a72471f8f57036c6f1324ebbaac3c75bb229b13ec62')
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp src/app/services/userState.service.ts src/app/services/userstate.service.ts
    pnpm i
    pnpm build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 24x24 64x64 256x256 512x512;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/assets/icons/favicon.${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/assets/icons/favicon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}