# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Polarian <polarian@polarian.dev>
# Contributor: Holger Schramm <dev@strace.it>
pkgname=mingo-bin
_pkgname=Mingo
pkgver=1.13.5
_electronversion=27
pkgrel=1
pkgdesc="A proprietary MongoDB GUI based on electron from developers for developers"
arch=(
    'aarch64'
    'x86_64'
)
url="https://mingo.io"
_ghurl="https://github.com/mingo-app/mingo"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libsecret'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}.html::${url}/eula"
    "${pkgname%-bin}.sh"
)
sha256sums=('eef8a290e343ee814884f1f2f7c1fabeff6f96a4ab9aac856256cda6d2f7d718'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
sha256sums_aarch64=('fd6a0c03d3de97c51021a3bf833d527be8db092cc8cabada36b679ab74919cf3')
sha256sums_x86_64=('af92ee85287d8bd8f57f71568121a7cd866880346c1edf961022191cd98bbf35')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}