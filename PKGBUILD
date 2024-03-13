# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: qlrd <qlrddev at gmail dot com>
pkgname=krux-installer-bin
_pkgname="org.selfcustody.${pkgname%-bin}"
pkgver=0.0.12
_electronversion=29
pkgrel=1
pkgdesc="A GUI based application to flash Krux firmware on K210 based devices.Use system-wide electron."
arch=('x86_64')
url="https://github.com/selfcustody/krux-installer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libx11'
    'gdk-pixbuf2'
    'gtk2'
    'java-runtime'
    'startup-notification'
    'gconf'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"    
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/selfcustody/krux-installer/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('125a49b11c50a09738a84de8265e35efb44addd658a84d19022d6378fe826a9f'
            '29eee3e9d9c5dd67213ec3ab4a7eef57a1224750e2e9aab3a278177a9444a355'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${pkgname%-bin}/||g;s|org.selfcustody.${pkgname%-bin}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}