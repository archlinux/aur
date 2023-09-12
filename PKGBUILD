# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: aulonsal <seraur at aulonsal dot com>
pkgname=dbgate-bin
pkgver=5.2.6
pkgrel=4
pkgdesc="Database manager for MySQL, PostgreSQL, SQL Server, MongoDB, SQLite and others. Runs under Windows, Linux, Mac or as web application"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://dbgate.org/"
_githuburl="https://github.com/dbgate/dbgate"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('asar')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_arm64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_armv7l.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_x86_64.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/dbgate/dbgate/v${pkgver}/LICENSE"
	"${pkgname%-bin}.sh")
sha256sums=('4ba7d897a31d45781b6bbc0b87e9a241873d61fff657af2f0c54608f652d235b'
            'b9185d6ca76cd143d4b74f3f79dfc4dc84c2a760719c32a58ecd891248dff2ec')
sha256sums_aarch64=('31f496aba3184e978faa6ad845637b9495f097d9cd0b017b8ee7004ed939350c')
sha256sums_armv7h=('1729dbb58eb4cbe28d55b97b8a5486c95a5ec9baf3b703cfab450e669cbe957c')
sha256sums_x86_64=('070e7e31a617b8e4f50f9cf7708993a12e8075dfed0f0cbdaff6fb32cbe2c941')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}