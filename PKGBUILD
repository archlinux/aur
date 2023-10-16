# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aliyun-adrive-bin
pkgver=4.9.12
pkgrel=1
pkgdesc="Aliyun aDrive阿里云盘"
arch=('x86_64')
url="https://www.aliyundrive.com"
license=('custom')
conflicts=("${pkgname%-bin}" "deepin-wine-adrive" "adrive")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron')
makedepends=('asar' 'gendesk' 'p7zip')
source=("${pkgname%-bin}-${pkgver}.exe::https://cdn.aliyundrive.net/downloads/apps/desktop/aDrive.exe"
    "LICENSE.html::https://terms.alicdn.com/legal-agreement/terms/suit_bu1_alibaba_group/suit_bu1_alibaba_group202102022125_53871.html"
    "${pkgname%-bin}.sh")
sha256sums=('1d94f845dd110e47ea6417d0ca9cec0b5663871ff7d6185ed7e7449281263057'
            'b6aa1fd4abf1ded8b208321fbaa73c083cf1376535b385217e3c96f62cbf9a91'
            '199a4317fb0a1be3cf359b7f6eb3ce99363d350753608a0c4d87a57891b2a259')
build() {
    gendesk -q -f -n --categories "Network" --name "${pkgname%-bin}阿里云盘" --exec "${pkgname%-bin}"
    mkdir -p "${srcdir}/tmp"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.exe" -o"${srcdir}/tmp"
    asar e "${srcdir}/tmp/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/tmp/resources/app.asar.unpacked" "${srcdir}"
    cp -r "${srcdir}/tmp/resources/resource/common/audio" "${srcdir}/app.asar.unpacked/resource"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/tmp/resources/resource/common/audio/transfer-finished.mp3" -t "${pkgdir}/opt/${pkgname%-bin}/resources/resource/common/audio"
    install -Dm644 "${srcdir}/app.asar.unpacked/resource/win32/"*.* -t "${pkgdir}/opt/${pkgname%-bin}/resources/resource/win32"
    install -Dm644 "${srcdir}/app.asar.unpacked/resource/common/icon@512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}