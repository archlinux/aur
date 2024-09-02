# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ulogviewer-bin
_pkgname=ULogViewer
pkgver=4.0.11.901
pkgrel=1
pkgdesc="Cross-Platform Universal Log Viewer."
arch=(
    'aarch64'
    'x86_64'
)
url="https://carina-studio.github.io/ULogViewer/"
_ghurl="https://github.com/carina-studio/ULogViewer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'dotnet-runtime'
    'fontconfig'
)
makedepends=(
    'gendesk'
)
optdepends=(
    'azure-cli'
    'android-sdk-platform-tools'
    'git'
    'libimobiledevice'
)
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.zip")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x64.zip")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/carina-studio/ULogViewer/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('4b023d792eb6b929311286a207c6493e18875bd9d320db8f7a996dd5d5716fea'
            '08c0a423317a93a254a6d6fbcb0575e8dde202ce46f5126dbf03eb58e02c8851')
sha256sums_aarch64=('89e37db9c2b29c53dc94352b9f4723ad7c8c04a446d0c5724a38c3991e517f62')
sha256sums_x86_64=('29dde51b5f919dfe615f74350800734ab4cce6644a824506e50df2e407190839')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    chmod 755 "${srcdir}/usr/lib/${pkgname%-bin}/${_pkgname}"
    rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/__MACOSX"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}