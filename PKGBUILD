# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=knowledge-canvas-bin
_appname=Knowledge
pkgver=0.8.4
_electronversion=26
pkgrel=2
pkgdesc="A tool for saving, searching, accessing, and exploring all of your favorite websites, documents and files."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/KnowledgeCanvas/knowledge"
_downurl="https://knowledge-canvas.s3.us-west-2.amazonaws.com"
license=('Apache')
depends=(
    "electron${_electronversion}"
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_downurl}/${_appname}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_downurl}/${_appname}-${pkgver}.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
sha256sums_aarch64=('fac7304e9c9c91b2f14533e688c07a864b387f64b6d74d89c12556d01a71e85e')
sha256sums_x86_64=('a798d748546321958472114c96924f17f32a312ae85f66ddcf7313b97c5b6046')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|Education|Education;Utility|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}