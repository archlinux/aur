# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bbg-bin
pkgver=20231016
pkgrel=1
pkgdesc="A static blog generator based on Electron Technology"
arch=('aarch64' 'x86_64')
url="https://bbg.nekomoe.xyz/"
_githuburl="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron27')
makedepends=('squashfuse')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/bbg-contributors/bbg/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('436a6d536138f203ac333858cff92a568be62797752b3adb94bcaa0f6ffe7ef6'
            '0a4a68bb5e237e3b0f40cac1a882f1604ce4c1061add3d74933acca9453de4e8')
sha256sums_aarch64=('402275c6b980f1c11853dae3139cd4fca4ebc618d412d09db308e0a71f20e61a')
sha256sums_x86_64=('de9b0968e1161bd4bf72e53fa3bec137593486978c20804b4110808998e083bc')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    chmod a+x "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage"
    "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage" --appimage-extract > /dev/null
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage|${pkgname%-bin}|g;s|/usr/share/icons/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/opt/${pkgname%-bin}/usr/lib"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}