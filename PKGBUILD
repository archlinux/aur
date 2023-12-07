# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bbg-bin
pkgver=20231016
_electronversion=27
pkgrel=2
pkgdesc="A static blog generator based on Electron Technology"
arch=(
    'aarch64'
    'x86_64'
)
url="https://bbg.nekomoe.xyz/"
_ghurl="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
)
makedepends=(
    'squashfuse'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/bbg-contributors/bbg/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('436a6d536138f203ac333858cff92a568be62797752b3adb94bcaa0f6ffe7ef6'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
sha256sums_aarch64=('402275c6b980f1c11853dae3139cd4fca4ebc618d412d09db308e0a71f20e61a')
sha256sums_x86_64=('de9b0968e1161bd4bf72e53fa3bec137593486978c20804b4110808998e083bc')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
    chmod a+x "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage"
    "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage" --appimage-extract > /dev/null
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage|${pkgname%-bin}|g;s|/usr/share/icons/${pkgname%-bin}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}