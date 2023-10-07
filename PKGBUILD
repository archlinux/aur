# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electronim-bin
pkgver=0.0.96
pkgrel=1
pkgdesc="A Self Contained Desktop Version Of electronim Made With Electron"
arch=('x86_64')
url="https://github.com/manusa/electronim"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25' 'libdbusmenu-glib' 'gtk2' 'dbus-glib' 'gdk-pixbuf2' 'libxext' 'dbus' 'glibc' 'libx11' 'glib2')
makedepends=('squashfuse')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${CARCH}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('0d2f5e797bbb695e98eb2d5bfbf10ec59e9560fe948e76eee10e1072ecb7b8a1'
            'cd1ded3da68ea90e137b4408f9c2143948fa35e080f0173200518503b81d9690')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/opt/${pkgname%-bin}/usr/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}