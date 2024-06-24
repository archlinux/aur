# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: aulonsal <seraur at aulonsal dot com>
pkgname=dbgate-bin
pkgver=5.3.1
_electronversion=30
pkgrel=1
pkgdesc="Database manager for MySQL, PostgreSQL, SQL Server, MongoDB, SQLite and others. Runs under Windows, Linux, Mac or as web application"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://dbgate.org/"
_ghurl="https://github.com/dbgate/dbgate"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_arm64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_armv7l.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_x86_64.AppImage")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/dbgate/dbgate/v${pkgver}/LICENSE"
	"${pkgname%-bin}.sh"
)
sha256sums=('4ba7d897a31d45781b6bbc0b87e9a241873d61fff657af2f0c54608f652d235b'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('433d15036a474fc9aec3d45d2e0ed8df0de6277b9b167a9fe1d99f7597672472')
sha256sums_armv7h=('f4eff17eb1dacc1dff1d127751498e25d1077309d9f7fbf71ce8320d34af4cc2')
sha256sums_x86_64=('1ffd936fa6673ba2c9c7eaeffc00dd22d69130ff79c781b794f34ad2c6d99fd2')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}