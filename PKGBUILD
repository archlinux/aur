# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ulogviewer-bin
_pkgname=ULogViewer
pkgver=4.1.2.1110
pkgrel=1
pkgdesc="Cross-Platform Universal Log Viewer.(Prebuilt version)"
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
sha256sums_aarch64=('c4e1589fba2979ae11cab6b51041566043371343eb004d652e51e101f467ede3')
sha256sums_x86_64=('a20c8e1cdeb6eac76aa09b1516b12e3ad91a7bb025d357348cc9445024ae473c')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    chmod 755 "${srcdir}/usr/lib/${pkgname%-bin}/${_pkgname}"
    rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/__MACOSX"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}