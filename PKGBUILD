# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ulogviewer-bin
_pkgname=ULogViewer
pkgver=4.0.10.811
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
            '976e2ca469e5c1924df36ea0ef4475d529b2bd876d367384815c0941d6e05496')
sha256sums_aarch64=('fd6d8dbf66ad9eaf02a75681a4f43611dba68376749bd6e8fb6886d26b2c2da4')
sha256sums_x86_64=('50079c3d85d8c98ee8f659783865b543dc7a82f452bc8659063424208219d681')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/opt/${pkgname%-bin}"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    chmod 755 "${srcdir}/opt/${pkgname%-bin}/${_pkgname}"
    rm -rf "${srcdir}/opt/${pkgname%-bin}/__MACOSX"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}