# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=maa-x-bin
_pkgname=Maa-X
pkgver=2.0.0_beta.14
_electronversion=25
pkgrel=4
pkgdesc="MAA GUI with Electron & Vue3"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.maa.plus/"
_ghurl="https://github.com/MaaAssistantArknights/MaaX"
license=("AGPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'android-sdk-platform-tools'
    'python'
    'perl'
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-arm64-${pkgver//_/-}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux-x64-${pkgver//_/-}.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('d4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
sha256sums_aarch64=('d0a59e9b51e9087fe5ed4a26255bb55cf8a7c373bbfba0b22b76b2249e50f171')
sha256sums_x86_64=('fd314076dab798f9121002d1f06fc514253c39614b4bbe3a5844cab8182d2953')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories "Game" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux"-*/resources/app "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux"-*/resources/app/dist/renderer/assets/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}